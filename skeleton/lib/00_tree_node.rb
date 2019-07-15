class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        old_parent = self.parent
        old_parent.children.delete(self) unless old_parent.nil?
        
        @parent = new_parent
            
        new_parent.children << self unless new_parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        if !@children.include?(child_node)
            raise "This is not a child"
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child_node|
            result = child_node.dfs(target_value)
            return result if !result.nil?
        end
        nil
    end

    def bfs(target_value)
        arr = [self]
        until arr.empty?
            curr_node = arr.shift
           return curr_node if curr_node.value == target_value
           arr += curr_node.children
        end
        nil
    end
end