class Book < ActiveRecord::Base
    belongs_to :user
    belongs_to :genre
    has_many :notes
    
    validates :title, presence: true

    auto_strip_attributes :title, strip: true
    auto_strip_attributes :author, strip: true
end
