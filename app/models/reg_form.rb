class RegForm < ActiveRecord::Base
  belongs_to :user

  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
end