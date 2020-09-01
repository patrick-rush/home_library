class User < ActiveRecord::Base
    has_many :books

    has_secure_password
    
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :password_digest, presence: true
    # consider adding email format validation
end
