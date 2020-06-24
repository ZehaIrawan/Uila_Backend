class Address < ApplicationRecord
  belongs_to :user
  validates :full_name, presence: true
  validates :addressline1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode,presence: true
  validates :phone, presence:true
end
