ActiveAdmin.register User do
	#scope :unreleased
	permit_params :email, :encrypted_password, :title, :asignatura, :address, :telefono
	index do     
	    selectable_column
    	id_column                     
	    column :email
	    column "Contraseña encriptada", :encrypted_password
	    column "Nombre", :title
	    column :asignatura
	    column "Dirección", :address
	    column "Teléfono", :telefono
	    column :rut
	    column :comuna
	    column "Tipo de Usuario", :tipo
	    column "Valor hora clase", :precio
	    #column do |ques|
       	#	link_to t("Enviar Evaluación al Docente"), new_admin_question_path
    	#end
	    actions
	end

	filter :email
	filter :encrypted_password
	filter :title
	filter :asignatura
	filter :address
	filter :telefono
	filter :rut
	filter :comuna
	filter :tipo
	filter :precio

	form do |f|
		f.inputs "User Details" do
			f.input :email
			f.input :encrypted_password
			f.input :title
			f.input :asignatura
			f.input :address
			f.input :telefono
			f.input :rut
			f.input :comuna
			f.input :tipo
			f.input :precio
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
