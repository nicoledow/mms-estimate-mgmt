class AddCustomerIdToEstimate < ActiveRecord::Migration[6.0]
  def change
    add_column :estimates, :customer_id, :integer
  end
end
