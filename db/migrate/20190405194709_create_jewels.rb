class CreateJewels < ActiveRecord::Migration[5.2]
  def change
    create_table :jewels do |t|
      t.string :image
      t.string :collection
      t.string :name
      t.text :description
      t.string :price
      t.string :available
      t.string :collection_id

      t.timestamps
    end
  end
end
