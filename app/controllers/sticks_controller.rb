
class SticksController < ApplicationController
    
    before_action :authenticate_user!, except: [:index]
   

    def index 
        @sticks = Stick.all
    end    

    def show 
        
        @stick = Stick.find(params[:id])
    end

    def new
        @stick = Stick.new
    end

    def create
        #byebug
            @stick = Stick.new(stick_params)
            if @stick.save
                redirect_to stick_path(@stick)
            else
                render :new
        end
    end
    # (stick_params.merge({:user_id => current_user.id}))
    def edit
        @stick = Stick.find(params[:id])
      
    end

    def update
        binding.pry
        @stick = Stick.find(params[:id])
        if @stick.update(stick_params)
            redirect_to @stick
        else
            render :edit
        end
    end

    def destroy
        binding.pry
        @stick = Stick.find(params[:id])
        @stick.destroy
        redirect_to  user_path(:user_id), notice: "Stick Deleted!!!"      
    end



    private 

    def set_stick
        current_stick = @stick.id
    end

    
    

    def stick_params
        params.require(:stick).permit(:brand, :model, :size, :flex, :user_id)
    end 
end
