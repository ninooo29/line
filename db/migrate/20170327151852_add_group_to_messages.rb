class AddGroupToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :group
  end
end
