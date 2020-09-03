class AddBookIdToNotesTable < ActiveRecord::Migration
  def change
    add_column :notes, :book_id, :integer
  end
end
