class Article < ApplicationRecord
  belongs_to :user
  has_many :media_articles
end
