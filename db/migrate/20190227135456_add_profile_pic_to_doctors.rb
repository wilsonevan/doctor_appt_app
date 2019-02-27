class AddProfilePicToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :profile_pic, :string
  end
end
