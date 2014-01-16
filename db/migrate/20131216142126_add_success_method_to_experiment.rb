class AddSuccessMethodToExperiment < ActiveRecord::Migration
  def change
    add_column :experiments, :success_method, :string
  end
end
