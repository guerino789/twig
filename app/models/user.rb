class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # <---- LESSON ---->
         # Step Fourteen:
         # Add omniauthable and pass in which ever providers you are using here.
         :omniauthable, omniauth_providers:[:github]



  has_many :reviews
  has_many :sticks, through: :reviews

  accepts_nested_attributes_for :sticks

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
