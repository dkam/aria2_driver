require 'spec_helper'

module Aria2Driver
  module JsonRpc
    describe Request do

      let :method do
        'aria2.getVersion'
      end

      subject do
        Aria2Driver::JsonRpc::Request.new method
      end

      it 'should create a new request' do
        expect(subject).not_to be_nil
        expect(subject.path).to eq(Aria2Driver::JsonRpc::Request::DEFAULT_PATH)
        expect(subject.to_hash).to eq({
                                          jsonrpc: '2.0',
                                          method: method,
                                          params: []
                                      })
      end
    end
  end


end
