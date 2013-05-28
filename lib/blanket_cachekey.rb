require "blanket_cachekey/version"
require 'rails'
require 'pry'

module BlanketCachekey

  class << self
    attr_accessor :cache
  end


  def self.included(model)
    model.class_eval do

      after_save :update_blanket_cachekey

      private

      def update_blanket_cachekey
        self.class.update_blanket_cachekey
      end


      class << self


        def blanket_cachekey 
          BlanketCachekey.cache.fetch(blanket_cachekey_name) do
            "#{table_name}:#{Time.now.to_i}:#{Time.now.nsec}"
          end
        end

        def update_blanket_cachekey
          BlanketCachekey.cache.delete blanket_cachekey_name
        end

        private 

        def blanket_cachekey_name
          "blanket_cachekey:name:#{self.table_name}"
        end


      end

    end

  end

end
