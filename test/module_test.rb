require "test/unit"

class TestModule < Test::Unit::TestCase
  def test_we_can_create_alias_in_class_for_prepended_method
    mod = Module.new {
      def original_method
        array << :mod
        super
      end
    }

    klass = Class.new {
      prepend mod

      attr_reader :array

      def initialize
        @array = []
      end

      def original_method
        array << :klass
      end

      alias aliased_method original_method
    }

    obj = klass.new
    obj.aliased_method

    assert_equal [:mod, :klass], obj.array
  end
end
