require 'spec_helper'

describe ZendeskEngine::Configuration do
  before do
    ZendeskEngine.reset
  end

  ZendeskEngine::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        expect(ZendeskEngine.send(key)).to eq ZendeskEngine::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end

  describe '.configure' do
    ZendeskEngine::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        ZendeskEngine.configure do |config|
          config.send("#{key}=", key)
          expect(ZendeskEngine.send(key)).to eq key
        end
      end
    end
  end
end
