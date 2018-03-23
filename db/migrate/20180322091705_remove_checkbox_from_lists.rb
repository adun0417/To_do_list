class RemoveCheckboxFromLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :check_box
  end
end
