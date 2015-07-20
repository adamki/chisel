gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/header.rb'

class HeaderTest < Minitest::Test

  def test_it_can_identify_Hash_symbol
    test_header = Header.new(["#Ruby Exercises"])
    expected = test_header.count_hashes
    assert expected
  end

  def test_it_can_replace_one_Hash_symbol
    test_header = Header.new(["#Ruby Exercises\n"])
    expected = ["<h1>Ruby Exercises</h1>"]
    assert_equal expected, test_header.count_hashes
  end

  def test_it_can_replace_3_Hash_symbols
    test_header = Header.new(["###Ruby Exercises\n"])
    expected = ["<h3>Ruby Exercises</h3>"]
    assert_equal expected, test_header.count_hashes
  end

  def test_it_can_handle_multiple_lines
    test_header = Header.new(["#My Life in Desserts\n", "\n", "## Chapter 1: The Beginning\n"])
    expected = ["<h1>My Life in Desserts</h1>", "\n", "<h2> Chapter 1: The Beginning</h2>"]
    assert_equal expected, test_header.count_hashes
  end

end
