ActiveAdmin.register Address do
  permit_params :name, :customer_id

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :customer_id
    end

    actions
  end
end
