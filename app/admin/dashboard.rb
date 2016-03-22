ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    

  section "Últimos Usuarios Registrados" do
    table_for User.order("tipo desc").limit(5) do
        column "Nombre", :title do |user|
            link_to user.title, [:admin, user]
        end    
        column "Tipo de Usuario", :tipo

    end
    strong { link_to "Ver Todos los Usuario Registrados", admin_users_path }
  end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
