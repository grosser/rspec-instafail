# rspec-instafail
[![Gem Version](https://badge.fury.io/rb/rspec-instafail.svg)](https://rubygems.org/gems/rspec-instafail)
[![Build Status](https://travis-ci.org/grosser/rspec-instafail.svg)](https://travis-ci.org/grosser/rspec-instafail)

Show failing specs instantly. Show passing spec as green dots as usual.

**Upgrading to 1.0 ?** add `--format progress`

Output
======

```
....................................................*....
1) ApplicationController#sign_out_and_redirect with JSON should return JSON indicating success
   Failure/Error: json_response = JSON.parse response.body
   A JSON text must at least contain two octets!
   # /Users/miwillhite/.rvm/gems/ruby-1.9.2-p0/gems/json_pure-1.4.6/lib/json/common.rb:146:in `initialize'
   # /Users/miwillhite/.rvm/gems/ruby-1.9.2-p0/gems/json_pure-1.4.6/lib/json/common.rb:146:in `new'
   # /Users/miwillhite/.rvm/gems/ruby-1.9.2-p0/gems/json_pure-1.4.6/lib/json/common.rb:146:in `parse'
   # ./spec/controllers/application_controller_spec.rb:17:in `block (4 levels) in <top (required)>'
..................................................................

Finished in 650.095614 seconds

1680 examples, 1 failure, 1 pending
```



Install
=======

Rspec 2.x and higher
--------------------

```Bash
gem install rspec-instafail

# .rspec
--require rspec/instafail
--format RSpec::Instafail
--format progress # to keep dots appear
```

Rspec 1.x
---------

You have to use the version 0.4.0 with this version of Rspec. See the [0.4.0 branch](https://github.com/grosser/rspec-instafail/tree/v0.4).

Alternatives
============

Use built-in `--fail-fast`

Authors
=======

### [Contributors](http://github.com/grosser/rspec-instafail/contributors)
 - [Matthew Willhite](http://github.com/miwillhite)
 - [Jeff Kreeftmeijer](http://jeffkreeftmeijer.com)
 - [Steve Tooke](http://tooky.github.com)
 - [Josh Ellithorpe](https://github.com/zquestz)
 - [Raphael Sofaer](https://github.com/rsofaer)
 - [Mike Mazur](https://github.com/mikem)
 - [vernonR2](https://github.com/vernonR2)
 - [Olek Janiszewski](https://github.com/exviva)
 - [Kevin Carter](https://github.com/DexterTheDragon)

[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT
