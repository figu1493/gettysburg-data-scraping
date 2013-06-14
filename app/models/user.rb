class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  # attr_accessible :title, :body


# Filter
#-------------------------------------------------------------------------------------------------------------
#

#   after_save :send_email


# # Methods
# #-------------------------------------------------------------------------------------------------------------
# #

#   def send_email
#   	UserMailer.welcome_email(@user).deliver
#   end
end
