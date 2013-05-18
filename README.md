# Mongoid::Paginate

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid_paginate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_paginate

## Usage

```ruby
class Document
  include Mongoid::Document
  include Mongoid::Paginate

  field :name, type: String

  paginate(per_page: 20)
end

# works just like a scope
Document.paginate(params[:page])

# for working in the view, calculate the total number of pages
@pages = Document.pages
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
