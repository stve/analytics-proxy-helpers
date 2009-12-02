module GoogleAnalytics #:nodoc:
  module Proxy
    
    class << self
      # Returns the javascript variable name to be used for the analytics proxy.
      #
      #
      # Default:
      #
      #  _gap
      #
      def variable_name
        @@variable_name ||= '_gap'
      end
    
      # Sets the javascript variable name to be used for the analytics proxy.
      #
      #
      # Examples:
      #
      #  variable_name('_analytics_proxy')
      #
      def variable_name=(variable_name)
        @@variable_name = variable_name
      end
    end
    
  end
end