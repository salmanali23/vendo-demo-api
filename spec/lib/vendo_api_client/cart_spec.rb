require "spec_helper"
require "vendo_api_client"

describe VendoApiClient::Client do
  include StubbedRequests

  before do
    @client = VendoApiClient::Client.new
  end

  describe "#cart" do
    before do
      retrieve_cart_stub
    end
    context "#create" do
      it "creates a new cart" do
        cart = VCR.use_cassette("cart/create") { @client.create_cart }
        expect(cart[:data][:id]).not_to be(nil)
      end
    end

    context "#retrieves" do
      it "successfully retrieves a cart" do
        response = @client.retrieve_cart
        expect(response).to eq(fixture("empty_cart.json"))
      end
    end
  end
end
