require_relative 'person'

# inherit form person
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, parent_permission: true, name: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
