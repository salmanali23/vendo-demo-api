require "spec_helper"
require "vendo_api_client"

describe VendoApiClient::Client do
  include StubbedRequests

  before do
    @client = VendoApiClient::Client.new
    coupon_stub
  end

  context "#coupon code" do
    it "adds coupon code to a line item" do
      coupon = @client.apply_coupon_code(coupon_code: "DISCOUNT10")
      expect(coupon).to eq(fixture("populated_cart.json"))
    end
  end
end
