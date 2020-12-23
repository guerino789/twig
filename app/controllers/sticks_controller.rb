
class SticksController < ApplicationController
    
    before_action :authenticate_user!, except: [:index]
  
    def index 
        #byebug
           @sticks = current_user.sticks.all
    end     

    def show 
        @stick = Stick.find(params[:id])
    end

    def new
        @stick = Stick.new(stick_params)
    end
    def create
        @stick = Stick.new(stick_params)
        if @stick.save
            redirect_to stick_path(@stick)
        else
            render :new
        end
    end

    def edit 
        @stick = Stick.find(params[:id])
    end

    def update
        @stick = Stick.find(params[:id])
        if @stick.update(stick_params)
            redirect_to @stick
        else
            render :edit
        end
    end



    private 

    def authorize_user 
        #byebug
        @user = User.find(params[:id])
        redirect_to root_url unless current_user == @user
      end
    

    def stick_params
        params.require(:stick).permit(:brand, :model, :size, :flex, :user_id)
    end 
end
