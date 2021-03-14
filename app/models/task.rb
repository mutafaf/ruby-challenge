class Task

  # def initialize words_list
  #   @words_list = words_list
  # end
  def self.gen_graph(words_list)
    seq_hash = Hash.new { |h, k| h[k] = [] }
    words_list.each_cons(2) do |first_word, second_word|
      i = 0
      j = 0

      while i < first_word.length && j < second_word.length
        fwc, swc = first_word[i], second_word[j]
        if fwc.eql? swc
          i += 1
          j += 1
        else
          seq_hash[fwc].push swc unless seq_hash[fwc].include? swc
          break
        end
      end
    end
    seq_hash
  end

  def self.depth_search(graph, n, parent_obj, nest_seq, processing)
    processing[n] = true
    graph[n].each do |m|
      return if processing[m]
      if !parent_obj.has_key?(m)
        parent_obj[m] = n
        return if depth_search(graph, m, parent_obj, nest_seq, processing).nil?
      end
    end
    processing[n] = false
    nest_seq.unshift(n)
  end

  def self.get_alphabets words_list
    graph = gen_graph(words_list)
    parent_obj = {}
    sq_hash = Hash.new(false)
    sequence = []

    graph.keys.each do |n|
      if !parent_obj.has_key?(n)
        parent_obj[n] = nil
        return "" if depth_search(graph, n, parent_obj, sequence, sq_hash).nil?
      end
    end
    sequence
  end
end
