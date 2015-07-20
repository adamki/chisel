
class UnorderedList
  def initialize(input)
    @input = input       # => ["<p>item</p>", "<li>cat</li>", "<li>dog</li>", "<li>hamster</li>", "<li>fish</li>"]
  end

  def ul_wrapper
    newest_array = @input.each_with_index do |item,index|  # => ["<p>item</p>", "<li>cat</li>", "<li>dog</li>", "<li>hamster</li>", "<li>fish</li>"]

      #if previous item is NOT an LI or is nil... Add Opener UL
      if item.to_s.start_with?("<li>") && @input[index-1].to_s.include?("<li>") == false || @input[index-1] == nil  # => false, true, false, false, false
        item.insert(0,"<ul>")                                                                                       # => "<ul><li>cat</li>"
      end                                                                                                           # => nil, "<ul><li>cat</li>", nil, nil, nil

      #if Surrounding items are LI...add nothing.
      if  item.to_s.start_with?("<li>") && @input[index-1].to_s.include?("<li>") ==true &&  item.to_s.start_with?("<li>") && @input[index+1].to_s.include?("<li>") == true  # => false, false, true, true, false
        item.sub!("<ul>", "")                                                                                                                                               # => nil, nil
        item.sub!("</ul>", "")                                                                                                                                              # => nil, nil
      end                                                                                                                                                                   # => nil, nil, nil, nil, nil

      #if LI is alone....surround with UL
      if item.include?("<li>") && @input[index-1].to_s.include?("<li>") ==false && @input[index+1].to_s.include?("<li>")== false  # => false, false, false, false, false
        item.insert(0,"<ul>").insert(-1, "</ul>")
      end                                                                                                                         # => nil, nil, nil, nil, nil

      #if NEXT item is not and LI... add closing UL
      if item.to_s.start_with?("<li>") && @input[index + 1].to_s.include?("<li>") == false  # => false, false, false, false, true
          item.insert(-1, "</ul>")                                                          # => "<li>fish</li></ul>"
      end                                                                                   # => nil, nil, nil, nil, "<li>fish</li></ul>"
    end                                                                                     # => ["<p>item</p>", "<ul><li>cat</li>", "<li>dog</li>", "<li>hamster</li>", "<li>fish</li></ul>"]
    newest_array                                                                            # => ["<p>item</p>", "<ul><li>cat</li>", "<li>dog</li>", "<li>hamster</li>", "<li>fish</li></ul>"]
  end
end

example_ul = UnorderedList.new(["<p>item</p>", "<li>cat</li>", "<li>dog</li>","<li>hamster</li>", "<li>fish</li>"])  # => #<UnorderedList:0x007fe6aa1927e0 @input=["<p>item</p>", "<li>cat</li>", "<li>dog</li>", "<li>hamster</li>", "<li>fish</li>"]>
example_ul.ul_wrapper                                                                                                # => ["<p>item</p>", "<ul><li>cat</li>", "<li>dog</li>", "<li>hamster</li>", "<li>fish</li></ul>"]
