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

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      result = child.dfs(target_value)
      next if result.nil?
      return result
    end

    nil
  end

  def bfs(target_value)
    queue = []

    queue << self

    until queue.empty?
      node = queue.shift
      if node.value == target_value
        return node
      else
        queue += node.children
      end

    nil
  end

end
