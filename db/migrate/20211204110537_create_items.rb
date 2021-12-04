class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image
      t.string :title
      t.text :explanation
      t.integer :category_id
      t.integer :price
      t.integer :delivery_fee_id
      t.integer :prefecture_id
      t.integer :delivery_days_id
      t.integer :status_id
      t.timestamps
    end
  end
end
