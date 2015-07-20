
class UnorderedList
  def initialize(input)
    @input = input
  end

  def ul_wrapper
    newest_array = @input.each_with_index do |item,index|

      #if LI is alone....surround with UL
      if item.include?("<li>") && @input[index-1].to_s.include?("<li>") ==false && @input[index+1].to_s.include?("<li>")== false
        item.insert(0,"<ul>").insert(-1, "</ul>")
      end


      #if NEXT item is not and LI... add closing UL
      if item.to_s.start_with?("<li>") && @input[index + 1].to_s.include?("<li>") == false
          item.insert(-1, "</ul>")
      end

      #if Surrounding items are LI...add nothing.
      if  item.to_s.start_with?("<li>") && @input[index-1].to_s.include?("<li>") ==true &&  item.to_s.start_with?("<li>") && @input[index+1].to_s.include?("<li>") == true
        item.sub!("<ul>", "")
        item.sub!("</ul>", "")
      end
      #if previous item is NOT an LI or is nil... Add Opener UL
      if item.to_s.start_with?("<li>") && @input[index-1].to_s.include?("<li>") == false ||  @input[index - 3] == nil
        item.insert(0,"<ul>")
      end
    end
    newest_array
  end
end

# example_ul = UnorderedList.new(["<p>A terribe time</p>", "<li>cat</li>", "b", "c", "<li>dog</li>","<li>hamster</li>", "<li>fish</li>"])
# example_ul.ul_wrapper
