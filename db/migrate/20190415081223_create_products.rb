class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :serialNo
      t.string :description, null: false

      t.timestamps
    end
  end
end
