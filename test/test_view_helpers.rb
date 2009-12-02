require File.dirname(__FILE__) + '/helper.rb'
include GoogleAnalytics::Proxy::ViewHelpers
 
class ViewHelpersTest < Test::Unit::TestCase
  
  context "GoogleAnalyticsProxy" do
    
    should "embed the analytics proxy js" do
      assert_equal google_analytics_proxy, '<script type="text/javascript" src="/javascripts/google_analytics_proxy.js"></script>'
    end
    
    context "with a default variable name" do
      
      setup do
        # set to nil so it uses the default variable name
        GoogleAnalytics::Proxy.variable_name = nil
      end
      
      should "generate embed code properly" do
        assert_equal google_analytics_proxy_setup, '<script type="text/javascript">
          var _gap = new GoogleAnalyticsProxy();
        </script>
'
      end
    end
      
    context "with a custom variable name" do
      
      setup do
        GoogleAnalytics::Proxy.variable_name = 'pageTracker'
      end
      
      should "generate embed code properly" do
        assert_equal google_analytics_proxy_setup, '<script type="text/javascript">
          var pageTracker = new GoogleAnalyticsProxy();
        </script>
'
      end
    end
    
  end
  
end