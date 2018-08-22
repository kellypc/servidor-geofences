class AddUserIdToGeofence < ActiveRecord::Migration[5.0]
  def change
    add_column :geofences, :user_id, :integer
  end
end
