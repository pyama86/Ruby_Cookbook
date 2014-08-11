def call_twice
	puts "Im about to call your block1."
	yield
	puts "Im about to call your block2."
	yield
end

call_twice { puts "test" }
