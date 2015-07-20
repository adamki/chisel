require "pry"

class Emphasize
  def initialize(input)
    @input = input
  end

  def replace_asterisk_for_em
    @input.map do |line|
      asterisk_count = line.count "*"
      if asterisk_count > 1 && asterisk_count <= 4
        if line.include?("**")
          line.gsub("**", "</strong>").sub("</strong>", "<strong>")
        else
          line.sub("*", "<em>").reverse.sub("*", ">me/<").reverse
        end
      elsif asterisk_count >= 6
        line.sub("*","<em>").sub("**", "<strong>").reverse.sub("**", ">gnorts/<").sub("*", ">me/<").reverse
      else
        line
      end
    end
  end
end
# example = Emphasize.new(["*Emphasized and stronged text"])
# example.replace_asterisk_for_em
