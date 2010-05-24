# based on http://gist.github.com/411787

require 'ubygems'
require 'pimento'

str = ARGV.shift
exit unless str =~ /^[\d\w ]+$/
x = 50
c = Pimento::Canvas.new 0,0,x+str.size*x*2,x*4
d = [
  lambda {|i| c.line x+i*2*x,x,2*x+i*2*x,x },
  lambda {|i| c.line x+i*2*x,2*x,2*x+i*2*x,2*x },
  lambda {|i| c.line x+i*2*x,3*x,2*x+i*2*x,3*x },
  lambda {|i| c.line x+i*2*x,x,x+i*2*x,2*x },
  lambda {|i| c.line x+i*2*x,2*x,x+i*2*x,3*x },
  lambda {|i| c.line 2*x+i*2*x,x,2*x+i*2*x,2*x },
  lambda {|i| c.line 2*x+i*2*x,2*x,2*x+i*2*x,3*x },
  lambda {|i| c.line x+i*2*x,x,1.5*x+i*2*x,2*x },
  lambda {|i| c.line 1.5*x+i*2*x,2*x,2*x+i*2*x,x },
  lambda {|i| c.line x+i*2*x,3*x,1.5*x+i*2*x,2*x },
  lambda {|i| c.line 1.5*x+i*2*x,2*x,2*x+i*2*x,3*x },
  lambda {|i| c.line 1.5*x+i*2*x,2*x,2*x+i*2*x,2*x },
  lambda {|i| c.line x+i*2*x,2*x,1.5*x+i*2*x,2*x },
  lambda {|i| c.line 1.5*x+i*2*x,x,1.5*x+i*2*x,2*x },
  lambda {|i| c.line 1.5*x+i*2*x,2*x,1.5*x+i*2*x,3*x },
]
n = {
  ' ' => [],
  '0' => [0,2,3,4,5,6],
  '1' => [5,6],
  '2' => [0,1,2,5,4],
  '3' => [0,1,2,5,6],
  '4' => [1,3,5,6],
  '5' => [0,1,2,3,6],
  '6' => [0,1,2,3,4,6],
  '7' => [0,5,6],
  '8' => [0,1,2,3,4,5,6],
  '9' => [0,1,2,3,5,6],
  'A' => [0,1,3,4,5,6],
  'B' => [1,2,3,4,6],
  'C' => [0,2,3,4],
  'D' => [1,2,4,5,6],
  'E' => [0,1,2,3,4],
  'F' => [0,1,3,4],
  'G' => [0,2,3,4,6,11],
  'H' => [1,3,4,5,6],
  'I' => [13,14],
  'J' => [2,5,6],
  'K' => [3,4,8,10,12],
  'L' => [2,3,4],
  'M' => [0,3,4,5,6,13],
  'N' => [3,4,5,6,7,10],
  'O' => [0,2,3,4,5,6],
  'P' => [0,1,3,4,5],
  'Q' => [0,2,3,4,5,6,10],
  'R' => [0,1,3,4,5,10],
  'S' => [0,1,2,3,6],
  'T' => [0,13,14],
  'U' => [2,3,4,5,6],
  'V' => [3,4,8,9],
  'W' => [2,3,4,5,6,14],
  'X' => [7,8,9,10],
  'Y' => [1,2,3,5,6],
  'Z' => [0,2,8,9],
}
str.to_s.split(//).each_with_index do |ch, i|
  n[ch.upcase].reverse.each do |r|
    d[r].call i
  end
end

c.to_xml.save 'a.xib'
#`open a.xib`
