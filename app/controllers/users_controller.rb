class UsersController < ApplicationController
    def show 
        @user = User.find_by(id: params[:id])
    end

    def sticks
        @sticks = Stick.where(user_id: current_user.id) 
        render "sticks/index"
    end

    # def stick 
    #     @stick = Stick.find(params[:id])
    #     render "sticks/show"
    # end

   
end