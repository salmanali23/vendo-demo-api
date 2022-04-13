# frozen_string_literal: true

module VendoApiClient
  # Custom error class for rescuing from all VendoApiClient errors
  class Error < StandardError
    # @return [Integer]
    attr_reader :code

    # Raised when VendoApiClient returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when VendoApiClient returns the HTTP status code 400
    BadRequest = Class.new(ClientError)

    # Raised when VendoApiClient returns the HTTP status code 401
    Unauthorized = Class.new(ClientError)

    # Raised when VendoApiClient returns the HTTP status code 403
    Forbidden = Class.new(ClientError)

    # Raised when VendoApiClient returns the HTTP status code 404
    NotFound = Class.new(ClientError)

    # Raised when VendoApiClient returns the HTTP status code 422
    UnprocessableEntity = Class.new(ClientError)

    # Raised when VendoApiClient returns a 5xx HTTP status code
    ServerError = Class.new(self)

    # Raised when VendoApiClient returns the HTTP status code 503
    ServiceUnavailable = Class.new(ServerError)

    # Raised when VendoApiClient returns the HTTP status code 504
    GatewayTimeout = Class.new(ServerError)

    # Raised when an operation subject to timeout takes too long
    TimeoutError = Class.new(self)

    ERRORS = {
      400 => VendoApiClient::Error::BadRequest,
      401 => VendoApiClient::Error::Unauthorized,
      403 => VendoApiClient::Error::Forbidden,
      404 => VendoApiClient::Error::NotFound,
      422 => VendoApiClient::Error::UnprocessableEntity,
      503 => VendoApiClient::Error::ServiceUnavailable,
      504 => VendoApiClient::Error::GatewayTimeout
    }.freeze


    class << self
      # Create a new error from an HTTP response
      #
      # @return [VendoApiClient::Error]
      def from_response(body, headers)
        message, code = parse_error(body)
        new(message, headers, code)
      end

      # Create a new error from a media error hash
      #
      # @return [VendoApiClient::MediaError]
      def from_processing_response(error, headers)
        message = error[:message]
        code = error[:code]
        new(message, headers, code)
      end

      private

      def parse_error(body)
        if body.nil? || body.empty?
          ["", nil]
        elsif body[:error]
          [body[:error], nil]
        elsif body[:errors]
          extract_message_from_errors(body)
        end
      end

      def extract_message_from_errors(body)
        first = Array(body[:errors]).first
        if first.is_a?(Hash)
          [first[:message].chomp, first[:code]]
        else
          [first.chomp, nil]
        end
      end
    end

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param rate_limit [Hash]
    # @param code [Integer]
    # @return [VendoApiClient::Error]
    def initialize(message = "", _headers = {}, code = nil)
      super(message)
      @code = code
    end
  end
end
