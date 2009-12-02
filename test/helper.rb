require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_support/test_case'
require 'action_controller'
require 'action_view/test_case'
require 'shoulda'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'analytics-proxy-helpers'

class Test::Unit::TestCase
end