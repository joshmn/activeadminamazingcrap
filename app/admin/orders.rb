ActiveAdmin.register Order do
  permit_params :name, :customer_id, :address_id

  form do |f|
    f.inputs 'Details' do
      f.input :address, as: :fancy_select
      f.input :customer, as: :fancy_select
    end

    actions
  end
end
