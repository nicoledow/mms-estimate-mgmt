class EstimatesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @estimates = Estimate.all
    end

    def create
        new_customer = Customer.create(
            name: params[:customerName],
            phone: params[:customerPhone],
            email: params[:customerEmail]
        )
        new_estimate = Estimate.create(
            starting_city: params[:startingCity],
            starting_state: params[:startingState],
            destination_city: params[:destinationCity],
            destination_state: params[:destinationState],
            bedrooms: params[:numOfBedrooms],
            floors: params[:numOfFloors],
            parking_type: params[:parkingDistance],
            customer_id: new_customer.id
        )
        new_quote = Estimate.generate_quote(new_estimate)
        new_estimate.quote = new_quote
        new_estimate.save

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
end