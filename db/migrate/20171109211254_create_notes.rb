class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :name_student
      t.integer :student
      t.string :group
      t.integer :score


      t.timestamps
    end
  end
end
