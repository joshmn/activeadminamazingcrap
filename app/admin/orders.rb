ActiveAdmin.register Order do
  permit_params :name

  form do |f|
    f.inputs 'Details' do
      f.input :customer, as: :select, hint: link_to("Create new?", "#", data: { controller: "trigger", src: new_admin_customer_path })
    end


    actions
  end
end
