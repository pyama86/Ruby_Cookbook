#*enumerablesは配列をまとめて受け取る
def interosculate(*enumerables)
	generators = enumerables.collect { |x| Generator.new(x) }
	done = false
	until done
		done = true
		generators.each do |g|
			if g.next?
				yield g.next
				done = false
			end
		end
	end
end

interosculate( %w{Four and} , %w{score seven years ago} ) do |x|
	puts x
end
