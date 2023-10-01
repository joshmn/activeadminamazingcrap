ActiveAdmin.register Address do
  include Admin::InlineCreateable

  permit_params :name, :customer_id

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :customer
    end

    actions
  end
end
