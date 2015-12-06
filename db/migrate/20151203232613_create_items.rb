class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.boolean :completed
      t.belongs_to :list
 
      t.timestamps null: false
    end
  end
end
