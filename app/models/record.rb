class Record < ApplicationRecord
  belongs_to :user

  validates :distance, presence: true, numericality: { only_integer: true, greater_than: 0 }
end