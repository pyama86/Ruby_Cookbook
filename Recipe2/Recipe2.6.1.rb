require 'pp'
require 'enumerator'
array = %w{bob loves alice}

#Enumeratorを作成する
reversed_array = array.to_enum(:reverse_each)
a = reversed_array.collect { |x| x.capitalize }
pp a

#indexと値を取り出すにはeach_with_indexを使用する
reversed_array.each_with_index do | x,i|
	puts %{ #{i}=>"#{x}" }
end
