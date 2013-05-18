# encoding: utf-8
require 'spec_helper'
describe Mongoid::Paginate do

  before(:each) do
    Document.per_page = 15
    @document = Document.create(name: '0')
    (1..20).each do |n|
      Document.create(name: n.to_s)
    end
  end

  describe '.paginate' do
    it 'returns the correct number of objects' do
      docs = Document.paginate('1')
      docs.to_a.length.should eq(15)
    end

    it 'returns the correct objects' do
      page1 = Document.paginate('1')
      page1.first.should == @document
      page2 = Document.paginate('2')
      page2.should_not include(@document)
    end
  end

  describe '.pages' do
    it 'returns the number of pages' do
      pages = Document.pages
      pages.should eq(2)
    end
  end

  describe 'per_page' do
    it 'defaults to 10' do
      DefaultDocument.per_page.should eq(10)
    end
  end
end