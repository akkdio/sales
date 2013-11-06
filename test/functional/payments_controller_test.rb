class PaymentsControllerTest < ActionController::TestCase
  
  setup do
    Stripe.api_key = 'sk_fake_test_key'
  end
  
  test "should post create" do
    token = 'tok_123456'
    email = 'foo@example.com'
    
    product = Product.create(
    permalink: 'test_product',
    price: 100
    )
    
    Stripe::Charge.expects(:create).with({
      amount: 100,
      currency: 'usd',
      card:     token,
      description: email
      
    }).return(mock)
    
    post :create, email: stripeToken: token
    
    assert_not_nil assigns(:sale)
    assert_equal product.id, assigns(:sale).product_id
    assert_equal email, assigns(:sale).email
  end
  
end
