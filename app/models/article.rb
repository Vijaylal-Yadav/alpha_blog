class Article < ApplicationRecord 
	validates :title, presence: true, length: { minimum: 6 , maximum: 20}
	validates :description, presence: true
	belongs_to :user
end