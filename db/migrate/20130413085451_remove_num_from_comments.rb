class RemoveNumFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :num
  end

  def down
    add_column :comments, :num, :integer
  end
end
