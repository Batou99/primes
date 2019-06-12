require 'minitest/autorun'
require_relative '../lib/table'

describe Table do
  def setup
    @table = Table.new([1, 100, 1000, 1])
  end

  describe "#print" do
    it "prints 4 lines" do
      assert_equal 4, @table.lines.size
    end

    it "sums the values in the contents" do
      assert_equal ["1001", "1100", "2000", "1001"], @table.lines[2]
    end

    it "has the correct table (exercise example)" do
      @table = Table.new([2, 3, 5])

      assert_equal [" 4", " 5", " 7"], @table.lines[0]
      assert_equal [" 5", " 6", " 8"], @table.lines[1]
      assert_equal [" 7", " 8", "10"], @table.lines[2]
    end
  end
end
