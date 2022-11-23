class CreateNamings < ActiveRecord::Migration[6.1]
  def change
    create_table :namings do |t|
      t.text :tbox1
      t.text :tbox2 

      t.timestamps
    end
  end
end
