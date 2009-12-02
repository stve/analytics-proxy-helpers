module GoogleAnalytics
  module Proxy
    module ViewHelpers
      
      def google_analytics_proxy
        "<script type=\"text/javascript\" src=\"#{LocalAssetTagHelper.new.javascript_path( 'google_analytics_proxy.js' )}\"></script>"
      end
      
      def google_analytics_proxy_setup
        code = <<-HTML
<script type="text/javascript">
          var #{GoogleAnalytics::Proxy.variable_name} = new GoogleAnalyticsProxy();
        </script>
HTML
      end
      
      class LocalAssetTagHelper # :nodoc:
        # For helping with local javascripts
        include ActionView::Helpers::AssetTagHelper
      end
      
    end
  end
end