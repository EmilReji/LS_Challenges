require 'minitest/autorun'
require_relative '9_Perfect_Number'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13) # 1 = 1
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28) # 1 + 2 + 4 + 7 + 14 = 28
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12) # 1 + 2 + 3 = 6
  end

  def test_classify_square
    assert_equal 'deficient', PerfectNumber.classify(16) # 1, 2, 4, 8 = 15
  end
end
