require "test/unit"

class TestClass < Test::Unit::TestCase
  def test_we_can_use_array_comparison_to_version_comparison
    assert ([3, 0] <=> [3, 1]) < 0
    assert ([3, 1] <=> [3, 1]) == 0
    assert ([3, 2] <=> [3, 1]) > 0
    assert ([4, 0] <=> [3, 1]) > 0

    # >, >=, <=, < are not implemented
    assert_raise NoMethodError do
      [3, 0] > [3, 1]
    end
  end
end
