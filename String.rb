class String
  # Returns true if the string is itw own reverse
  def palindrome?
    self == self.reverse
  end
  def shuffle
    self.split('').shuffle().join('');
  end
end