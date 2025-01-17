# frozen_string_literal: true

module Aria2Driver
  module JsonRpc
    class Connection

      DEFAULTS = {
        scheme: 'http',
        port: 80
      }.freeze

      attr_reader :scheme, :port, :host, :secure

      def initialize(host, options = {})
        @host = host
        check_defaults(options)
      end

      private

      def check_defaults(options)
        @scheme = options.fetch(:scheme, DEFAULTS[:scheme])
        @port = options.fetch(:port, DEFAULTS[:port])
        @secure = options.fetch(:secure, port == ::Net::HTTP.https_default_port)
      end
    end
  end
end
