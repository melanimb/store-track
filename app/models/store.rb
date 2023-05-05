class Store < ApplicationRecord
  has_many :products
  has_many :clients
  has_many :sales
  has_many :users

  validates :name, presence: true
end
