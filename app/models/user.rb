class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 attachment :profile_image
 has_many :books, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :book_comments, dependent: :destroy
 has_many :relationships, class_name: "Relationship", foreign_key: :following_id
 has_many :followings, through: :relationships, source: :follower
 has_many :reverse_relationships, class_name: "Relationship", foreign_key: :following_id
 has_many :followers, through: :reverse_relationships, source: :following
 validates :name, uniqueness: true, length: {in: 2..20}
 validates :introduction, length: {maximum: 50}
end
