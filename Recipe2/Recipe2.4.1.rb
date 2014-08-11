def add_to_all(array,number)
	#collect=map
	array.collect { |x| x+number}
end

puts add_to_all([1,2,3],10)
