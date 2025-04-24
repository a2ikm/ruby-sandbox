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

  def test_private_method_that_is_prepended_by_public_method_is_still_private
    mod = Module.new {
      def hello
        "Hello"
      end
    }

    klass = Class.new {
      prepend mod

      private def hello
        "Hello"
      end
    }

    assert_equal [:hello], klass.private_instance_methods(false)
  end

  def test_public_method_that_is_prepended_by_private_method_is_still_public
    mod = Module.new {
      private def hello
        "Hello"
      end
    }

    klass = Class.new {
      prepend mod

      def hello
        "Hello"
      end
    }

    assert_equal [:hello], klass.public_instance_methods(false)
  end
end
