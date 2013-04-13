class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :topic_id
      t.integer :num
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
