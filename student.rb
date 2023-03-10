require_relative 'person'

# inherit form person
class Student < Person
  attr_accessor :classroom

  def initialize(age, _classroom, parent_permission: true, name: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def belongs_to_classroom?(classroom)
    @classroom == classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
