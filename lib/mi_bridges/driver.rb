# frozen_string_literal: true

require "capybara/rails"
require "capybara/drivers/chrome"
require "capybara/drivers/headless_chrome"

module MiBridges
  class Driver
    def initialize(snap_application:)
      @snap_application = snap_application
    end

    def run
      setup

      home_page = HomePage.new
      home_page.visit_page
      home_page.submit

      create_account_page = CreateAccountPage.new(snap_application)
      create_account_page.fill_in_required_fields
      create_account_page.next

      CreateAccountConfirmationPage.new.submit

      user_id = create_account_page.user_id
      password = create_account_page.password
      log_in_page = LogInPage.new(user_id, password)
      log_in_page.fill_in_required_fields
      log_in_page.submit

      privacy_pin_page = PrivacyPinPage.new
      privacy_pin_page.fill_in_required_fields
      privacy_pin_page.next

      BenefitsOverviewPage.new.next

      FraudPenaltyAffidavit.new.next

      start_page = Start.new
      start_page.fill_in_required_fields
      start_page.next

      benefits_selector = BenefitsSelector.new
      benefits_selector.fill_in_required_fields
      benefits_selector.next
      benefits_selector.next

      teardown
    end

    private

    attr_reader :snap_application

    def setup
      Capybara.default_driver = ENV.fetch("WEB_DRIVER", "chrome").to_sym
    end

    def teardown
      MiBridges::Driver::BasePage.new.close
    end
  end
end
