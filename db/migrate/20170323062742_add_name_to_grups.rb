class AddNameToGrups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :name, :string, unique:true, null: false
  end
end
