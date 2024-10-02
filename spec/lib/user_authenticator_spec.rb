require 'rails_helper'

describe UserAuthenticator do
  describe '#perform' do 
    context "when code is incorrect" do
      it 'should rise an error' do 
        authenticator = described_class.new('some_code')
        expect{ authenticator.perform }.to raise_error(
          UserAuthenticator::AuthenticationError
        )
      end
    end
  end
end
