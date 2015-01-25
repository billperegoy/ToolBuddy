class AddRepositoryPathToToolsls < ActiveRecord::Migration
  def change
    add_column :tools, :repository_path, :string
  end
end
