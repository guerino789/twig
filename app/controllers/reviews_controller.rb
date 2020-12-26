class ReviewsController < ApplicationController
   
    def index
       #binding.pry
        @reviews = Review.newest_first
    end

    def show 
        # binding.pry
        @review = Review.find_by(id: params[:id])
    end

    def new
        @review = Review.new
        
        @stick = Stick.find_by(id: params[:stick_id])
        
    end

    def create
        @review = Review.create(review_params)
        if @review.save
            redirect_to stick_path(@review.stick)
        else
            render :new
        end
        #review_params.merge({user_id:current_user.id})
    end

    def edit
        #binding.pry
        @stick = Stick.find_by(id: params[:stick_id])
        @review = Review.find(params[:id])
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

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to sticks_path, notice: "Review deleted!!!"
    end
 
    private 


    def review_params
        params.require(:review).permit(:review, :user_id, :stick_id)
    end
end