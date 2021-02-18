class AddLocationToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :Location, :string
  end
end
