class CreateArticleMedias < ActiveRecord::Migration[6.1]
  def change
    create_table :article_medias do |t|
      t.string  :uuid, null: false, default: UUID.generate
      t.integer :article_id
      t.string  :media_type
      t.string  :media_content

      t.timestamps
    end
  end
end
