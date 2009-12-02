require 'helper'
include ActionView::Helpers::PrototypeHelper

class PrototypeHelperBaseTest < ActionView::TestCase
  attr_accessor :formats, :output_buffer

  def reset_formats(format)
    @format = format
  end

  def setup
    super
    @template = self
    @controller = Class.new do
      def url_for(options)
        if options.is_a?(String)
          options
        else
          url =  "http://www.example.com/"
          url << options[:action].to_s if options and options[:action]
          url << "?a=#{options[:a]}" if options && options[:a]
          url << "&b=#{options[:b]}" if options && options[:a] && options[:b]
          url
        end
      end
    end.new
  end

  protected
    def request_forgery_protection_token
      nil
    end

    def protect_against_forgery?
      false
    end

    def create_generator
      block = Proc.new { |*args| yield *args if block_given? }
      JavaScriptGenerator.new self, &block
    end
end


class TestJqueryGoogleAnalytics < PrototypeHelperBaseTest
  
  context "Google Analytics Helper methods" do
    
    def setup
      super
    end
      
    context "blah" do
      
      setup do
        GoogleAnalytics::Proxy.variable_name = 'pageTracker'
        @generator = create_generator
      end
      
      should "generate track preview" do
        assert_equal @generator.track_page_view("/some_path"), "pageTracker._trackPageview('/some_path');"
      end
      
      should "generate track event" do
        assert_equal @generator.track_event("category","event"), "pageTracker._trackEvent('category','event');"
      end
    end
    
  end

end

