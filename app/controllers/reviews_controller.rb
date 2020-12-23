class ReviewsController < ApplicationController
   
    def index
        #byebug
        @review = Review.find_by(id: params[:stick_id])
    end

    def show 
        @review = Review.find(params[:id])
    end

    def new
        @review = Review.new
    end
    def create
        #try to use strong parameters
        @review = Review.new
        if @review.save
            redirect_to stick_path(@review.stick)
        else
            render :new
        end
    end

    def edit
        @stick = Stick.find(params[:stick_id])
        @review = Review.find_by(id: params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        if @review.save
            redirect_to stick_review_path
        else
            render :edit
        end
    end
 
    private 


    def review_params
        params.require(:review).permit(:review, :stick_id, :user_id, sticks_attributes: :brand )
    end
end