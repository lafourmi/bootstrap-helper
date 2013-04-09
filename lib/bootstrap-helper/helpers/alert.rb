require "bootstrap-helper/builders/alert"
module BootstrapHelper
  module Helpers
    module Alert
      def bt_alert(options = {}, &proc)
        ::BootstrapHelper::Builders::Alert.new(self,options,&proc)
      end
      def bt_alert_success(options = {}, &proc)
        bt_alert(options.merge(type: 'success'), &proc)
      end
      def bt_alert_error(options = {}, &proc)
        bt_alert(options.merge(type: 'error'), &proc)
      end
      def bt_alert_warning(options = {}, &proc)
        bt_alert(options.merge(type: 'block'), &proc)
      end
      def bt_alert_info(options = {}, &proc)
        bt_alert(options.merge(type: 'info'), &proc)
      end
    end
  end
end