# Load the Rails application.
require_relative 'application'
require 'mail'
require 'dotenv-rails'

# Initialize the Rails application.
Rails.application.initialize!


# config.action_mailer.delivery_method = :smtp
# config.action_mailer.smtp_settings = {
#   address: 'smtp.gmail.com',
#   port: 587,
#   domain: 'millennialmovingsolutions.com',
#   user_name: ENV['GMAIL_USERNAME'],
#   password: ENV['GMAIL_PW'],
#   authentication: 'plain',
#   enable_starttls_auto: true 
# }
