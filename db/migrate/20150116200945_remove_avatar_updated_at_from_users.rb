class RemoveAvatarUpdatedAtFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_updated_at, :datetime
  end
end
