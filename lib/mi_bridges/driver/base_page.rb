# frozen_string_literal: true

module MiBridges
  class Driver
    class BasePage
      include Capybara::DSL

      def initialize(snap_application = nil)
        @snap_application = snap_application
      end

      def close
        page.driver.browser.close
      end

      def click_id(id)
        id = "##{id}" unless id.include?("#")
        page.execute_script("$('#{id}').click()")
      end

      def next
        click_on "Next"
      end

      private

      attr_reader :snap_application
    end
  end
end
