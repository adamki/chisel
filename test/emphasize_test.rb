gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/emphasize.rb'

class EmphasizeTest < Minitest::Test
  
  def test_it_replaces_single_asterisk_for_em_tag
    test_emphasis = Emphasize.new(["*Emphasize*"])
    expected = ["<em>Emphasize</em>"]
    assert_equal expected, test_emphasis.replace_asterisk_for_em
  end

  def test_it_does_not_translate_double_astersisks
    test_emphasis = Emphasize.new(["**Strong**"])
    expected = ["<strong>Strong</strong>"]
    assert_equal expected, test_emphasis.replace_asterisk_for_em
  end

  def test_it_can_handle_embedded_styles
    test_emphasis = Emphasize.new(["My *Emphasized and **stronged** text* is awesome."])
    expected = ["My <em>Emphasized and <strong>stronged</strong> text</em> is awesome."]
    assert_equal expected, test_emphasis.replace_asterisk_for_em
  end

end
