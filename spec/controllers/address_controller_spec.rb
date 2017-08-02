# frozen_string_literal: true

require "rails_helper"

RSpec.describe AddressController, type: :controller do
  let(:step) { assigns(:step) }
  before do
    session[:snap_application_id] = current_app.id
  end

  describe "#edit" do
    it "assigns the correct step" do
      get :edit

      expect(step).to be_an_instance_of Address
    end

    it "assigns the fields to the step" do
      get :edit

      expect(step.street_address).to eq("123 Fake St")
      expect(step.city).to eq("Springfield")
      expect(step.zip).to eq("12345")
      expect(step.state).to eq("MI")
    end
  end

  describe "#update" do
    context "when valid" do
      it "updates the app" do
        valid_params = {
          street_address: "125 E Union St",
          city: "Flint",
          state: "MI",
          zip: "48502",
        }

        put :update, params: { step: valid_params }

        current_app.reload

        valid_params.each do |key, value|
          expect(current_app[key]).to eq(value)
        end
      end

      context "when the zipcode is provided" do
        it "assigns the county name based on the zipcode" do
          valid_params = {
            street_address: "201 S Main St",
            city: "Plymouth",
            state: "MI",
            zip: "48170",
          }

          put :update, params: { step: valid_params }

          current_app.reload

          expect(step.zip).to eq valid_params.fetch(:zip)
          expect(step.county).to eq("Wayne")
        end
      end

      it "redirects to the next step" do
        valid_params = {
          street_address: "125 E Union St",
          city: "Flint",
          state: "MI",
          zip: "48502",
        }

        put :update, params: { step: valid_params }

        expect(response).to redirect_to("/steps/sign-and-submit")
      end
    end

    it "renders edit if the step is invalid" do
      put :update, params: { step: { zip: "1111111111" } }

      expect(assigns(:step)).to be_an_instance_of(Address)
      expect(response).to render_template(:edit)
    end
  end

  def current_app
    @_current_app ||= SnapApplication.create!(
      street_address: "123 Fake St",
      city: "Springfield",
      zip: "12345",
      state: "MI",
    )
  end
end
