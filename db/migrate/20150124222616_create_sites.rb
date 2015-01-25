class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :install_host
      t.string :install_path

      t.timestamps
    end
  end
end
