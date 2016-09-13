@months = [:January, :Febuary, :March, :April, :May, :June, :July, :August,
          :September, :October, :November, :December]
@default_name = "Anon"

def input_students
 students = []
 puts "Whats is the students name?"
 villian = gets.chomp

 puts "What cohort are they part of?"
 month = gets.capitalize.chomp

  while !villian.empty? || !month.empty? do
    if
      @months.include?(month.to_sym)
      cohort = month
    else
      cohort = :May
    end

    if villian == ""
      name = @default_name
    else
      name = villian.capitalize
    end

    students << {name: name, cohort: cohort}
      if students.count == 1
         puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
      puts "Enter another student or hit return twice to quit"
      villian = gets.chomp
      puts "And what cohort are they part of"
      month = gets.capitalize.chomp
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
#select_students(students)
#select_student_length(students)
