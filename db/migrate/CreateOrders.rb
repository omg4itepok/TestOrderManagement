class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
   	  t.belongs_to :worker, index: true
   	  t.belongs_to :shift, index: true
      t.string :pic
      t.integer :difficulty
      t.timestamps
    end
  end
end
