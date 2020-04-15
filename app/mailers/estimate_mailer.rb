class EstimateMailer < ApplicationMailer

    def new_estimate_email
        @estimate = Estimate.last
        @driving_time = "#{@estimate.driving_time} hours"
        @customer = @estimate.customer
        mail(to: ENV['GMAIL_USERNAME_EMAIL'], subject: 'New Estimate')
    end
end
