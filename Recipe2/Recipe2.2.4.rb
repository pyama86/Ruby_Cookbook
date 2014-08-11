squares = {0=>0,1=>1,2=>4,3=>9,4=>16}

#オーバーライド
class Hash
	def find_all
		new_hash = Hash.new
		each { |k,v| new_hash[k] = v if yield(k,v)}
		new_hash
	end
end

h=squares.find_all { | key,value | key > 1}
#h=squares.find { |key,value | key >1 }

puts h;
