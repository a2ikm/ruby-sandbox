require "test/unit"

class TestClass < Test::Unit::TestCase
  def test_class_method_is_inherited
    a = Class.new {
      def self.hello
        "hello"
      end
    }

    b = Class.new(a)

    assert b.respond_to?(:hello)
  end

  def test_class_instance_method_is_not_inherited
    a = Class.new {
      def self.hello
        @hello
      end

      def self.hello=(value)
        @hello = value
      end
    }
    a.hello = 123

    b = Class.new(a)

    assert_nil b.hello
  end

  def test_instance_variable_in_class_context_is_class_instance_variable
    a = Class.new {
      def self.hello
        @hello
      end

      @hello = 123
    }

    assert_equal 123, a.hello
  end
end
