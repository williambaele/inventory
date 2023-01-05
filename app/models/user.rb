class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
  validates :discord, length: { minimum: 3, maximum: 15 }
  validates :first_name, :last_name, :email, presence: true
end
