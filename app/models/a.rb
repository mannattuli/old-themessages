class A < ApplicationRecord
    belongs_to :user
    belongs_to :board
    has_many :comments
    validates :body, :subject, presence: true
    validates :body, length: { minimum: 20, maximum: 500 }
    validates :subject, length: { minimum: 6, maximum: 80 }
    validates :image, length: { maximum: 30 }
end
