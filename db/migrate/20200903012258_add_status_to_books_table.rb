class AddStatusToBooksTable < ActiveRecord::Migration
  def change
    add_column :books, :status, :string
  end
end
