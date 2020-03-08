class Estimate < ApplicationRecord
    belongs_to :customer

    def calculate_labor_cost
       if self.bedrooms == 1 || self.bedrooms == 2
         return 75 * 2 * self.estimate_time
       else
        return 75 * self.bedrooms * self.estimate_time
       end
    end

    def estimate_time
        distance = self.calculate_distance
        #multiply driving time * time factor based on parking situation and num of floors
            #will need to call Google Maps API and use rest-client
    end

    def generate_quote
        #use labor cost and time estimate to generate quote 
            #save to db if not already saved
    end
end
