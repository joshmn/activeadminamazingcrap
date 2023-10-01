module Admin
  module InlineCreateable
    def self.included(klass)
      klass.instance_eval do
        controller do
          def new
            if turbo_request?
              respond_to do |f|
                f.html do
                  frame = view_context.turbo_frame_tag "content" do
                    view_context.active_admin_form_for [:admin, resource_class.new], &(self.class.active_admin_config.page_presenters[:inline_form] || self.class.active_admin_config.page_presenters[:form]).block
                  end

                  render turbo_stream: frame
                end
              end
            else
              super
            end
          end

          def create
            if turbo_request?
              object = build_resource
              if create_resource(object)
                respond_to do |f|
                  f.turbo_stream do
                    render turbo_stream: view_context.tag('turbo-stream', action: 'modal_created', content: resource.to_json)
                  end
                end
              else
                frame = turbo_stream.update "content" do
                  view_context.active_admin_form_for [:admin, resource], &(self.class.active_admin_config.page_presenters[:inline_form] || self.class.active_admin_config.page_presenters[:form]).block
                end

                render turbo_stream: frame, status: 400
              end
            else
              super
            end
          end

          private

          def turbo_request?
            begin
              request.headers.fetch("turbo-frame")
            rescue KeyError => e
              false
            end
          end
        end
      end
    end
  end
end
