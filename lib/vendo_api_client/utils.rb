# frozen_string_literal: true

require "vendo_api_client/request"

module VendoApiClient
  module Utils

    CART_URL = "api/v2/storefront/cart"
    AUTH_URL = "spree_oauth/token"

    def get(path, options = {}, headers = {})
      request(:get, path, options, headers)
    end

    def post(path, options = {}, _headers = {})
      request(:post, path, options)
    end

    def patch(path, options = {}, _headers = {})
      request(:patch, path, options)
    end

    def delete(path, options = {}, _headers = {})
      equest(:delete, path, options)
    end

    def request(method, path, options = {}, headers = {})
      VendoApiClient::Request.new(self, method, path, options, headers).perform
    end
  end
end
