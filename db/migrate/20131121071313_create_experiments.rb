class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :name
      t.string :selector
      t.string :path
      t.string :relative_path
      t.integer :total_count

      t.timestamps
    end
  end
end
