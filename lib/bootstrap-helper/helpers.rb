module BootstrapHelper
  module Helpers
    autoload :Navbar,     'bootstrap-helper/helpers/navbar'
    autoload :Tabs,     'bootstrap-helper/helpers/tabs'
    autoload :Modal,     'bootstrap-helper/helpers/modal'
    autoload :Link,     'bootstrap-helper/helpers/link'
    autoload :Table,     'bootstrap-helper/helpers/table'
    autoload :Buttons,     'bootstrap-helper/helpers/buttons'
    autoload :Alert,      'bootstrap-helper/helpers/alert'
    include Navbar
    include Tabs
    include Table
    include Modal
    include Link
    include Buttons
    include Alert
  end
end