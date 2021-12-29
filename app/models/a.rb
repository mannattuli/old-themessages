class A < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :body, :subject, presence: true
    validates :body, length: { maximum: 500 }
    validates :subject, length: { maximum: 100 }
    validates :image, length: { maximum: 30 }
end
