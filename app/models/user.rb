class User < ActiveRecord::Base
    has_many :books
    has_many :notes, through: :books

    has_secure_password
    
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true

    auto_strip_attributes :first_name, strip: true
    auto_strip_attributes :last_name, strip: true
end
