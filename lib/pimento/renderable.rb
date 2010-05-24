module Pimento
  module Renderable
    def render(suffix = nil, options = {})
      template = open(File.dirname(__FILE__) + '/../../template/%s.xml.erb' % template_name(suffix)).read
      ERB.new(template).result(binding)
    end

    def template_name(suffix)
      basename = Util.underscore(self.class.to_s.split(/::/).last)
      suffix ? [basename, suffix].join('_') : basename
    end
  end
end
