class AddRenderPercentageToVariations < ActiveRecord::Migration
  def change
    add_column :variations, :render_percentage, :integer
  end
end
