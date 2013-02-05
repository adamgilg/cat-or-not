class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.binary :picture
      t.string :name
      t.string :breed
      t.integer :age

      t.timestamps
    end
  end
end
