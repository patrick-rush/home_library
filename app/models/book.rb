class Book < ActiveRecord::Base
    belongs_to :user
    belongs_to :genre
    has_many :notes
    
    validates :title, presence: true
end
