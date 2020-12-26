class Review < ApplicationRecord
    belongs_to :user
    belongs_to :stick

     validates :review, presence: true
      validates :review, length: { minimum: 5 }
    

    accepts_nested_attributes_for :stick

    #default_scope { order(created_at: :desc)}
    
    scope :newest_first, -> { order(created_at: :desc) }

    # def self.find_by_stick(stick_id)
    #     Review.where(stick_id: stick_id)
    #   end
end
