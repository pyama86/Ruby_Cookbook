def call_twice
	puts "1回目"
	ret1=yield("first")
	puts "1回目の戻り値=#{ret1}"
	
	puts "2回目"
	ret2=yield("second");
	puts "2回目の戻り値=#{ret2}"
end

call_twice do |whichtime|
	puts "#{whichtime}"
	whichtime == "first" ? 1:2
end
#call_twice { |whichtime| puts"#{whichtime}";whichtime=="first" ? 1:2 }

