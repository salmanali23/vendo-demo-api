
require "spec_helper"
require "vendo_api_client"

describe VendoApiClient::Client do
  before do
    @client = VendoApiClient::Client.new
  end

  context "#auhenticate" do
    it "authenticates a user" do
      auth = VCR.use_cassette("auth/bearer") { @client.authenticate }
      expect(auth).to eq(true)
      expect(@client.bearer_token).to include("Bearer")
    end
  end
end
