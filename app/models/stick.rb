class Stick < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :user
    
    
    accepts_nested_attributes_for :users
end
