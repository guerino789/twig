class SticksController < ApplicationController
    #before_action :logged_in?
    def index 
        @sticks = Stick.all
    end

    def new 
        # @wine = Wine.find(params[:id])
        # @review = Review.new
        @stick = Stick.new
    end 

    def create
        @stick = Stick.new(stick_params)
        
        if @stick.save
            redirect_to sticks_path(@stick)
        else
            render :new
        end
    end



    private 
    

    def stick_params
        params.require(:stick).permit(:brand, :model, :size, :flex)
    end 
end
