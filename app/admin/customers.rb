ActiveAdmin.register Customer do
  include Admin::InlineCreateable

  has_many :addresses

  associations_dropdown

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
