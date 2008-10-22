class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name
      t.text :description
      t.float :estimated_hours
      t.float :completed_hours
      t.integer :user_id
      t.integer :project_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
