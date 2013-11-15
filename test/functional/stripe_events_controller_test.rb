class StripeEventsControllerTest < ActionController::TestCase
  
  
  setup do
    Stripe.api_key = 'sk_fake_api_key'
    
  end
  
  test 'charge created' do
    event_id = 'fake_event_id'
    product = Product.create(price: 100, name: 'foo')
    sale =  Sale.create(stripe_id: 'abc123', amount: 100, email: 'foo@bar.com', product: product)
    
    mock_event = mock
    mock_data = mock
    mock_charge = mock
    
    mock_event.expects(:data).returns(mock_data)
    mock_data.expects(:object).return(mock_charge)
    mock_charge.expects(:id).returns('abc123').at_least_once
    mock_charge.expects(:amount).returns(100)
    
    Stripe::Event.expects(:retrieve).with(event_id).at_least_once.returns(mock_event)
    post :create, id: event_id, type: 'charge.succeeded'
  end
end
