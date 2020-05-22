require "rest-client"

class DistancesController < ApplicationController

    def create
        start = params['start']
        destination = params['destination']
        response = RestClient.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{start}&destinations=#{destination}&mode=driving&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
        data = JSON.parse(response)

        if data["status"] == 'OK'
            render json: "VALID"
        else
            render json: "NOT VALID"
        end
    end

end