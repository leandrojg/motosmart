class User < ApplicationRecord
  before_create :generate_uuid
  before_create :generate_token
  has_secure_password

  has_many :records

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  private

  def generate_uuid
    self.id = SecureRandom.uuid
  end

  def generate_token
    self.token = SecureRandom.uuid
  end
end