require_relative "./skeleton/00_tree_node.rb"
class KnightPathFinder

    def initialize(starting_pos) #starting pos = array ex: [0,0]
        @starting_pos = starting_pos
        @root_node = PolyTreeNode.new([0,0])
        @considered_positions = [[0,0]]
    end

    self.valid_moves(pos)

    end

    def new_move_positions(pos)
        unless @considered_positions.include?(pos)
            pos.valid_moves
            @considered_positions << pos
        end
    end
end

kpf = KnightPathFinder([0,0])