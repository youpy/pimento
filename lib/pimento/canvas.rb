require 'rubygems'
require 'erb'
require 'xml'

module Pimento
  class Canvas
    include Renderable

    attr_reader :width, :height

    FIRST_ID = 741820390
    FIRST_OBJ = 3

    def initialize(top, left, width, height)
      @top = top
      @left = left
      @width = width
      @height = height
      @components = []
    end

    def point(x, y)
      @components << Component.for(:dot).new(self, x, y)
    end

    def line(x1, y1, x2, y2)
      x = x1
      y = y1
      w = (x2 - x1).abs
      h = (y2 - y1).abs

      case
      when y1 == y2
        @components << Component.for(:horizontal_line).new(self, x, y, w)
      when x1 == x2
        @components << Component.for(:vertical_line).new(self, x, y, h)
      else
        line_with_dots(x1, y1, x2, y2)
      end
    end

    def line_with_dots(x1, y1, x2, y2, step = 20)
      x = x1
      y = y1
      w = (x2 - x1).abs
      h = (y2 - y1).abs

      num_dots = ((w > h) ? w : h) / step
      (num_dots + 1).times do |i|
        point(x1 + ((x2 - x1) / num_dots * i).to_i, y1 + ((y2 - y1) / num_dots * i).to_i)
      end
    end

    def to_xml
      XML::Document.string(render('canvas'), :options =>
        XML::Parser::Options::NOENT | XML::Parser::Options::NOBLANKS)
    end

    private

    def render_objects
      id_offset = FIRST_ID
      result = ''

      @components.each do |component|
        result += component.render_object(id_offset)
        id_offset += component.num_objects
      end

      result
    end

    def render_object_records
      obj_offset = FIRST_OBJ
      id_offset = FIRST_ID
      result = ''

      @components.each do |component|
        result += component.render_object_record(id_offset, obj_offset)
        obj_offset += component.num_objects
        id_offset += component.num_objects
      end

      result
    end
  end
end
