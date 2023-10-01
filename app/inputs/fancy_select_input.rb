class FancySelectInput < Formtastic::Inputs::SelectInput
  def hint_html
    @template.link_to("Create new?", "#", data: { controller: "trigger", src: @template.send("new_admin_#{reflection.name}_path") })
  end
end
