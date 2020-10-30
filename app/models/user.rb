class User < ApplicationRecord
  acts_as_token_authenticatable

 validates :password_confirmation, presence: true, on: :create
 validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

# validates_presence_of :password_confirmation,  :message=> "fields mismatch"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable , :validatable

     def generate_new_authentication_token
     token = User.generate_unique_secure_token
     update_attributes authentication_token: token
   end
end
