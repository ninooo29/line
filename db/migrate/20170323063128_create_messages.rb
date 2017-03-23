class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :image
      t.references :group
      t.references :user
      t.timestamps
    end
    add_index :messages, [:group_id, :user_id]
  end
end
