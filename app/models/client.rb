class Client < ApplicationRecord
  belongs_to :store

  has_many :sales
  has_many :products, through: :sales

  def full_name
    "#{name} #{surname}"
  end
end
