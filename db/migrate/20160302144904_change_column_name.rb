class ChangeColumnName < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
    rename_column :users, :password, :password_digest
  end
end
