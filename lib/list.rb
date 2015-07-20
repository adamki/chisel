require 'pry'

class List
  def initialize(input)
    @input = input
  end

  def delete_md_lists_add_html
    @arrayoflists = @input.map do |line|
      if line.include?("**") == true
        line
      elsif line[0].to_i > 0
        line.lstrip.reverse.chop!.chop!.strip.reverse.insert(0,"<li>").insert(-1 , "</li>\n")
      elsif line[0] == "*"
        line.delete("* ").delete("\n").insert(0,"<li>").insert(-1 , "</li>")
      else
        line
      end
    end
    p @arrayoflists
  end
end


# test_list = List.new(["**style item**", "<h1>Header</h1>","1. Sushi","2.pizza", "<p>this is not a list</p>" , "* another list" ])
# test_list.delete_md_lists_add_html
