require 'test_helper'

describe User do
  
  def valid_params
    { email: "john@example.com", password: "akkdioak" }
  end
  
  it "is valid with valid params" do
    user= User.new valid_params
    assert user.valid?, "can't create with valid params: #{user.errors.messages}"
  end
  
  it "is invalid without an email" do
    params = valid_params.clone
    params.delete :email
    user =  User.new params
    
    user.wont_be :valid? 
    user.errors[:email].must_be :present?
  end
  
  
end