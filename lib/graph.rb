class Vertex
  attr_accessor :value, :in_edges, :out_edges
  def initialize(value)
    @value, @in_edges, @out_edges = value, [], []
    @visited = false
  end

  def visited?
   @visited
 end

 def visit!
   @visited = true
 end
end

class Edge
  attr_accessor :to_vertex, :from_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    self.from_vertex = from_vertex
    self.to_vertex = to_vertex
    self.cost = cost

    to_vertex.in_edges << self
    from_vertex.out_edges << self
  end

  def destroy!
    self.to_vertex.in_edges.delete(self)
    self.from_vertex.out_edges.delete(self)
    self.from_vertex = nil
    self.to_vertex = nil
  end
end
