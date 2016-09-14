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
  puts "4. Load a list of the students"
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
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
   questions
   while !@villian.empty? || !@month.empty? do
   checks
   @students << {name: @name, cohort: @cohort, height: @height, hobby: @hobby,
                 birth: @birth,}
    student_counter
    questions
   end
 @students
end

def questions

 puts "Enter a student name or type quit to return to the menu".center(20)
 @villian = STDIN.gets.strip
   if @villian == 'quit'
     interactive_menu
   end

 puts "What cohort are they part of?".center(20)
 @month = STDIN.gets.capitalize.strip

 puts "Would you like to add more information?".center(20)
 answer = STDIN.gets.downcase.strip

 if answer == "yes"
  puts "Do they have a hobby?".center(20)
  hobby = STDIN.gets.chomp.capitalize

  puts "How all are they in cms?".center(20)
  height = STDIN.gets.chomp

  puts "What is there country of birth?".center(20)
  birth = STDIN.gets.chomp.capitalize
 else
  @hobby = "N/A"
  @height = "N/A"
  @birth  = "N/A"
  end
end

def checks
  if
    @months.include?(@month.to_sym)
    @cohort = @month
  else
    @cohort = :May
  end
  if @villian == ""
    @name = @default_name
  else
    @name = @villian.capitalize
  end
end

def student_counter
  if @students.count == 1
     puts "Now we have #{@students.count} student".center(20)
  else
    puts "Now we have #{@students.count} students".center(20)
  end

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

def try_load_students
   filename = ARGV.first #first argument from the command line
   return if filename.nil? #get out of method if nothing is given
   if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
   else
     puts "Sorry, #{filename} doesn't exist."
     exit #quits the program
   end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
   @students << {name: name, cohort: cohort.to_sym}
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
