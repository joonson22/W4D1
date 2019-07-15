class GraphNode
  attr_accessor :val, :adjacent

  def initialize(val)
    self.val = val
    self.adjacent = []
  end

  def add_neighbor(node)
    self.adjacent << node
  end
end

def bfs(starting_node, target_value)
  queue = [starting_node]
  visited = Set.new()

  until queue.empty?
    node = queue.shift
    unless visited.include?(node)
      return node.val if node.val == target_value
      visited.add(node)
      queue += node.adjacent
    end
  end
  
  return nil
end