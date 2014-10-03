class DropAssignments < ActiveRecord::Migration
  def up
    drop_table :assignments
  end

  def down
    create_table :assignments do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.string :deliverable

      t.timestamps
    end
  end
end
