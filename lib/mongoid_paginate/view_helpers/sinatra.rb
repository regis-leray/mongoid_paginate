require 'sinatra/base'

module Mongoid::Paginate
  module Sinatra
    module Helpers
      def paginate klass
        page = ['<div class="pagination">','<ul>']
        (1..klass.pages).each do |n|
          page << "<li><a href='#{request.path}?page=#{n}'>#{n}</a></li>"
        end
        page << "</ul></div>"
        page.join
      end
    end

    def self.registered(app)
      app.helpers Helpers
    end

    ::Sinatra.register self
  end
end