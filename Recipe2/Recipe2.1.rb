def my_lambda(&ablock)
	ablock
end

b = my_lambda { puts "lambda factory" }
b.call
