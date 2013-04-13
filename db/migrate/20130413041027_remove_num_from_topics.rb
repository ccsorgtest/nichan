class RemoveNumFromTopics < ActiveRecord::Migration
  def up
    remove_column :topics, :num
  end

  def down
    add_column :topics, :num, :integer
  end
end
