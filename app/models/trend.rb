class Trend < ApplicationRecord
  # Add validations as needed
  validates :idTag, :tag, :idType, :tagType, :articles, presence: true
end
