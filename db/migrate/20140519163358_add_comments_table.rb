class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, default: 'Anonymous'
      t.text :body, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
