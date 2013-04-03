require "bootstrap-helper/builders/tabs"
module BootstrapHelper
  module Helpers
    module Tabs
      def tabs(options = {}, &proc)
        ::BootstrapHelper::Builders::Tabs.new(self,options,&proc)
      end
    end
  end
end