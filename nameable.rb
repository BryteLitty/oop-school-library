class Nameable
  def correct_name
    raise NotImplementedError, "The method 'correct_name' has not been implemented by #{self.class.name}"
  end
end
