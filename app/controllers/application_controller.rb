class ApplicationController < ActionController::Base
    helper_method :current_stick
    def current_stick
        #binding.pry
        @current_stick = Stick.find_by(params[:id])
    end
end
