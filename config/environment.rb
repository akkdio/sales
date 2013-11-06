# Load the Rails application.
require File.expand_path('../application', __FILE__)

app_env_variables = File.join(Rails.root, 'config', 'app_env_variables.rb')
load(app_env_variables) if File.exists?(app_env_variables)


# Initialize the Rails application.
Sales::Application.initialize!
