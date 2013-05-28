require 'spec_helper'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

class Bar < ActiveRecord::Base

  include BlanketCachekey

end

ActiveRecord::Schema.define(:version => 1) do
  create_table :bars do |t|
  end
end


describe BlanketCachekey do

  before :all do
    BlanketCachekey.cache = ActiveSupport::Cache::MemoryStore.new
  end

  it 'should have a version number' do
    BlanketCachekey::VERSION.should_not be_nil
  end

  describe '#blanket_cachekey' do

    subject { Bar }

    its(:blanket_cachekey){ should_not be_nil }

    specify 'blanket_cachekey should not change if no Bar has been modified in any way' do
      Bar.blanket_cachekey.should == Bar.blanket_cachekey
    end
    
    describe 'adding a new model causes a new blanket cache key to be invalidated for bar' do

      before do
        @old_cache_key = Bar.blanket_cachekey
        Bar.create!
      end

      its(:blanket_cachekey){ should_not == @old_cache_key }

    end

    describe 'updating a model causes blanket cache key to be invalidated for bar' do

      before do
        bar = Bar.create!
        @old_cache_key = Bar.blanket_cachekey
        bar.save!
      end

      its(:blanket_cachekey){ should_not == @old_cache_key }


    end

    describe 'destroying a model causes blanket cache key to be invalidated for bar' do

      before do
        bar = Bar.create!
        @old_cache_key = Bar.blanket_cachekey
        bar.destroy
      end

      its(:blanket_cachekey){ should_not == @old_cache_key }


    end


    

  end

end
