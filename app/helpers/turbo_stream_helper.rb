module TurboStreamHelper
  def custom(resource = nil)
    custom_action :custom, attributes: resource #attributes.reverse_merge(title: title, type: type)
  end

end
