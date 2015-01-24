class AddToolRefToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :tool_id, :integer
  end
end
