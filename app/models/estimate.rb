require "rest-client"

class Estimate < ApplicationRecord
    belongs_to :customer

    def estimated_labor_cost
       if self.bedrooms == 1 || self.bedrooms == 2
         return 75 * 2 * self.estimated_time_factor
       else
        return 75 * self.bedrooms * self.estimated_time_factor
       end
    end

    def estimated_time_factor
        case self.parking_type
        when "driveway"
            return 1
        when "10-20"
            return 1.5
        when "30-40"
            return 2
        when "farther"
            return 2.5
        else
            return 2
        end
    end

    def driving_time
        start = "#{self.starting_city}+#{self.starting_state}"
        destination = "#{self.destination_city}+#{self.destination_state}"
        response = RestClient.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{start}&destinations=#{destination}&mode=driving&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
        data = JSON.parse(response)
        driving_time = data["rows"][0]["elements"][0]["duration"]["text"] #string, ex: "1 day 16 hours"

        if driving_time.include?("day")
            days = driving_time[0].to_i
            return days * 24
        else
            parsed_time = driving_time.split(" ")
            return parsed_time[0].to_i
        end
    end

    def self.generate_quote(estimate)
        quote = estimate.estimated_time_factor * estimate.estimated_labor_cost * estimate.driving_time
        estimate.quote = quote
        estimate.save
        quote
    end
end
