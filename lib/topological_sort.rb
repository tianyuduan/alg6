require_relative 'graph'

# Implementing sub_ansological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)

  sorted = []
  sub_ans = []
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      sub_ans.push(vertex)
    end
  end

  return sub_ans if sub_ans.empty?

  until sub_ans.empty?
    current = sub_ans.shift
    sorted << current
    current.out_edges.each do |edge|
      edge.to_vertex.in_edges.delete(edge)
      if edge.to_vertex.in_edges.empty?
        sub_ans.push(edge.to_vertex)
      end
    end
  end
  if sorted.length < vertices.length
    return []
  end
  sorted
end
