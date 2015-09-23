class FollowUpForm < ActiveRecord::Base
  belongs_to :user

  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  validates :email, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true, uniqueness: true

end
