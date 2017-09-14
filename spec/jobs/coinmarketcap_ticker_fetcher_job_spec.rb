require_relative '../../src/jobs/coinmarketcap_ticker_fetcher_job'

RSpec.describe CoinmarketcapTickerFetcherJob do
  describe '.perform' do
    let(:currency) { 'CAD' }
    let(:limit) { 50 }
    let(:expected_params) { { convert: currency, limit: limit } }
    let(:mock_response) { double(body: '[]') }
    subject { described_class.new }

    before do
      expect_any_instance_of(RestClient::Resource)
        .to receive(:get)
        .with(params: hash_including(expected_params))
        .and_return(mock_response)
    end
    it 'calls the rest client' do
      subject.perform(currency: currency, limit: limit)
    end
  end
end
