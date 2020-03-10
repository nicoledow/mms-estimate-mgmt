class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['MMS_EMAIL']}"
  layout 'mailer'
end
