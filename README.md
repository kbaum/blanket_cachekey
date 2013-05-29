# BlanketCachekey

[![Build Status](https://secure.travis-ci.org/kbaum/blanket_cachekey.png)](http://travis-ci.org/kbaum/blanket_cachekey)


Provides a rails cache key for caching data that should be invalidated whenever any ActiveRecord instance of a specific type is created, updated, or destroyed.


## Installation

Add this line to your application's Gemfile:

    gem 'blanket_cachekey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blanket_cachekey

## Usage

Include BlanketCachekey within your ActiveRecord class:

```ruby
class Bar < ActiveRecord::Base

  include BlanketCachekey

end
```

Now Bar has a blanket_cachekey method which is updated whenever any instance of Bar is created, updated, or destroyed.  This key can be used
as part of a cache key.

```haml
= cache ['bars_selector', Bar.blanket_cachekey] do
  f.input :bars, collection: Bar.all
```

Now whenever any Bar is created, updated, or saved, the cache fragment above will be regenerated on the next hit.






## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
