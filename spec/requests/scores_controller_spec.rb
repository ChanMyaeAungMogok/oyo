require 'rails_helper'

RSpec.describe "ScoresControllers", type: :request do
  describe "GET /index" do
    it "returns a 200" do
      request.headers["Authorization"] = "foo"
      get :show
      expect(response).to have_http_status(:ok)
    end
  end
end
