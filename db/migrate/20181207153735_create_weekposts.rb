class CreateWeekposts < ActiveRecord::Migration[5.2]
  def change
    create_table :weekposts do |t|
      t.string :title
      t.integer :weeknumber
      t.text :notes

      t.timestamps
    end
  end
end
