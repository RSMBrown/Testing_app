class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, foreign_key: true 
      t.string :username 
      t.string :name 
      t.string :surname 
      t.date :date_of_birth

      t.timestamps
    end
  end
end
