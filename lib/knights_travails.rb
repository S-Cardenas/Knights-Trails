require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder
  attr_accessor :visited_positions, :board
  def initialize(starting_position)
    @starting_position = PolyTreeNode.new(starting_position)
    @visited_positions = [@starting_position.value]
  end

  # def [](pos)
  #   x, y = pos
  #   @board[x][y]
  # end
  #
  # def []=(pos, val)
  #   x, y = pos
  #   @board[x][y] = val
  # end

  def valid_moves(pos)
    valid_moves = []

    x = [-2, -1, 1, 2]
    y = [-2, -1, 1, 2]

    x.each do |row|
      y.each do |col|
        next if row.abs == col.abs
        next if ((pos[0] + row) > 7) || ((pos[0] + row) < 0)
        next if ((pos[1] + col) > 7) || ((pos[1] + col) < 0)

        valid_moves << [pos[0] + row, pos[1] + col]
      end
    end
    valid_moves
  end

  def new_move_pos(pos)
    valid_moves = valid_moves(pos)
    new_moves = valid_moves.reject {|el|  visited_positions.include?(el)}
    valid_moves.each {|el| @visited_positions << el unless visited_positions.include?(el)}
    new_moves
  end

  def build_move_tree
    queue = [@starting_position]
    until queue.empty?
      node = queue.shift
      new_move_pos(node.value).each do |node_pos|
        child = PolyTreeNode.new(node_pos)
        queue << child
        node.add_child(child)
      end
    end
    @starting_position
  end
end
#
#   def build_move_tree
#     queue = []
#     queue << self
#     until queue.empty?
#       @tree << queue[0].value
#       queue[0].new_move_pos().visited_positions.each do |pos|
#         queue << KnightPathFinder.new(pos)
#       end
#       queue.shift
#     end
#     @tree
# end
