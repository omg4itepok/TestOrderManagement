class CreateShifts < ActiveRecord::Migration[5.0]
  def change
      create_table :shifts do |t|
      t.belongs_to :factory, index: true
      t.date :date
      t.timestamps
    end
  end
end
