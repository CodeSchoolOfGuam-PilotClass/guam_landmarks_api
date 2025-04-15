class Landmark < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
