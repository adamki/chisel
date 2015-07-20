gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/list.rb'

class ListTest < MiniTest::Test

  def test_it_can_replace_a_numbered_list
    test_list = List.new(["1. Sushi"])
    expected = ["<li>Sushi</li>"]
    assert_equal expected, test_list.delete_md_lists_add_html
  end

  def test_it_can_do_the_same_for_asterisks
    test_list = List.new(["*Sushi"])
    expected = ["<li>Sushi</li>"]
    assert_equal expected, test_list.delete_md_lists_add_html
  end

  def test_it_can_handle_multiple_strings
    test_list = List.new(["*Sushi", "<p>this is not a list</p>" , "*anotherlist" ])
    expected = ["<li>Sushi</li>", "<p>this is not a list</p>", "<li>anotherlist</li>" ]
    assert_equal expected, test_list.delete_md_lists_add_html
  end

  def test_it_does_not_confuse_em_fonts
    test_list = List.new(["*Sushi*"])
    expected = ["*Sushi*"]
    assert_equal expected, test_list.delete_md_lists_add_html
  end

  def test_it_does_not_confuse_strong_fonts
    test_list = List.new(["**Sushi**"])
    expected = ["**Sushi**"]
    assert_equal expected, test_list.delete_md_lists_add_html
  end

  def test_it_wraps_li_tags_in_ul_tags
    skip
    test_list = List.new(["*Sushi"])
    expected = ["<ul><li>Sushi</li></ul>"]
    assert_equal expected, test_list.list_wrapper(test_list.delete_md_lists_add_html )
  end

  def test_it_can_wrap_multiple_list_items
    skip
    test_list = List.new(["*Sushi", "*Sashimi"])
    expected = ["<ul>","<li>Sushi</li>","<li>Sashimi</li>","</ul>"]
    assert_equal expected, test_list.list_wrapper(test_list.delete_md_lists_add_html )
  end
  
end
