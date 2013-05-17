module BootstrapHelper
  module Builders
    class Navbar
      attr_accessor :template, :name, :items

      def initialize(template, options = {}, &proc)
        @template, @items = template,  []
        render(options, &proc)
      end

      def render(options, &proc)
        buffer = template.capture(self, &proc)
        template.concat(wrapper(options, buffer))
      end

      def wrapper(options, buffer)
        navbar_class = ['navbar']
        navbar_class << 'navbar-fixed-top' if options[:top]
        navbar_class << 'navbar-fixed-bottom' if options[:bottom]
        navbar_class << 'navbar-inverse' if options[:inverse]
        id = options[:id] || ''
        
        template.content_tag(:div, class: navbar_class, 'data-dropdown' => 'dropdown', :id => id) do
          template.content_tag(:div, buffer, class: 'navbar-inner')
        end
      end

      def brand_name(name, link = '#', options = {})
        template.link_to name, link, class: 'brand'
      end
      
      def nav(options = {}, &block)
        buffer = template.capture(self, &proc)
        klass = ['nav']
        klass << 'pull-right' if options[:right]
        klass << 'pull-left' if options[:left]
        klass_ul = ['nav']
        klass_ul << options[:class] || ''
        
        template.content_tag( :nav, class: klass ) do
          template.content_tag( :ul, buffer, class: klass_ul)
        end
      end

      def second_nav(options = {}, &block)
        ActiveSupport::Deprecation.warn("use nav instead of second_nav")
        nav(options.merge(:right => true), &block)
      end
      
      def dropdown(*args, &proc)
        if args.first.class == Hash
          options = args.first
        else
          title = args.first
          options = args.second || {}
        end
        
        body = template.capture(self, &proc)
        klass = ['dropdown']
        klass << options[:class] unless options[:class].nil?
        
        unless title.nil?
          body = dropdown_title(title, options, &proc)
          body << dropdown_menu(options, &proc)
        end
        
        template.content_tag(:li, body, class: klass)
      end
      
      def dropdown_title(title = nil, options = {}, &block)
        body = title.nil? ? template.capture(self, &proc) : title.html_safe
        body << template.content_tag(:b, nil, class: 'caret')
        
        template.link_to(body, '#', class: 'dropdown-toggle', 'data-toggle' => 'dropdown')
      end
      
      def dropdown_menu(options = {}, &block)
        buffer = template.capture(self, &proc)
        klass = ['dropdown-menu']
        klass << 'pull-right' if options[:right]

        template.content_tag(:ul, buffer, class: klass)
      end

      def item(*args, &block)
        if block_given?
          body = template.capture(self, &proc)
          url = args.first || '#'
          options = args.second || {}
        else
          body = args[0]
          url = args[1] || '#'
          options = args[2] || {}
        end
        
        klass = options[:class] || []
        klass << 'active' if options[:active]
        data_toggle = options[:url_data_toggle] || ''
        
        template.content_tag(:li, class: klass) do
          template.link_to(body, url, 'data-toggle' => data_toggle)
        end
      end

      def collapse
        template.content_tag(:button, nil, :class => 'btn btn-navbar collapsed', "data-toggle" => 'collapse', 'data-target' => '.nav-collapse') do
          3.times.map { template.content_tag :span, nil, class: 'icon-bar' }.inject(:+)
        end
      end
      
      def divider(options = {})
        klass = "divider#{options[:vertical] ? '-vertical' : ''}"
        template.content_tag :li, nil, class: klass
      end
      
      def header(title = nil, &block)
        body = title.nil? ? template.capture(self, &proc) : title
        template.content_tag :li, body, class: 'nav-header'
      end
      
    end
  end
end