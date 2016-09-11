module Touchable
  module Base
    extend ActiveSupport::Concern

    included do
      after_update :trigger_cascading_touch
    end

    class_methods do
      def touchables(*relations)
        @touchables = relations
      end

      def _touchables
        @touchables || []
      end
    end

    def cascading_touch
      _touchables.each do |method|
        obj = send(method)
        Array.wrap(obj).each { |elem| elem_touching(elem) }
      end
    end

    def trigger_cascading_touch
      cascading_touch
    end

    private

    def elem_touching(elem)
      return unless Touchable.perform_touchable
      if Touchable.execute_on_touchable
        Touchable.execute_on_touchable.call(elem)
      else
        elem.touch if elem.respond_to?(:touch)
      end
      elem.trigger_cascading_touch if elem.respond_to?(:trigger_cascading_touch)
    end

    def _touchables
      self.class.instance_variable_get(:@touchables) || []
    end
  end
end
