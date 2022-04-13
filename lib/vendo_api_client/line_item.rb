# frozen_string_literal: true

require "vendo_api_client/utils"

module VendoApiClient
  module LineItem
    include VendoApiClient::Utils

    def add_line_item(variant_id:, quantity:)
      headers = accept_content_headers.merge({ "X-Vendo-Order-Token": current_cart })
      options = { body: { variant_id: variant_id, quantity: quantity } }
      post("#{CART_URL}/add_item", options, headers)
    end

    def remove_line_item(line_item_id:)
      headers = accept_content_headers.merge({ "X-Vendo-Order-Token": current_cart })
      delete("#{CART_URL}/remove_line_item/#{line_item_id}", {}, headers)
    end

    def set_quantity(line_item_id:, quantity:)
      headers = accept_content_headers.merge({ "X-Vendo-Order-Token": current_cart })
      options = { body: { line_item_id: line_item_id, quantity: quantity } }
      patch("#{CART_URL}/set_quantity", options, headers)
    end
  end
end


