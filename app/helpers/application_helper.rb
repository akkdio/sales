module ApplicationHelper
  
  
  def formatted_price(amount)
    sprint("$%0.2f", amount / 100.0)
  end
  
end
