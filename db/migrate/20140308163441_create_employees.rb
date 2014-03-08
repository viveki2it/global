class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email
      t.integer :rank
      t.float :salary
      t.boolean :flag, :default => false
      t.timestamps
    end
  end
end
