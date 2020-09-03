class Note < ActiveRecord::Base
    belongs_to :book

    validates :content, presence: true
end
