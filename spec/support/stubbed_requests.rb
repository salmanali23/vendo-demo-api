require "spec_helper.rb"

module StubbedRequests
  def headers
    {
      'Content-Type'=>'application/json',
      'User-Agent'=>'Ruby'
    }
  end

  def retrieve_cart_stub
    stub_request(:get, "https://demo.getvendo.com/api/v2/storefront/cart").
      with(
        body: "{}",
        headers: {
        'Content-Type'=>'application/vnd.api+json',
        'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: fixture("empty_cart.json") , headers: {})
  end

  def coupon_stub
    body = {
      coupon_code: "DISCOUNT10"
    }
    stub_request(:patch, "https://demo.getvendo.com/api/v2/storefront/cart/apply_coupon_code").
      with(
        body: body.to_json,
        headers: headers).
      to_return(status: 200, body: fixture("populated_cart.json"), headers: {})
  end

  def create_line_item_stub
    body = {
      variant_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6",
      quantity: 5
    }
    stub_request(:post, "https://demo.getvendo.com/api/v2/storefront/cart/add_item").
      with(
        body: body.to_json,
        headers: headers).
      to_return(status: 200, body: fixture("populated_cart.json"), headers: {})
  end

  def remove_cart_item_stub
    stub_request(:delete, "https://demo.getvendo.com/api/v2/storefront/cart/remove_line_item/980a80d-5-f51b-4065-b3a0-622fc5cb6bf6").
      with(
        body: "{}",
        headers: headers).
      to_return(status: 200, body: fixture("empty_cart.json"), headers: {})
  end

  def line_item_qty_stub
    body = {
      line_item_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6",
      quantity: 5
    }
    stub_request(:patch, "https://demo.getvendo.com/api/v2/storefront/cart/set_quantity").
      with(
        body: body.to_json,
        headers: headers).
      to_return(status: 200, body: fixture("populated_cart.json"), headers: {})
  end
end

