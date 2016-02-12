require 'byebug'

class PolyTreeNode
  attr_accessor :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end



  def parent=(parent)
    @parent.children.delete(self) if !@parent.nil?

    parent.children << self if !parent.nil? && !parent.children.include?(self)
    @parent = parent
  end

  def add_child(child)
    children << child
    child.parent = self
  end

  def remove_child(child)
    raise "Not a child" if !children.include?(child)
    children.delete(child)
    child.parent = nil
  end

end
