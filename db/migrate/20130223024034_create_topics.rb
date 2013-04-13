class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :num
      t.string :title

      t.timestamps
    end
  end
end
