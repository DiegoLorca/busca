class AddUserIdToForums < ActiveRecord::Migration
  def change
    add_reference :forums, :user, index: true
  end
end
