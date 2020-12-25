class Review < ApplicationRecord
    belongs_to :user
    belongs_to :stick
    

    accepts_nested_attributes_for :stick

    # def self.find_by_stick(stick_id)
    #     Review.where(stick_id: stick_id)
    #   end
end
