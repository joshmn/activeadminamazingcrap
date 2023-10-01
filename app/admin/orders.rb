ActiveAdmin.register Order do
  permit_params :name

  form do |f|
    f.inputs 'Details' do
      f.input :customer, as: :fancy_select
    end

    actions
  end
end
