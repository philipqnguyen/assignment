class CreateMentships < ActiveRecord::Migration
  def change
    create_table :mentships do |t|
      t.references :project, index: true
      t.references :user, index: true
      t.string :task

      t.timestamps
    end
  end
end
