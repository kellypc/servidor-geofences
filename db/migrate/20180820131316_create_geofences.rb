class CreateGeofences < ActiveRecord::Migration[5.0]
  def change
    create_table :geofences do |t|
      t.string :name
      t.float :lat, :limit => 53
      t.float :lon, :limit => 53
      t.float :radius, :limit => 53

      t.timestamps
    end
  end
end
