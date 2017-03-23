class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :user
      t.timestamps
    end
  end
end
