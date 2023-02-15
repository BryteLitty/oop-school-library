# Person class
class Person
  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_writer :id
  attr_writer :name
  attr_writer :age

  attr_reader :id
  attr_reader :name
  attr_reader :age

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
