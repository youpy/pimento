# pimento

Draw graphics using Mac OS X GUI Components

![piment](http://buycheapviagraonlinenow.com/files/pimento.png)

## Synopsis

    require 'ubygems'
    require 'pimento'

    c = Pimento::Canvas.new(0, 0, 620, 200)

    c.point(20, 20, 20, 180)
    c.line(20, 100, 100, 100)
    c.line_with_dots(100, 20, 100, 180)

    c.to_xml.save('foo.xib')
    # open foo.xib with Interface Builder

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don’t break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright © 2010 youpy. See LICENSE for details.
