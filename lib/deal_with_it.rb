require 'deal_with_it/version'
require 'deal_with_it/handler'

module DealWithIt
  def self.included(klass)
    Rails.application.eager_load! if defined?(Rails) && !Rails.env.production?

    klass.class_eval do
      DealWithIt::Handler.descendants.each do |rescuer|
        rescuer_instance = rescuer.instance_variable_get(:@handler)

        rescue_from rescuer_instance.exception, with: rescuer_instance.callback
      end
    end
  end
end
