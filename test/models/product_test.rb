require 'test_helper'

describe Product do
  
  def valid_params
    { name: "akkdio", permalink: "akkdio1", description: "this is the best", price: 500 }
    
  end
  
  it "is valid with valid params" do
    product = Product.new valid_params
    assert product.valid?, "Can't create with valid params: #{product.errors.messages}"
    end
end
     