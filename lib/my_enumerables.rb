module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    my_each do |v|
      yield(v, i)
      i += 1
    end
    self
  end

  def my_select
    arr = []
    my_each do |v|
      arr << v if yield(v)
    end
    arr
  end

  def my_any?
    my_each do |v|
      return true if yield(v) == true
    end
    false
  end

  def my_all?
    my_each do |v|
      return false unless yield(v)
    end
    true
  end

  def my_none?
    my_each do |v|
      return false if yield(v)
    end
    true
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each do |v|
      count += 1 if yield(v)
    end
    count
  end

  def my_map
    my_each_with_index do |v, i|
      self[i] = yield(v)
    end
  end

  def my_inject(initial_value)
    my_each do |v|
      initial_value = yield(initial_value, v)
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    length.times do |i|
      yield(self[i])
    end
    self
  end
end
