@months = [:January, :Febuary, :March, :April, :May, :June, :July, :August,
          :September, :October, :November, :December]
@default_name = "Anon"

def intro
  puts "Welcome to Villian Academy student enrolement"
  puts "---------------------------------------------"
  puts ""
end


def input_students
 students = []
 puts "Whats is the students name?".center(20)
 villian = gets.strip

 puts "What cohort are they part of?".center(20)
 month = gets.capitalize.strip

 puts "Would you like to add more information?".center(20)
 answer = gets.downcase.strip

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
    if answer == "yes"
      puts "Do they have a hobby?".center(20)
      hobby = gets.chomp.capitalize

      puts "How all are they in cms?".center(20)
      height = gets.chomp

      puts "What is there country of birth?".center(20)
      birth = gets.chomp.capitalize
    else
      hobby = "N/A"
      height = "N/A"
      birth  = "N/A"
    end

    students << {name: name, cohort: cohort, height: height, hobby: hobby,
                 birth: birth,}
      if students.count == 1
         puts "Now we have #{students.count} student".center(20)
      else
        puts "Now we have #{students.count} students".center(20)
      end
      puts "Enter another student or type 'quit' to exit".center(20)
      villian = gets.chomp
       if villian == 'quit'
         break
       end
      puts "And what cohort are they part of".center(20)
      month = gets.capitalize.chomp

      puts "Would you like to add more information?".center(20)
      answer = gets.downcase.strip

 end
 students
end


def print_(students)
     if students.count <= 0
       puts "There are currently no enrolled students"
     else
       puts "Enrolled Students"
       students.each_with_index do |student, index|
       puts ""
       puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(20)
       puts "---------------------------".center(20)
      end
   end
end

def students_by_cohort(students)
  puts students.select { |cohort| cohort[:cohort] == :June  }
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
  if students.count <= 0
    puts ""
  elsif students.count == 1
   puts "Overall, we have #{students.count} great student".center(20)
  else
   puts "Overall, we have #{students.count} great students".center(20)
  end
   puts ""
end

intro
students = input_students
print_(students)
print_footer(students)
students_by_cohort(students)
#select_students(students)
#select_student_length(students)
