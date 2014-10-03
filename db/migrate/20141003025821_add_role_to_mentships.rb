class AddRoleToMentships < ActiveRecord::Migration
  def change
    add_column :mentships, :role, :string
  end
end
