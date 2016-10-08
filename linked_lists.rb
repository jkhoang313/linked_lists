class LinkedList

	class Node
		attr_accessor :data, :next_node

		def initialize(data=nil, next_node=nil)
			@data = data
			@next_node = next_node
		end
	end

	def initialize(data)
		@head = Node.new(data, nil)
		@tail = @head
	end

	def append(data)
		@tail.next_node = Node.new(data, nil)
		@tail = @tail.next_node
	end

	def prepend(data)
		new_head = Node.new(data, @head)
		@head = new_head
	end

	def size
		count = 1
		return count if @head == @tail
		node = @head
		while node.next_node != nil
			node = node.next_node	
			count += 1
		end
		count
	end

	def head
		@head
	end
	
	def tail
		@tail
	end
	
	def at(index)
		return @head if index == 0
		return nil if index > (self.size - 1)
		node = @head
		times = 0
		while times < index
			times+=1
			node = node.next_node	
		end
		return node
	end
	
	def pop
		node = head
		while node.next_node.next_node !=nil
			node = node.next_node
		end
		@tail = node
		@tail.next_node = nil
	end
	
	def contains?(data)
		return true if @head.data == data
		node = @head
		while node.next_node != nil
			node = node.next_node
			return true if node.data == data
		end
		false
	end

	def find(data)
		return 0 if @head.data == data
		index = 1
		node = @head
		while node.next_node != nil
			node = node.next_node
			return index if node.data == data
			index += 1
		end
		nil	 
	end

	def to_s
		node = @head
		print "( #{node.data} )"
		while node.next_node != nil
			node = node.next_node
			print " -> " + "( #{node.data} )"
		end
		print " -> " + "( nil )"
	end

	def insert_at(index, data)
		if index < 0 || index > (self.size - 1)
			puts "Please enter a valid index."
		elsif index == 0
			self.prepend(data)
		else
			node = @head
			times = 1
			while times < index
				node = node.next_node
				times += 1
			end
			node.next_node = Node.new(data, node.next_node)
		end
	end

	def remove_at(index)
		if index < 0 || index > (self.size - 1)
			puts "Index doesn't exist."
		elsif index == 0
			new_head = @head.next_node
			@head = new_head
		else
			node = @head
			times = 1
			while times < index
				node = node.next_node
				times += 1
			end
			node_after = node.next_node.next_node
			node.next_node = Node.new(node_after.data, node_after.next_node)
		end
	end
end

a = LinkedList.new(4)
a.append(8)
a.append(10)
a.prepend(1)
a.append(13)
a.size
a.head
a.tail
a.at(1)
a.pop
a.contains?(8)
a.find(8)
a.insert_at(2, 6)
a.remove_at(3)
a.to_s
