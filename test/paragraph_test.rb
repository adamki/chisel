gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/paragraph.rb'

class ParagraphTest < MiniTest::Test
  def test_it_removes_empty_strings
    test_paragraph = Paragraph.new(["# My Life in Desserts", "", "## Chapter 1: The Beginning"])
    assert test_paragraph.add_p_tags
  end

  def test_it_adds_paragraph_tags_on_new_lines
    test_paragraph = Paragraph.new(["My favorite cuisines are:\n"])
    expected = ["<p>My favorite cuisines are:</p>"]
    assert_equal expected, test_paragraph.add_p_tags
  end

  def test_it_does_not_add_P_tags_to_headers
    test_paragraph = Paragraph.new(["#My favorite cuisines are:\n"])
    expected = ["#My favorite cuisines are:\n"]
    assert_equal expected, test_paragraph.add_p_tags
  end

  def test_it_does_not_add_P_tags_to_Number_li
    test_paragraph = Paragraph.new(["1. Sushi",
                                    "2. Barbeque",
                                    "3. Mexican"])
    expected = ["1. Sushi","2. Barbeque","3. Mexican"]
    assert_equal expected, test_paragraph.add_p_tags
  end

  def test_it_does_not_add_P_tags_to_asterisk_li
    test_paragraph = Paragraph.new(["* Sushi",
                                    "* Barbeque",
                                    "* Mexican"])
    expected = ["* Sushi", "* Barbeque", "* Mexican"]
    assert_equal expected, test_paragraph.add_p_tags
  end

end
