class AddQuoteToEstimate < ActiveRecord::Migration[6.0]
  def change
    add_column :estimates, :quote, :float
  end
end
