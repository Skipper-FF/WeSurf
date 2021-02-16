class AddNameToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :name, :string
  end
end
