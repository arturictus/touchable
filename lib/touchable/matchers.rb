module Touchable
  module Matchers

    def have_touchable(*touchables)
      HaveTouchableMatcher.new(touchables)
    end
    alias_method :have_touchables, :have_touchable

    def touch(touchable)
      TouchMatcher.new(touchable)
    end

    class TouchMatcher
      attr_reader :touchable, :block
      def initialize(touchable)
        @touchable = touchable
      end

      def matches?(block)
        @block = block
        value_before_block < value_after_block
      end

      def value_before_block
        @value_before_block ||= touchable.updated_at
      end

      def value_after_block
        block.call
        @value_after_block ||= touchable.updated_at
      end

      def failure_message
        "changes updated_at for #{touchable}"
      end

      def description
        "touches #{touchable}"
      end

      def supports_block_expectations?
        true
      end
    end

    class HaveTouchableMatcher
      attr_reader :touchables, :actual
      def initialize(touchables)
        @touchables = touchables
      end

      def matches?(actual)
        @actual = actual
        touchables.any? { |tou| klass._touchables.include?(tou) }
      end

      def failure_message
        "does not have #{touchables} as touchable"
      end

      def description
        "have #{touchables} as touchables"
      end

      def klass
        @klass ||= if actual.class == Class
                     actual
                   else
                     actual.class
                   end
      end
    end
  end
end
