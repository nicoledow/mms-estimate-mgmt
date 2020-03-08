class RemoveZipsFromEstimatesAndAddCities < ActiveRecord::Migration[6.0]
  def change
    remove_column :estimates, :starting_zip
    remove_column :estimates, :destination_zip
    add_column :estimates, :starting_city, :string
    add_column :estimates, :starting_state, :string
    add_column :estimates, :destination_city, :string
    add_column :estimates, :destination_state, :string
  end
end
