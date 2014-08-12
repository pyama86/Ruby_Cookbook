module Enumerable
	def find_no_more_than(limit)
		inject([]) do |a,e|
			#偶数だったらaにpushする
			a << e if yield e
			#limitに到達したらリターン
			return a if a.size >= limit
			a
		end
	end
end

a = [ 1,2,3,4,5,6,7,8,9,10 ]
puts a.find_no_more_than(3) { |x| x % 2 == 0 }
