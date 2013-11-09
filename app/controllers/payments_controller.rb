class PaymentsController < ApplicationController
  
  skip_before_action :authenticate_user!,
  only: [:new, :create]
  
  def new 
    @product = Product.find_by!(permalink: params[:permalink])
  end
  
  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @product = @sale.product
  end
  
  def create
    product = Product.find_by!(permalink: params[:permalink])
  
    token = params[:stripeToken]
    
    begin
      charge = Stripe::Charge.create(
      amount:      product.price,
      currency:    "usd",
      card:        params[:stripeToken],
      description: params[:email]
       )
       
       @sale = product.sales.create!(
       product_id: product.id,
       email:       params[:email]
       )
       
       redirect_to pickup_url(guid: @sale.guid)
     rescue Stripe::CardError => e
       #the card has been declined or some other occured
       @error = e
       render :new
     end
   end
   
   
   def download 
     @sale = Sale.find_by!(guid: params[:guid])
     resp = HTTParty.get(@sale.product.file.url)
     
     filename = @sale.product.file.url
     
     send_data resp.body,
       :filename => File.basename(filename),
       :content_type => resp.headers['Content-Type']
   end
 end
 
   