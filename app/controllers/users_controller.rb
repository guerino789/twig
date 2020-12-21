class UsersController < ApplicationController
    def show 
        @sticks = current_user.sticks.build
        render :show
    end

end