require 'rubygems'
require 'erb'
require 'xml'

module Pimento
  attr_accessor :step

  class Canvas
    def initialize(top, left, width, height)
      @step = 5
      @top = top
      @left = left
      @width = width
      @height = height
      @dots = []
      @obj_count = 2
      @id = 741820390
      @cell_id = 799499906
    end

    def point(x, y)
      @dots << Dot.new(x, y, @id, @cell_id)
      @id += 1
      @cell_id += 1
    end

    def line(x1, y1, x2, y2)
      x = x1
      y = y1
      w = (x2 - x1).abs
      h = (y2 - y1).abs

      num_dots = ((w > h) ? w : h) / @step

      num_dots.times do |i|
        point(x1 + ((x2 - x1) / num_dots * i).to_i, y1 + ((y2 - y1) / num_dots * i).to_i)
      end
    end

    def to_xml
      template = open(File.dirname(__FILE__) + '/../../template/canvas.xib.erb').read
      XML::Document.string(ERB.new(template).result(binding))
    end
  end
end
