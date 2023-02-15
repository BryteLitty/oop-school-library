# frozen_string_literal: true

class Person
  def initialize(age, _parent_permission = true, name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  # for both getters and setters
  attr_accessor :id
  attr_accessor :name
  attr_accessor :age

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    @age >= 18
  end
end
