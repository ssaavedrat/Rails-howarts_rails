class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :location
      t.string :house
      t.string :spell

      t.timestamps
    end
  end
end
