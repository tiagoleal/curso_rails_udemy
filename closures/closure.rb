def new_counter
  i = 0
  lambda { i += 1 }
end

c1 = new_counter
puts c1.call
puts c1.call
puts c1.call
puts c1.call
puts c1.call
