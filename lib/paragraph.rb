require "pry";

class Paragraph

  def initialize(input)
    @input = input
  end

  def add_p_tags
    @input.delete_if{|line| line == "\n"}
    @input.map! do |line|
      if line[0] == "#" || line[0]=="*" || line[0]=="**" || line[0].to_i > 0
        line
      else
        line.prepend("<p>").gsub("\n", "")
      end
      if line[-4,4].include?(".") || line[-2,2].include?(":")
        line.insert(-2, "</p>\n")
      else
        line
      end
    end
  end
end
