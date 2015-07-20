require 'pry'
class Header

  def initialize(input)
    @input = input
  end

  def count_hashes
    @input.map do |line|
      if line.include?("#")
        num = line.count("#")
        line.gsub("#",'').prepend("<h#{num}>").gsub("\n","</h#{num}>")
      else
        line
      end
    end
  end
end

# blah = Header.new(["#My Life in Desserts\n", "\n", "## Chapter 1: The Beginning\n", "\n", "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n", "**Food & Wine** this place has been packed every night.\"\n"])
# blah.count_hashes
