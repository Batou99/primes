require 'minitest/autorun'
require_relative '../lib/table'

describe Table do
  def setup
    @table = Table.new([1, 100, 1000, 1])
  end

  describe "#print" do
    it "prints 5 lines" do
      assert_equal 5, @table.lines.size
    end

    it "shows the list on the first line with right justification" do
      assert_equal ["   +", "   1", " 100", "1000", "   1"], @table.lines.first
    end

    it "sums the values in the contents" do
      assert_equal ["   1", "   2", " 101", "1001", "   2"], @table.lines.last
    end
  end
end
