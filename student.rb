require './person'

# Create class Student
class Student < Person
  attr_reader :classroom

  def initialize(classroom, name, age = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hoocky
    '¯(ツ)/¯'
  end
end
