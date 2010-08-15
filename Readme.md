Show failing specs instantly. Show passing spec as green dots as usual.

Output
======
    ....................................................*....
    1: User as seller should be a seller when it has an activated shop
     -> expected is_seller? to return false, got true
    ..................................................................
    2: Product validations is invalid with too short title
     -> expected not: == 1,
         got:    1
    ............................................................
    Finished in 650.095614 seconds

    1680 examples, 2 failure, 1 pending



Install
=======
    script/plugin install git://github.com/grosser/rspec-instafail.git 


    # spec/spec.opts
    --format RSpec::Instafail

    # spec/spec_helper.rb -- somewhere after loading environment
    require 'rspec/instafail'

Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...