require 'minitest/autorun'

require_relative 'simple'

class TestSimple < Minitest::Test
  def test_1
    assert_equal(78, simple(20, [3, 5]))
  end
  
  def test_2
    assert_equal(63, simple(20, [3]))
  end
   
  def test_3
    assert_equal(30, simple(20, [5]))
  end
  
  def test_4
    assert_equal(98, simple(21, [3, 5]))
  end
  
  def test_5
    assert_equal(0, simple(1, [3, 5]))
  end
  
  def test_6
      assert_equal(19, simple(20, [19]))
  end
  
  def test_7
    assert_raises(StandardError) { simple(21, [-3]) }
  end
  
  def test_8
    assert_raises(StandardError) { simple(21, []) }
  end
  
  def test_9
    assert_raises(StandardError) { simple(0, [3, 5]) }
  end
end