class EstimatesController < ApplicationController

    def index
        @estimates = Estimate.all
    end

end