def input_students
  puts "Please enter the name of the student"
  puts "To finish, hit return twice"
  students = []
  name   = gets.capitalize.strip
    if name == ""
       name = "Annonymous"
    end

  puts "And what cohort are they part of"
  cohort = gets.capitalize.strip
    if cohort == ""
       cohort = "Unknown"
    end

    while !name.empty? || !cohort.empty? do
        students << {name: name, cohort: cohort.to_sym}
            if students.count == 1
               puts "Now we have #{students.count} student"
            else
              puts "Now we have #{students.count} students"
            end
     puts "Enter another student or hit return twice to quit"
     name = gets.capitalize.strip
     puts "And what cohort are they part of"
     cohort = gets.capitalize.strip
    end
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "--------------------"
end


def print_(students)
  students.each_with_index do |student, index|
     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
     puts ""
  end
 end

def select_students(students)
  puts "Students with names starting with 'J'"
  puts students.select {|name| name[:name].include?("J") }
  puts ""
end

def select_student_length(students)
  puts "Students with names less than 12 characters"
  puts students.select { |name| name[:name].length < 13 }
  puts ""
end

def print_footer(students)
  if students.count == 1
   puts "Overall, we have #{students.count} great student"
  else
   puts "Overall, we have #{students.count} great students"
  end
   puts ""
end


students = input_students
print_header
print_(students)
print_footer(students)
select_students(students)
select_student_length(students)
