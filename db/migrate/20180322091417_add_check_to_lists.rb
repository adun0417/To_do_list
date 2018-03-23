class AddCheckToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :check, :boolean
  end
end
