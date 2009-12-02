module ActionView #:nodoc:
  module Helpers #:nodoc:
    module PrototypeHelper #:nodoc:
      class JavaScriptGenerator #:nodoc:
        module GeneratorMethods
          # Calls the Google Analytics _trackPageview function with +path+.
          #
          # Examples:
          #
          #
          #  # Triggers: _trackPageview('/contact_requests/thanks');
          #  page.track_page_view '/contact_requests/thanks'
          #
          def track_page_view(path)
            record "#{GoogleAnalytics::Proxy.variable_name}._trackPageview('#{path}');"
          end

          # Calls the Google Analytics _trackEvent function with +path+.
          #
          # Examples:
          #
          #
          #  # Triggers: _trackEvent('category','action');
          #  page.track_event 'category', 'action'
          #
          def track_event(category, action, optional_label = nil, optional_value = nil)
            page_command = "#{GoogleAnalytics::Proxy.variable_name}._trackEvent('#{category}','#{action}'"
            page_command << ", '#{optional_label}'" unless optional_label.blank?
            page_command << ", '#{optional_value}'" unless optional_label.blank? || optional_value.blank?
            page_command << ")"
            record page_command
          end
          
        end
      end
    end
  end
end