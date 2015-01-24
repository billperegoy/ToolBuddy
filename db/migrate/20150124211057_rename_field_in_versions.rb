class RenameFieldInVersions < ActiveRecord::Migration
  def change
    rename_column :versions, :release, :release_notes
  end
end
