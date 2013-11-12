require 'test_helper'

describe Product do
  
  def valid_params
    { name: "akkdio", permalink: "akkdio1", description: "this is the best", price: 50 }
    
  end
  
  it "is valid with valid params" do
    product = Product.new valid_params
    assert product.valid?, "Can't create with valid params: #{product.errors.messages}"
    end
    
    it "is invalid without a price above 50 cents" do
      product = Product.new valid_params
      product.price = 49
      assert product.invalid?, "You have to have a product worth more than 50 cents: #{product.errors.messages}"
    end
end
     