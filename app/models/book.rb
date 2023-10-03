class Book < ApplicationRecord
  belongs_to :library
  belongs_to :user, foreign_key: "checked_out_by", optional: true
  validates :status, inclusion: { in: %w[available checked_out] }
end
