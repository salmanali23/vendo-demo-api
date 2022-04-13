require "spec_helper"
require "vendo_api_client"

describe VendoApiClient::Client do
  include StubbedRequests

  before do
    @client = VendoApiClient::Client.new
  end

  describe "#line items" do
    before do
      create_line_item_stub
      line_item_qty_stub
      remove_cart_item_stub
    end
    context "line item" do
      it "creates a new line item" do
        line_item = @client.add_line_item(variant_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6", quantity:5)
        expect(line_item).to eq(fixture("populated_cart.json"))
      end

      it "sets a line item quantity" do
        line_item = @client.set_quantity(line_item_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6", quantity:5)
        expect(line_item).to eq(fixture("populated_cart.json"))
      end

      it "removes a line item" do
        line_item = @client.remove_line_item(line_item_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6")
        expect(line_item).to eq(fixture("empty_cart.json"))
      end
    end
  end
end

