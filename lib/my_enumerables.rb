module Enumerable
  # Your code goes here
  def my_each_with_index
    length.times do |i|
      yield(self[i], i)
    end
    self
  end

  def my_select
    new_array = []
    my_each do |v|
      new_array << v if yield(v) == true
    end
    new_array
  end

  def my_any?
    my_each do |v|
      return true if yield v
    end
    false
  end

  def my_all?
    my_each do |v|
      return false unless yield v
    end
    true
  end

  def my_none?
    my_each do |v|
      return false if yield v
    end
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    my_each do |v|
      count += 1 if yield(v)
    end
    count
  end

  def my_map
    new_array = []
    my_each do |v|
      new_array << yield(v)
    end
    new_array
  end

  def my_inject(total)
    my_each do |v|
      total = yield(total, v)
    end
    total
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
