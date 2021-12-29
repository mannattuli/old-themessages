class User < ApplicationRecord
  has_many :as
  has_many :comments
  validates :username, presence: true
  validates :username, format: { with:  /\A[a-zA-Z0-9 ]+\z/ }
  validates :username, format: { without: /\s/, message: "username can't contain spaces" }
  validates :bio, length: { maximum: 100 }
  validates :spotify, length: { maximum: 20 }
  validates :username, length: { minimum: 4 }
  validates :username, length: { maximum: 15 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  def login
    @login || self.username || self.email
  end
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
