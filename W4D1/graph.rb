require "set"
require "byebug"
class GraphNode

    attr_reader :neighbors, :val

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def add_neighbor(val)
        @neighbors << val
    end
end

def bfs(starting_node, target_value)
    que = [starting_node]
    checked = Set.new()
    while que.length != 0
        check = que.shift
        if !checked.include?(check)
            if check.val == target_value
                return check.val 
            else
                checked.add(check)
                que += check.neighbors
            end
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.add_neighbor([b, c, e])
c.add_neighbor([b, d])
e.add_neighbor([a])
f.add_neighbor([e])