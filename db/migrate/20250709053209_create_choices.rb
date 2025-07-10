class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :option_text

      t.timestamps
    end
  end
end
