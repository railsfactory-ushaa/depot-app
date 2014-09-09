class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end
