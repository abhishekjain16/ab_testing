class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.references :experiment, index: true
      t.text :data
      t.integer :render_count
      t.integer :success_count
      t.string :name
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
