ActiveAdmin.register Customer do
  include Admin::InlineCreateable

  permit_params :name

  # optional, will default to form
  inline_form do |f|
    f.inputs "Details" do
      f.input :name
    end

    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
    end

    f.actions
  end
end
