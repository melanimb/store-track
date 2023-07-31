class Client < ApplicationRecord
  belongs_to :store

  has_many :sales

  def full_name
    "#{name} #{surname}"
  end
end
