class RemoveAvatarFileNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_file_name, :string
  end
end
