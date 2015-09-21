class User < ActiveRecord::Base
  has_secure_password

  has_many :reg_forms

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end