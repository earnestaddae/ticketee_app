require 'rails_helper'

RSpec.describe "/admin", type: :request do

  describe "GET /" do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:user, :admin) }

    context "when signed in as a user" do
      before do
        login_as(user)
      end

      it "redirects away" do
        get "/admin"

        # expect(response).to redirect_to(root_path)
        expect(response).to have_http_status(302)
        # message = "You must be an admin to do that."
        # expect(flash[:alert]).to eq message
      end
    end

    context "when signed in as an admin" do
      before do
        login_as(admin)
      end

      it "lets the admin in" do
        get "/admin"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
