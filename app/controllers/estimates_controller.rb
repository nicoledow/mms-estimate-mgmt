class EstimatesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @estimates = Estimate.all
    end

    def create
        binding.pry
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