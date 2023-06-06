class User < ApplicationRecord
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  belongs_to :store, optional: :true

  before_create :create_store

  private

  def create_store
    store = Store.create(name: self.name)
    self.store_id = store.id
  end
end
