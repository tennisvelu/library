class User < ApplicationRecord
    has_secure_password
    has_many :books

    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true,format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password,:length => { :minimum => 8},:if => lambda{ new_record? || !password.nil? }
end
