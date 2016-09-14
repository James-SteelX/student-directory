file = File.open($0, 'r')
file.readlines.each do |line|
  print line
end


def test
 puts "tester"
end

#minor refactor, changed $PROGRAM_NAME to $0
