class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.string :image
      t.integer :login_user_id
      t.references :user
      t.timestamps
    end
  end
end
