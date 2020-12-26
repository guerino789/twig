class Stick < ApplicationRecord
    has_many :reviews, dependent: :destroy 
    has_many :users, through: :reviews
    belongs_to :user

    validates :brand, :model, :size, :flex, presence: true
    
    
    accepts_nested_attributes_for :users


end
