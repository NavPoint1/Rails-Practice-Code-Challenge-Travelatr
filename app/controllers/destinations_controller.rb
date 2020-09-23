class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @top_post = @destination.top_post
    end
end
