gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/ul.rb'

class UnorderedList_test < Minitest::Test
  
  def test_it_can_can_wrap_single_li_items
    test_ul = UnorderedList.new(["<li>Sushi</li>"])
    assert test_ul.ul_wrapper
  end

  def test_it_can_wrap_two_consecutive_li_items
    test_ul = UnorderedList.new(["<li>Sushi</li>", "<li>Bulgogi</li>"])
    expected = ["<ul><li>Sushi</li>", "<li>Bulgogi</li></ul>"]
    assert_equal expected, test_ul.ul_wrapper
  end

  def test_it_can_wrap_mixed_items
    test_ul = UnorderedList.new(["<p>A terribe time</p>", "<li>cat</li>", "b", "c", "<li>dog</li>","<li>hamster</li>", "<li>fish</li>"])
    expected = ["<p>A terribe time</p>", "<ul><li>cat</li></ul>", "b", "c", "<ul><li>dog</li>", "<li>hamster</li>", "<li>fish</li></ul>"]
    assert_equal expected, test_ul.ul_wrapper
  end

end
