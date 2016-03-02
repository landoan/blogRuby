class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :avatar_link
  has_many :articles
  has_secure_password

end
