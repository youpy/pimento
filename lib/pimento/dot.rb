module Pimento
  class Dot
    attr_reader :x, :y, :id, :cell_id

    def initialize(x, y, id, cell_id)
      @x = x
      @y = y
      @id = id
      @cell_id = cell_id
    end
  end
end
