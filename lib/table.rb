class Table
  def initialize(list)
    @xs = list
    @ys = list

    @contents = if list == []
                  []
                else
                  @xs.product(@ys)
                     .collect { |x, y| x + y }
                     .each_slice(list.size)
                     .to_a
                end
  end

  def print
    lines.each do |line|
      print_line line
    end
  end

  # In an ideal world this method would also be private but did not
  # want to fiddle with ZenTest to capture puts output
  def lines
    first = ["+", @xs].flatten.map { |e| format(e) }
    rest  = @ys.zip(@contents).map do |lead, list|
      ([lead] + list).map { |e| format(e) }
    end

    [first] + rest
  end

  private

  def longest_size
    @contents.flatten.max.to_s.size
  end

  def format(val)
    val.to_s.rjust(longest_size, " ")
  end

  def print_line(list)
    puts list.join(" ")
  end
end
