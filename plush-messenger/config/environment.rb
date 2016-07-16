# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.secrets.email_provider_username,#'your_sendgrid_username',
  :password => Rails.application.secrets.email_provider_password, #'your_sendgrid_password',
  :domain => 'localhost:3000', #'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
