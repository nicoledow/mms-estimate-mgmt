class CreateEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimates do |t|
      t.string :starting_zip
      t.string :destination_zip
      t.integer :bedrooms
      t.integer :floors
      t.boolean :elevator, :default => false
      t.string :parking_type

      t.timestamps
    end
  end
end
