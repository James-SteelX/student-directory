@months = [:January, :Febuary, :March, :April, :May, :June, :July, :August,
          :September, :October, :November, :December]
@default_name = "Anon"
@students = []
def intro
  puts "Welcome to Villian Academy student enrolement"
  puts "---------------------------------------------"
  puts ""
end

def print_menu
  puts "1. Input Students"
  puts "2. Show students"
  puts "3. Save the list of students"
  puts "9. Exit"
end

def show_students
  intro
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
 students = @students
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
      puts "Enter another student or type 'quit' to return to the menu".center(20)
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


def print_students_list
     if @students.count <= 0
       puts "There are currently no enrolled students"
     else
       puts "Enrolled Students"
       @students.each_with_index do |student, index|
       puts ""
       puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(20)
       puts "---------------------------".center(20)
      end
   end
end

def save_students
  file = File.open("students.csv", "w")
  #iterates over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
 file.close
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

def print_footer
  if @students.count <= 0
    puts ""
  elsif @students.count == 1
   puts "Overall, we have #{@students.count} great student".center(20)
  else
   puts "Overall, we have #{@students.count} great students".center(20)
  end
   puts ""
end

interactive_menu
#intro
#students = input_students
#print_(students)
#students_by_cohort(students)
#select_students(students)
#select_student_length(students)
