class Article < ApplicationRecord 
	validates :title, presence: true, length: { minimun: 6 , maximum: 20}
	validates :description, presence: true
end