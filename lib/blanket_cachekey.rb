require "blanket_cachekey/version"

module BlanketCachekey

  def self.included(model)
    model.class_eval do


      def self.blanket_cachekey 
        "#{table_name}:#{Time.now.to_i}:#{Time.now.nsec}"
      end

    end

  end

end
