class ChangeDataColumnType < ActiveRecord::Migration
  def change
  	change_column :variations, :data, :text, :limit => 4294967295
  end
end
