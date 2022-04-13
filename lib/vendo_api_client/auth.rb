# frozen_string_literal: true

require "vendo_api_client/utils"

module VendoApiClient
  module Auth
    include VendoApiClient::Utils

    def authenticate(username = "vendo@example.com", password = "vendo123")
      response = post(AUTH_URL, {
                                body: {
                                  "grant_type": "password",
                                  "username": username,
                                  "password": password
                                }
                              })
      @bearer_token = "Bearer #{response[:access_token]}"
      @refresh_token = response[:refresh_token]
      bearer_token?
    end
  end
end
