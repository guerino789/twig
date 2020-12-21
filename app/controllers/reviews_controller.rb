class ReviewsController < ApplicationController
    # before_action :require_login
    # before_action :get_wine, only: [ :index, :new]
    def index
        @reviews = Review.all
        current_user
    end

    def new 
        @review = Review.new
    end

    def create 
       @stick = Stick.find_by(id: params[:review][:stick_id])
       @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to stick_reviews_path(@review.stick)
        else
            render :new
        end
    end
 
    private 


    def review_params
        params.require(:review).permit(:review, :stick_id)
    end
end