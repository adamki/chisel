require "pry";
class UnorderedList
  def initialize(input)
    @input = input
  end

  def ul_wrapper
    newest_array = @input.each_with_index do |item,index|
      check_prev(item, index)
      check_next(item, index)
      check_prev_and_next(item, index)
      check_if_li_is_alone(item, index)
    end
  end

  private

  def check_prev(item, index)
    if item.to_s.start_with?("<li>") && @input[index-1].to_s.include?("<li>") == false || @input[index-1] == nil
      item.insert(0,"<ul>\n")
    end
  end

  def check_next(item, index)
    if item.to_s.start_with?("<li>") && @input[index + 1].to_s.include?("<li>") == false
        item.insert(-1, "</ul>\n")
    end
  end

  def check_prev_and_next(item, index)
    if  item.to_s.start_with?("<li>") && @input[index-1].to_s.include?("<li>") ==true &&  item.to_s.start_with?("<li>") && @input[index+1].to_s.include?("<li>") == true
      item.sub!("<ul>", "")
      item.sub!("</ul>", "")
    end
  end

  def check_if_li_is_alone(item, index)
    if item.include?("<li>") && @input[index-1].to_s.include?("<li>") ==false && @input[index+1].to_s.include?("<li>")== false
      item.insert(0,"<ul>").insert(-1, "</ul>\n")
    end
  end

end

# example_ul = UnorderedList.new(["<p>item</p>", "<li>cat</li>", "<li>dog</li>","<l`i>hamster</li>", "<li>fish</li>"])
# example_ul.ul_wrapper
