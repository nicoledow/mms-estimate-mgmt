class EstimatesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :require_login, except: [:create]

    def create
        customer = Customer.find_or_create_by(email: estimate_params[:customerEmail])
        customer.name = estimate_params[:customerName]
        customer.phone = estimate_params[:customerPhone]
        customer.save

        new_estimate = Estimate.create(
            starting_city: params[:startingCity],
            starting_state: params[:startingState],
            destination_city: params[:destinationCity],
            destination_state: params[:destinationState],
            bedrooms: params[:numOfBedrooms],
            floors: params[:numOfFloors],
            parking_type: params[:parkingDistance],
            customer_id: customer.id
        )

        new_quote = Estimate.generate_quote(new_estimate)
        new_estimate.quote = new_quote

        if new_estimate.save
            EstimateMailer.with(estimate: new_estimate).new_estimate_email.deliver_now
        end

        render json: new_estimate
    end

private
    def estimate_params
        params.permit(
            :startingCity,
            :startingState,
            :destinationCity,
            :destinationState,
            :numOfBedrooms,
            :numOfFloors,
            :elevator,
            :parkingDistance,
            :customerName,
            :customerEmail,
            :customerPhone,
        )
    end

    def require_login
        if !session[:user_id]
            redirect_to root_path
        end
    end
end