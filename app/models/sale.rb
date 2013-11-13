class Sale < ActiveRecord::Base
   has_paper_trail
   
  include AASM
  
  belongs_to :product

  before_create :populate_guid
  
 
  
  aasm column: 'state' do
    state :pending, initial: true
    state :processing
    state :finished
    state :errored
    
    event :process, after: :charge_card do
      transitions from: :pending, to: :processing
    end
    
    event :finish do
      transitions from: :processing, to: :finished
    end
    
    event :fail do
      transitions from: :processing, to: :errored
    end
  end
  
  def charge_card
    begin
      save!
      charge = Stripe::Charge.create(
      amount: self.amount,
      currency: "usd",
      card: self.stripe_token,
      description: self.email,
      )
      self.update(
      stripe_id: charge.id,
      card_expiration: Date.new(charge.card.exp_year, Charge.card.exp_month, 1),
      fee_amount: charge.fee
      )
      self.finish!
    rescue Stripe::Error => e
      self.update_attributes(error: e.message)
      self.fail!
    end
  end
  

  private

  def populate_guid
    self.guid = SecureRandom.uuid()
  end

end
