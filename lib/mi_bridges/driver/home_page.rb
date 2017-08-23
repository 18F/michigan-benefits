# frozen_string_literal: true

module MiBridges
  class Driver
    class HomePage < BasePage
      def visit_page
        visit "https://www.mibridges.michigan.gov/access/"
      end

      def submit
        click_on "Create An Account"
      end
    end
  end
end
