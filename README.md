# Mongoid::Paginate [![Build Status](https://secure.travis-ci.org/seanslerner/mongoid_paginate.png)](https://secure.travis-ci.org/seanslerner/mongoid_paginate.png)

Mongoid::Paginate provides simple pagination for Mongoid ODM.

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

### Sinatra

v0.0.2 includes the `paginate` view helper. For classic Sinatra apps you don't need to do anything. For modular applications you will have to register the extension.

```ruby
# app.rb
App < Sinatra::Base
  register Mongoid::Paginate::Sinatra

  get '/' do
    @documents = Document.paginate(params[:page])
  end
end

# views/index.erb
<%= @ducuments.each do |document| %>
  <p><%= document.name %></p>
<% end %>

<%= paginate Document %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
