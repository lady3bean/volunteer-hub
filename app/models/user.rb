class User < ActiveRecord::Base
  has_secure_password

  has_many :reg_forms
end