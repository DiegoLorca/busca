ActiveAdmin.register Teacher do
	#scope :unreleased
	permit_params :name, :published_on, :content
	index do     
	    selectable_column
    	id_column                     
	    column "Estado", :name
		column "Fecha Publicación", :published_on
		column "Nota", :content  
	    actions
	end

	filter :name
	filter :published_on
	filter :content

	form do |f|
		f.inputs "Detalles Calendario Profesor" do
			f.input :name
			f.input :published_on
			f.input :content
		end
		f.actions
	end	

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
