class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.string :option_text
      t.string :title
      t.integer :user_id
      t.string :email_id

      t.timestamps
    end
  end
end
