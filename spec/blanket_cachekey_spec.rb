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
  it 'should have a version number' do
    BlanketCachekey::VERSION.should_not be_nil
  end

  describe '#blanket_cachekey' do

    subject { Bar }

    its(:blanket_cachekey){ should_not be_nil }
    
    describe 'adding a new model to the database causes a new blanket cache key to be created for bar' do

      before do
        @old_cache_key = Bar.blanket_cachekey
        Bar.create!
      end

      its(:blanket_cachekey){ should_not == @old_cache_key }


    end

    

  end

end
