class AddSuccessSelectorToExperiment < ActiveRecord::Migration
  def change
    add_column :experiments, :success_selector, :string
  end
end
