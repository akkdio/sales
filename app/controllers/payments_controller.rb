class PaymentsController < ApplicationController
  
  skip_before_action :authenticate_user!,
  only: [:new, :create]
  
  before_filter :strip_iframe_protection
  
  def new 
    @product = Product.find_by!(permalink: params[:permalink])
  end
  
  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @product = @sale.product
  end
  
  def create
    @product = Product.find_by!(permalink: params[:permalink])
    
    
    
    sale = Sale.create(
    product_id: @product.id,
    amount:     @product.price,
    email:      params[:email],
    stripe_token: params[:stripeToken]
    )
    
    sale.process!
    
    if sale.finished?
      redirect_to pickup_url(guid: sale.guid)
    else
      flash.now[:alert] = sale.error
      render :new
    end
  end
    
=begin rdoc    
   this is the code before adding of the state machine: 
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
              
       #redirect_to pickup_url(guid: @sale.guid)
       #redirect_to root_url
     rescue Stripe::CardError => e
       #the card has been declined or some other occured
       @error = e
       render :new
     end
   end
=end    
   
   def download 
     @sale = Sale.find_by!(guid: params[:guid])
     resp = HTTParty.get(@sale.product.file.url)
     
     filename = @sale.product.file.url
     
     send_data resp.body,
       :filename => File.basename(filename),
       :content_type => resp.headers['Content-Type']
   end
   
   
   def iframe
     @product = Product.find_by!(permalink: params[:permalink])
     @sale = Sale.new(product_id: @product)
     end
     
     private
     
     def strip_iframe_protection
       response.headers.delete('X-Frame-Options')
       end
          
 end
 
   