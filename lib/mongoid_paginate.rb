require "mongoid_paginate/version"

module Mongoid::Paginate
  def self.included(base)
    base.send(:cattr_accessor, :per_page)
    base.per_page = 10
    base.extend PaginateClassMethods
  end

  module PaginateClassMethods
    def paginate(opts={})
      self.per_page = opts[:per_page] if opts[:per_page]
      self.scope :paginate, ->(page) {
        limit(self.per_page).skip((page.to_i - 1) * self.per_page)
      }
    end

    def pages
      (self.count / self.per_page.to_f).ceil
    end
  end
end
