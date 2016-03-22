class AddCoverToUsers < ActiveRecord::Migration
  def change
  	add_attachment :users, :cover #Para las imagenes de perfil
  	add_attachment :users, :attachment #Para los CV
  end
end
