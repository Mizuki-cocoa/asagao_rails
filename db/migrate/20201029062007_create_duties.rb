class CreateDuties < ActiveRecord::Migration[5.2]
  def change
    create_table :duties do |t|
      t.references :member
      t.string :name, null: false
      t.timestamps
    end
  end
end
