=begin
Write a small archiving program that stores students' names along with the grade that they are in.
In the end, you should be able to:
Add a student's name to the roster for a grade
"Add Jim to grade 2."
"OK."
Get a list of all students enrolled in a grade
"Which students are in grade 2?"
"We've only got Jim just now."
Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.
{1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}
The exact output format doesn't matter: what's important is that it shows all of the students and grades in the proper order.
Note that all our students only have one name. (It's a small town, what do you want?)

Notes:
When School object created, create instance var to store empty hash data structure
Hash has key as a grade; integer from 1 to 12
Hash has value of an array of strings; each string is a name of a student
School#add will take a string and a integer and add entry to hash ds
School#to_h will take entire hash ds and return
School#grade will take a integer representing grade; will output correspodning value (array of strings)

Student names are strings with no spaces; each student has one name
=end

class School
  def initialize
    @hash = Hash.new([])
  end
  
  def add(student, grade)
    raise "Grade inputted isn't valid" unless (1..12).to_a.include?(grade)
    if @hash[grade].empty?
      @hash[grade] = [student]
    else
      @hash[grade] << student
    end
    @hash[grade].sort!
    nil
  end
  
  def to_h
    @hash.sort.to_h
  end
  
  def grade(num)
    @hash[num]
  end
end