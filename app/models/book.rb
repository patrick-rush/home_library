class Book < ActiveRecord::Base
    belongs_to :user
    has_many :notes
    
    validates :title, presence: true
end
