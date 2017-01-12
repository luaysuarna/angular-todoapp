class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
