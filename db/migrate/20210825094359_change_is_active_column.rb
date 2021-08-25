class ChangeIsActiveColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :is_active, :boolean, null: false, default: false
  end
end
