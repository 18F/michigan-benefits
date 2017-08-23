# frozen_string_literal: true

module MiBridges
  class Driver
    class CreateAccountConfirmationPage < BasePage
      def submit
        click_on "Click here"
      end
    end
  end
end
