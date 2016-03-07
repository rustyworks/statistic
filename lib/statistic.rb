class Statistic
  attr_reader :list, :mean, :median, :mode, :max, :min, :count

  def initialize(list)
    @list = list.sort if list.all? { |x| x.is_a?(Numeric) }
  end

  def process
    @count  ||= @list.count
    @mean   ||= @list.reduce(:+) / @count.to_f
    @median ||= @count.odd? ? @list[(@count / 2.0)] : (@list[(@count / 2.0 - 1)] + @list[(@count / 2.0)]) / 2.0
    # @mode   ||= @list.
    @max    ||= @list.max
    @min    ||= @list.min
  end
end
