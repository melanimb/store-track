class Client < ApplicationRecord
  belongs_to :store

  def full_name
    "#{name} #{surname}"
  end
end
