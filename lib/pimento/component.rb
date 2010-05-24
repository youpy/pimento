module Pimento
  class Component
    include Renderable

    attr_reader :x, :y

    @@klasses = {}

    class << self
      def handles(*types)
        types.each do |type|
          @@klasses[type] ||= []
          @@klasses[type] << self
        end
      end

      def for(type)
        @@klasses[type][rand(@@klasses[type].length)]
      end
    end

    def initialize(canvas, x, y)
      @x = x
      @y = y
      @canvas = canvas
    end

    def num_objects
      2
    end

    def render_object(id_offset)
      render(template_name('ro'), :id_offset => id_offset).to_s
    end

    def render_object_record(id_offset, obj_offset)
      render('or_%i' % num_objects, :id_offset => id_offset, :obj_offset => obj_offset).to_s
    end

    def template_name(suffix)
      basename = Util.underscore(self.class.to_s.split(/::/).last)
      [basename, suffix].join('_')
    end
  end

  class DotComponent < Component; end

  class HorizontalLineComponent < Component
    attr_accessor :width

    def initialize(canvas, x, y, width)
      super(canvas, x, y)
      @width = width
    end
  end

  class VerticalLineComponent < Component
    attr_accessor :height

    def initialize(canvas, x, y, height)
      super(canvas, x, y)
      @height = height
    end
  end
end

Dir[File.expand_path(File.dirname(__FILE__) + '/component/*.rb')].each do |file|
  require file
end
