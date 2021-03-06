require "rails_helper"

RSpec.describe SnapApplicationAttributes do
  describe "#to_h" do
    it "returns a hash of attributes" do
      mailing_address = create(:mailing_address)
      residential_address = create(:address)
      snap_application = create(
        :snap_application,
        :with_member,
        addresses: [mailing_address, residential_address],
        financial_accounts: [:four_oh_one_k],
        rent_expense: 100,
      )

      data =
        SnapApplicationAttributes.new(snap_application: snap_application).to_h

      expect(data).to eq(
        applying_for_food_assistance: "Yes",
        birth_day: "18",
        birth_month: "08",
        birth_year: "1990",
        email: "test@example.com",
        mailing_address_city: "Flint",
        mailing_address_county: "Genesee",
        mailing_address_state: "MI",
        mailing_address_street_address: "123 Main St.",
        mailing_address_zip: "12345",
        members_buy_food_with_no: "Yes",
        members_buy_food_with_yes: nil,
        members_not_buy_food_with: "",
        phone_number: nil,
        residential_address_city: nil,
        residential_address_county: nil,
        residential_address_state: nil,
        residential_address_street_address: nil,
        residential_address_zip: "12345",
        signature: "Mr. RJD2",
        signature_date: snap_application.signed_at.to_s,
        monthly_rent_taxes_and_insurance: 100,
        more_than_two_employed_yes: nil,
        more_than_two_employed_no: "Yes",
        more_than_two_self_employed_yes: nil,
        more_than_two_self_employed_no: "Yes",
        mortgage_expense: nil,
        mortgage_expense_yes: nil,
        total_money: snap_application.total_money,
        monthly_gross_income: snap_application.monthly_gross_income,
        financial_accounts_checking_or_savings_account: false,
        financial_accounts_life_insurance: false,
        financial_accounts_other: false,
        financial_accounts_mutual_funds_or_stocks: false,
        financial_accounts_four_oh_one_k_or_iras: true,
        financial_accounts_trusts: false,
        first_member_with_disability_name: nil,
        homeless: nil,
        income_change_explanation: nil,
        income_change_no: "Yes",
        income_change_yes: nil,
        members_with_disability_no: "Yes",
        first_member_with_disability_name: nil,
        second_member_with_disability_name: nil,
        third_member_with_disability_name: nil,
        vehicle_income_yes: nil,
        vehicle_income_no: "Yes",
        self_employed_household_members_yes: nil,
        self_employed_household_members_no: "Yes",
        employed_household_members_yes: nil,
        employed_household_members_no: "Yes",
        additional_income_yes: nil,
        additional_income_no: "Yes",
        additional_income_social_security: nil,
        additional_income_pension: nil,
        additional_income_unemployment: nil,
        additional_income_ssi: nil,
        additional_income_workers_compensation: nil,
        additional_income_child_support: nil,
        additional_income_other: nil,
        court_ordered_expenses_child_support: nil,
        court_ordered_expenses_alimony: nil,
        court_ordered_expenses_yes: nil,
        court_ordered_expenses_no: "Yes",
        monthly_court_ordered_expenses: nil,
        medical_expenses_yes: nil,
        medical_expenses_no: "Yes",
        medical_expenses_health_insurance: nil,
        medical_expenses_prescriptions: nil,
        medical_expenses_dental: nil,
        medical_expenses_transportation: nil,
        medical_expenses_hospital_bills: nil,
        medical_expenses_other: nil,
        monthly_medical_expenses: nil,
        dependent_care_yes: nil,
        dependent_care_no: "Yes",
        care_expenses_childcare: nil,
        care_expenses_disabled: nil,
        monthly_additional_income: nil,
        monthly_care_expenses: nil,
        rent_expense_yes: "Yes",
        rent_expense: 100,
        property_tax_expense_yes: nil,
        annual_property_tax_expense: nil,
        annual_insurance_expense: nil,
        insurance_expense_yes: nil,
        utility_heat: nil,
        utility_heat_no: "Yes",
        utility_cooling: nil,
        utility_cooling_no: "Yes",
        utility_electricity: nil,
        utility_water_sewer: nil,
        utility_trash: nil,
        utility_phone: nil,
        utility_other: nil,
      )
    end
  end
end
