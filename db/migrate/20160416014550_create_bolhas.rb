class CreateBolhas < ActiveRecord::Migration
  def change
    create_table :bolhas do |t|
      t.string :title
      t.string :l_name
      t.string :r_name
      t.text :content

      t.timestamps null: false
    end
  end
end
