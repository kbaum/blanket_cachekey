module BlanketCachekey
  class Engine < ::Rails::Engine
    config.after_initialize do
      BlanketCachekey.cache = Rails.cache
    end
  end
end
