class Comment < ApplicationRecord
    belongs_to :a
    belongs_to :user
    validates :comment, presence: true
    validates :comment, length: { maximum: 500 }
end
