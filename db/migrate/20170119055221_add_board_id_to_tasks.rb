class AddBoardIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :board, foreign_key: true
  end
end
