# frozen_string_literal: true

require_relative 'person'

# inherit form person
class Student < Person
  def initialize(age, classroom, parent_permission: true, name: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
