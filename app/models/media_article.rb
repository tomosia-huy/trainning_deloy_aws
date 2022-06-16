class MediaArticle < ApplicationRecord
  mount_uploader :media_content, ArticleUploader

  belongs_to :article
end
