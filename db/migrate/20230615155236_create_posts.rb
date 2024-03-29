class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.string :title
      t.text :content
      t.boolean :is_draft, default: true
      t.integer :user_id

      t.timestamps
    end
  end
end
