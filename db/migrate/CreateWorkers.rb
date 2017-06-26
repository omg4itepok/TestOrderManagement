class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
    	t.belongs_to :factory, index: true
    	t.belongs_to :shift, index: true
    	t.string :name
    	t.integer :workingHrs
    	t.timestamps
    end
  end
end
