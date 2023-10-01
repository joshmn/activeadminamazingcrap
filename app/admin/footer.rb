module ActiveAdmin
  module Views
    class Footer < Component

      def build(*args)
        super :id => "footer"
        super :style => "text-align: right;"

        div do
          render template: "layouts/admin/shared/_modal"

        end
      end

    end
  end
end
