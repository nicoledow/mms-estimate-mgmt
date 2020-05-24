require "rest-client"

class DistancesController < ApplicationController

    def create
        start = params['start']
        destination = params['destination']
        query = RestClient.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{start}&destinations=#{destination}&mode=driving&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
        google_maps_data = JSON.parse(query)

        response = {
            "status": ''
        }

        if google_maps_data["rows"].detect { |row| row["elements"].first["status"] != "OK" }
            response["status"] = "NOT VALID"
            response = response.to_json
            render json: response
        else
            response["status"] = "VALID"
            repsonse = response.to_json
            render json: response
        end
    end

end