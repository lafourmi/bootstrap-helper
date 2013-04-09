module BootstrapHelper
  module Builders
    class Alert
      attr_accessor :template, :items

      def initialize(template, options = {}, &proc)
        @template, @items = template,  []
        render(options, &proc)
      end

      def render(options, &proc)
        buffer = template.capture(self, &proc)
        template.concat(wrapper(options,buffer))
      end

      def wrapper(options, buffer)
        klass = options[:type].nil? ? ['alert'] : ["alert alert-#{options[:type]}"]
        klass << options[:klass] || ''
        
        template.content_tag(:div, class: klass) do
          template.content_tag(:button, template.raw('&times;'), :type => 'button', class: 'close', 'data-dismiss' => 'alert') + buffer
        end
      end
      
    end
  end
end