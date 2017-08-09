# frozen_string_literal: true

require "rails_helper"

RSpec.describe MailingAddressController, type: :controller do
  let(:step) { assigns(:step) }
  before { session[:snap_application_id] = current_app.id }

  describe "#edit" do
    it "assigns the correct step" do
      get :edit

      expect(step).to be_an_instance_of MailingAddress
    end

    it "assigns the fields to the step" do
      get :edit

      expect(step.street_address).to eq("123 Fake St")
      expect(step.city).to eq("Springfield")
      expect(step.zip).to eq("12345")
    end
  end

  describe "#update" do
    context "when valid" do
      it "updates the app" do
        valid_params = {
          street_address: "321 Real St",
          city: "Shelbyville",
          zip: "54321",
          mailing_address_same_as_residential_address: true,
        }

        put :update, params: { step: valid_params }

        current_app.reload

        valid_params.each do |key, value|
          expect(current_app[key]).to eq(value)
        end
      end

      it "always sets the county to 'Genesee' and state to 'MI'" do
        valid_params = {
          street_address: "321 Main St",
          city: "Plymouth",
          zip: "48170",
        }

        put :update, params: { step: valid_params }

        current_app.reload

        expect(current_app["county"]).to eq("Genesee")
        expect(current_app["state"]).to eq("MI")
      end

      it "redirects to the next step" do
        valid_params = {
          street_address: "321 Real St",
          city: "Shelbyville",
          zip: "54321",
          mailing_address_same_as_residential_address: true,
        }

        put :update, params: { step: valid_params }

        expect(response).to redirect_to("/steps/residential-address")
      end
    end

    it "renders edit if the step is invalid" do
      put :update, params: { step: { zip: "1111111111" } }

      expect(assigns(:step)).to be_an_instance_of(MailingAddress)
      expect(response).to render_template(:edit)
    end
  end

  def current_app
    @_current_app ||= FactoryGirl.create(
      :snap_application,
      street_address: "123 Fake St",
      city: "Springfield",
      zip: "12345",
    )
  end
end