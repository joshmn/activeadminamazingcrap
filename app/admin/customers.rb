ActiveAdmin.register Customer do
  permit_params :name

  controller do
    def new
      if request.headers.fetch("turbo-frame")
        return respond_to do |f|
          f.turbo_stream do
            render turbo_stream: turbo_stream.insert(:content, "asdf")
          end

          f.html do
            frame = view_context.turbo_frame_tag "content" do
              render_to_string partial: "admin/customers/custom_form"
            end

            render turbo_stream: frame
          end
        end
      end
      respond_to do |f|
        f.html do
          super
        end

        f.turbo_stream do
          abort
          render turbo_stream: turbo_stream.insert(:content, "asdf")
        end
      end
    end

    def create
      object = build_resource
      if create_resource(object)
        respond_to do |f|
          f.turbo_stream do
            render turbo_stream: view_context.tag('turbo-stream', action: 'custom', content: resource.to_json)
          end
        end
      end
    end
  end
  form do |f|
    f.inputs 'Details' do
      f.input :name
    end

    f.actions
  end

end
