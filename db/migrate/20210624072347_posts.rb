class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :title
      t.string :country
      t.timestamps null: false
    end
  end
end