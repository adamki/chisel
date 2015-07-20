require "pry";
require_relative 'paragraph'
require_relative 'header'
require_relative 'list'
require_relative 'emphasize'
require_relative 'ul'

class Chisel
  input = File.open(ARGV[0], 'r')
  markdown = []
  @markdown_input = input.each_line do |line|
    markdown << line
  end


  puts "==========markdown================================================================="
  puts markdown
  input.close


  #sent to Paragraph Class..
  example = Paragraph.new(markdown)
  paragraph_parsed = example.add_p_tags

  # Sent to Header Class...
  example = Header.new(paragraph_parsed)
  header_parsed = example.count_hashes


  #sent to em/strong class
  example = Emphasize.new(header_parsed)
  style_parsed = example.replace_asterisk_for_em

  # sent to lists class
  example = List.new(style_parsed)
  list_parsed = example.delete_md_lists_add_html

  #sent to UL class
  example = UnorderedList.new(list_parsed)
  ul_parsed = example.ul_wrapper

  puts "==========HTML================================================================="

  puts ul_parsed

  output = File.open(ARGV[1] , 'w')
  output.write(ul_parsed)
  output.close
end
