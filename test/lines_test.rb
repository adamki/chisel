gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/lines.rb'

class LineTest <Minitest::Test
  def test_it_can_seperate_lines
    test_line = Line.new( "This is the first line of the paragraph.
                This is the second line of the same paragraph.")

    expected = "This is the first line of the paragraph.
                This is the second line of the same paragraph."
    assert_equal expected, test_line.chuck
  end
end
