class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.references :manager, index: true
    	t.string :name
    	t.string :rank
    	t.timestamps
    end
  end
end