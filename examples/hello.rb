require 'ubygems'
require 'pimento'

c = Pimento::Canvas.new(0, 0, 620, 200)
c.step = 1

# H
c.line(20, 20, 20, 180)
c.line(20, 100, 100, 100)
c.line(100, 20, 100, 180)

# E
c.line(140, 20, 140, 180)
c.line(140, 20, 220, 20)
c.line(140, 100, 220, 100)
c.line(140, 180, 220, 180)

# L
c.line(260, 20, 260, 180)
c.line(260, 180, 340, 180)

# L
c.line(380, 20, 380, 180)
c.line(380, 180, 460, 180)

# O
c.line(500, 20, 500, 180)
c.line(500, 20, 580, 20)
c.line(500, 180, 580, 180)
c.line(580, 20, 580, 180)

c.to_xml.save('hello.xib')
