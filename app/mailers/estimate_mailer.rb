class EstimateMailer < ApplicationMailer

    def new_estimate_email
        @estimate = params[:estimate]
    end
end
