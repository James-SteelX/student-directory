require 'CSV'
@students = []
@months = [:January, :Febuary, :March, :April, :May, :June, :July, :August,
          :September, :October, :November, :December]
@default_name = "John Doe" #easier to change defaults from outside of the main code.
@default_cohort = :May
@filename = "students.csv"

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
    puts "Thankyou"
    exit
  else
    puts "That is not a valid command"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
   #removed the while loop and replaced with quit command, seems less clumsy.
   questions
   checks
   add_students
   student_counter
   questions
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
  @hobby = STDIN.gets.chomp.capitalize

  puts "How all are they in cms?".center(20)
  @height = STDIN.gets.chomp

  puts "What is there country of birth?".center(20)
  @birth = STDIN.gets.chomp.capitalize
 else
  @hobby = "N/A"
  @height = "N/A"
  @birth  = "N/A"
  end
end

def add_students
  @students << {name: @name, cohort: @cohort, height: @height, hobby: @hobby,
                birth: @birth,}
end

def checks
  if
    @months.include?(@month.to_sym)
    @cohort = @month
  else
    @cohort = @default_cohort
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
       puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(20)
       puts "---------------------------".center(20)
      end
    end
end

def save_students
  #gives user options to save to same file or a new file.
  puts "Type 'yes' if you wish to use a file other than #{@filename} or just hit return"
  response = STDIN.gets.chomp.downcase
  if response == 'yes'
    puts "What file would you like to use? (please include .csv)"
    new_file = STDIN.gets.chomp
    puts "Saved to #{new_file}\n\n"
    save_array(new_file)
  else
    puts "Saved to #{@filename}.\n\n"
    save_array(@filename)
  end
end

def save_array(file_name)
  CSV.open(file_name, 'wb') do |add|
  @students.each do |student|
  add << [student[:name], student[:cohort], student[:height],
        student[:hobby], student[:birth]]
  end
 end
end

def try_load_students
  #if no file is provided, loads students.csv
  #exits program if file doesn't exist.
   unless ARGV.first.nil?
     @filename = ARGV.first
   end
   if File.exists?(@filename)
     @load_file = File.open(@filename, "r")
     load_array(@filename)
     puts "Loaded #{@students.count} students from #{@filename}"
   else
     puts "Sorry, #{@filename} doesn't exist."
     exit #quits the program
   end
end

def load_students
  #asks user if they want to load different file, if file doesnt exist it reverts to default.
  #if it exists it loads the file.
  puts "Type 'yes' if you wish to load a file other than #{@filename} or just hit return"
  response = STDIN.gets.chomp.downcase
  if response == 'yes'
   puts "What file would you like to load"
   new_load = STDIN.gets.chomp
    if !File.exists?(new_load)
      puts "File doesnt exist, reverting to #{@filename}\n\n"
      new_load = @filename
    end
    puts "Loaded #{new_load}\n\n"
   load_array(new_load)
 else
   puts "Loaded #{@filename}.\n\n"
   load_array(@filename)
  end
end

def load_array(load_file_name)
  #keeping the load function seperate cleans up load_students
  #adding arguments allows me to offer different file name with same piece of code
  CSV.foreach(load_file_name) do |line|
    @name, @cohort, @height, @hobby, @birth = line
    add_students
 end
end

def print_footer
  if @students.count <= 0
   puts "We currently have no students\n\n"
  elsif @students.count == 1
   puts "Overall, we have #{@students.count} great student\n\n"
  else
   puts "Overall, we have #{@students.count} great students\n\n"
  end
   puts ""
end
#not working yet
#def students_by_cohort(students)
#  puts students.select { |cohort| cohort[:cohort] == :June  }
#end
#works
#def select_students(students)
#  puts "Students with names starting with 'J'"
#  puts students.select {|name| name[:name].include?("J") }
#end
#works
#def select_student_length(students)
  #puts "Students with names less than 12 characters"
  #puts students.select { |name| name[:name].length < 13 }
  #puts ""
#end

try_load_students
interactive_menu
