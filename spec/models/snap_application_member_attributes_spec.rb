require "rails_helper"

RSpec.describe SnapApplicationMemberAttributes do
  describe "#to_h" do
    it "returns the member attributes as a hash" do
      member = create(
        :member,
        first_name: "First",
        last_name: "Last",
        sex: "female",
        birthday: DateTime.parse("20/10/1910"),
        relationship: nil,
        ssn: "222-22-2222",
        marital_status: "Divorced",
        citizen: false,
        new_mom: true,
        in_college: true,
        requesting_food_assistance: true,
      )
      position = "primary"

      result = SnapApplicationMemberAttributes.new(
        member: member,
        position: position,
      ).to_h

      expect(result).to eq(
        primary_member_birthday: "10/20/1910",
        primary_member_citizen_no: "Yes",
        primary_member_citizen_yes: nil,
        primary_member_full_name: "First Last",
        primary_member_in_college_no: nil,
        primary_member_in_college_yes: "Yes",
        primary_member_marital_status_divorced: "Yes",
        primary_member_marital_status_married: nil,
        primary_member_marital_status_never_married: nil,
        primary_member_marital_status_separated: nil,
        primary_member_marital_status_widowed: nil,
        primary_member_new_mom_no: nil,
        primary_member_new_mom_yes: "Yes",
        primary_member_relationship: nil,
        primary_member_requesting_food_assistance: "Yes",
        primary_member_sex_female: "Yes",
        primary_member_sex_male: nil,
        primary_member_ssn: "222-22-2222",
      )
    end
  end
end
