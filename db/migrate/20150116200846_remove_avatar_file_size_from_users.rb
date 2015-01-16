class RemoveAvatarFileSizeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_file_size, :integer
  end
end
