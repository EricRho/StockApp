namespace :db do
  desc "Import stocks to database"
  task import_stocks: :environment do
    Derivative.delete_all
    response = HTTParty.get('http://query.yahooapis.com/v1/public/yql?q=select%20%2A%20from%20yahoo.finance.industry%20where%20id%20in%20(select%20industry.id%20from%20yahoo.finance.sectors)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys')
    response['query']['results']['industry'].each do |industry|
      if industry.has_key? ('company') && industry['company'].is_a?(Array)
        industry['company'].each do |company|
          Derivative.create!(name: company['name'], symbol: company['symbol'])
        end
      end
    end
  end
end
