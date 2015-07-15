# top level File IO
handle_input = File.open(ARGV[0], 'r')
# Read in MD File
markdown_input = handle_input.read
handle_input.close


# send to parser
# writes to output
# communicates with parser

output = File.open(ARGV[1] , 'w')
output.write(markdown_input)  #eventually call a method that triggers parse.
output.close


#======================================================================================##
#NOTES ON PARSER ... CAN NOT SAVE NOTES THERE AS FILE IO OVERWRITES IT EACH TIME FILE IO runs
#======================================================================================##
#ruby lib/chisel.rb input.md lib/parser.rb
#======================================================================================##
#parser will connect to all sort class/methods(prep,P,H,LI,AMP,etcetc)
#use parser as a hub between key input/output <===> sorting suite
