class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :height
      t.integer :happiness
      t.integer :tickets
      t.integer :nausea
      t.boolean :admin, default: false
    end
  end
end
