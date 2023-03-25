class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  
  has_many :post_comments, dependent: :destroy
end
