class HomeController < ApplicationController
    def index 
        if user_signed_in?
            render 'users/show'
        else 
            root_path
        end
    end
end