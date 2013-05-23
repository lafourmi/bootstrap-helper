module BootstrapHelper
  module Builders
    class Tabs
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
        klass = options[:class] || 'nav-collapse'

        template.content_tag( :div, class: "tabbable" ) do
          content = template.content_tag( :div, :class => 'navbar' ) do
            content_div = collapse({:class => klass})
            content_div << tabs_titles({:class => klass}) do
              content_items = ''.html_safe
              items.each do |item|
                content_items << item_title( item[:name], item[:id], item[:klass] )
              end
              content_items
            end
          end
          
          content << template.content_tag( :div, class: "tab-content" ) do
            buffer
          end
        end
      end

      def collapse(options = {})
        template.content_tag(:button, nil, :class => 'btn btn-navbar', "data-toggle" => 'collapse', 'data-target' => ".#{options[:class]}", :type => 'button') do
          3.times.map { template.content_tag :span, nil, class: 'icon-bar' }.inject(:+)
        end
      end

      def tabs_titles(options = {}, &block)
        buffer = template.capture( self, &proc )
        template.content_tag( :ul, buffer, class: "nav nav-tabs #{options[:class]} collapse" )
      end
      
      def item_title(name, id, klass)
        template.content_tag( :li, nil, class: klass ) do
          template.link_to name, "##{id}", :data => { :toggle => 'tab' }
        end
      end
      
      def item(name, options = {}, &block)
        klass = options[:active] ? "active" : ""
        id = name.downcase.parameterize.gsub(/-/, '_')
        
        items << { :name => name, :id => id, :klass => klass }
        
        buffer = template.capture( self, &proc )
        template.content_tag( :div, buffer, class: "tab-pane #{klass}", :id => id )
      end
      
    end
  end
end