class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string  :uuid, null: false, default: UUID.generate
      t.integer :user_id
      t.string  :title
      t.text    :content
      t.string  :media_type

      t.timestamps
    end
  end
end
