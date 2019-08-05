require 'minitest/autorun'

require_relative '1_Odd_Words'

class OddWordsTest < Minitest::Test
  def test_1
    expected = "whats eht matter htiw kansas."
    actual = odd_words("whats the matter with kansas.")
    assert_equal(expected, actual)
  end
  
  def test_2
    expected = "whats eht matter htiw kansas."
    actual = odd_words("whats   the matter with   kansas   .")
    assert_equal(expected, actual)
  end
  
  def test_3
    assert_raises(StandardError) { |_| odd_words("") }
  end
  
  def test_4
    expected = "."
    actual = odd_words(".")
    assert_equal(expected, actual)
  end  
  
  def test_5
    expected = "hello."
    actual = odd_words(" hello . ")
    assert_equal(expected, actual)
  end
  
  def test_6
    assert_raises(StandardError) { |_| odd_words("whats   the mattermattermattermatter with   kansas   .") }
  end
end