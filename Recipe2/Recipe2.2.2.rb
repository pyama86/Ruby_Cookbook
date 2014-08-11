def repeat(n)
	if block_given?
		n.times { yield}
	else
		raise ArugumentError.new("引数エラー")
	end
end

repeat(4) { puts "呼び出し4回" }
