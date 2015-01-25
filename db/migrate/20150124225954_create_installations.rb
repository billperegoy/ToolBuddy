class CreateInstallations < ActiveRecord::Migration
  def change
    create_table :installations do |t|
      t.string :state
      t.integer :version_id
      t.integer :site_id

      t.timestamps
    end
  end
end
