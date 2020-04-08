class EstimateMailer < ApplicationMailer

    def new_estimate_email
        @estimate = estimate
        @driving_time = "#{@estimate.driving_time} hours"
        @customer = @estimate.customer
        mail(to: 'nicoledowdev@gmail.com', subject: 'New Estimate')
    end
end
