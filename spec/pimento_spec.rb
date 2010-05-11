require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Pimento::Canvas do
  describe '.new' do
    it 'should create canvas' do
      canvas = Pimento::Canvas.new(120, 240, 100, 200)
      canvas.to_xml.to_s.should eql(open(fixture('empty.xib')).read)
    end
  end

  describe '#point' do
    before do
      @canvas = Pimento::Canvas.new(120, 240, 100, 200)
    end

    it 'should point' do
      @canvas.point(15, 25)
      @canvas.to_xml.to_s.should eql(open(fixture('1dot.xib')).read)
    end
  end
end
