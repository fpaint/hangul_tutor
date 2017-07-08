class CreateWordsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.integer :id
      t.string :word
      t.string :translation
    end
  end
end
