module GoogleAnalytics
  module Proxy
  end
end

require 'analytics-proxy-helpers/google_analytics_proxy'
require 'analytics-proxy-helpers/generator_methods'
require 'analytics-proxy-helpers/view_helpers'

ActionView::Base.send :include, GoogleAnalytics::Proxy::ViewHelpers