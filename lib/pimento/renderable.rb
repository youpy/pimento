module Pimento
  module Renderable
    def render(name, options = {})
      template = open(File.dirname(__FILE__) + '/../../template/%s.xml.erb' % name).read
      ERB.new(template).result(binding)
    end
  end
end
