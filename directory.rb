def print_header
  puts "The students of Villians Academy"
  puts "--------------------"
end


def print_(students)
  students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
 end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
   puts "Please enter the name of the students"
   puts "To finish, just hit return twice"
   # create an empty arrray
   students = []
   # get a name
   name = gets.chomp
  # while name isn't empty rinse and repeat
   while !name.empty? do
     students << {name: name, cohort: :november}
     puts "Now we have #{students.count} students"
     name = gets.chomp
   end
  # return arrray
   students
  end
students = input_students
print_header
print_(students)
print_footer(students)
