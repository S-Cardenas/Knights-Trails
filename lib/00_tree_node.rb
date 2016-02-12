class PolyTreeNode
  attr_accessor :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end


  def children
    children
  end

  def parent=(parent)
    @parent = parent
    parents.children << self
  end




end
