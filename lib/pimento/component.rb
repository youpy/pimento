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
        @@klasses[type].first
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
      render('ro', :id_offset => id_offset).to_s
    end

    def render_object_record(id_offset, obj_offset)
      render('or', :id_offset => id_offset, :obj_offset => obj_offset).to_s
    end
  end
end

Dir[File.expand_path(File.dirname(__FILE__) + '/component/*.rb')].each do |file|
  require file
end
