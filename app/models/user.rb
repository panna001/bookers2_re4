class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 attachment :profile_image
 has_many :books, dependent: :destroy
 validates :name, uniqueness: true, length: {in: 2..20}
 validates :introduction, presence: true, length: {maximum: 200}
end
