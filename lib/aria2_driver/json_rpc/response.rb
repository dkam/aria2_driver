# frozen_string_literal: true

require 'aria2_driver/json_rpc/error'

module Aria2Driver
  module JsonRpc
    class Response
      attr_accessor :result
      attr_reader :jsonrpc, :id, :error

      def initialize(response_hash)
        @jsonrpc = response_hash['jsonrpc']
        @id = response_hash['id']
        detect_payload(response_hash)
      end

      def error?
        error != nil
      end

      private

      def error=(error_payload)
        @error = Aria2Driver::JsonRpc::Error.new(error_payload)
      end

      def detect_payload(response_hash)
        if response_hash['error']
          self.error = response_hash['error']
        else
          self.result = response_hash['result']
        end
      end
    end
  end
end
