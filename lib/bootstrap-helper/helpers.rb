module BootstrapHelper
  module Helpers
    autoload :Navbar,     'bootstrap-helper/helpers/navbar'
    autoload :Tabs,     'bootstrap-helper/helpers/tabs'
    autoload :Modal,     'bootstrap-helper/helpers/modal'
    autoload :Link,     'bootstrap-helper/helpers/link'
    autoload :Table,     'bootstrap-helper/helpers/table'
    autoload :Buttons,     'bootstrap-helper/helpers/buttons'
    include Navbar
    include Tabs
    include Table
    include Modal
    include Link
    include Buttons
  end
end