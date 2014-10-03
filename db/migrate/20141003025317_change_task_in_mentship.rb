class ChangeTaskInMentship < ActiveRecord::Migration
  def change
    remove_column :mentships, :task, :string
  end
end
