class RenamePasswardtoPasswordInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :passward, :password 
  end
end
