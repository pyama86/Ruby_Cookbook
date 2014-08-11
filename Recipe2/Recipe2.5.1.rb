require 'pp'
class Tree
	#ゲッター
	attr_reader :value

	def initialize(value)
		@value = value
		@children = []
	end

	def <<(value)
		subtree = Tree.new(value)
		@children << subtree
		return subtree
	end

	def each
		yield value # { | value | puts value }
		
		#再帰的に処理を行う
		@children.each do |child_node|
			child_node.each { |e| yield e }
			#　展開すると
			# { |e| { |x| puts x } e }
			# { |e| puts e }
		end
	end
end

t = Tree.new("parent")
child1 = t << "child1"
child1 << "gchild1.1"
child1 << "gchild1.2"

child2 = t << "child2"
child2 << "gchild2.1"

t.each { |x| puts x }
