class Client < ApplicationRecord
  has_many :dogs, dependent: :destroy
end
