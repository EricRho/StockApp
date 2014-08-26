# Stock.delete_all

# Stock.create!(symbol: 'MNKD', name: 'Mannkind Corporat')
# Stock.create!(symbol: 'ARRY', name: 'Array BioPharma Inc.')
# Stock.create!(symbol: 'SNY', name: 'Sanofi')
# Stock.create!(symbol: 'LLY', name: 'Eli Lilly and Company')
# Stock.create!(symbol: 'MRK', name: 'Merck & Co. Inc.')
# Stock.create!(symbol: 'AMZN', name: 'Amazon.com Inc.')
# Stock.create!(symbol: 'CG', name: 'The Carlyle Group LP')


Derivative.delete_all
response = HTTParty.get('http://query.yahooapis.com/v1/public/yql?q=select%20%2A%20from%20yahoo.finance.industry%20where%20id%20in%20(select%20industry.id%20from%20yahoo.finance.sectors)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys')
response['query']['results']['industry'].each do |industry|
  if industry.has_key?('company') && industry['company'].is_a?(Array)
    industry['company'].each do |company|
      Derivative.create!(name: company['name'], symbol: company['symbol'])
    end
  end
end

# Derivative.delete_all
# response = HTTParty.get('http://query.yahooapis.com/v1/public/yql?q=select%20%2A%20from%20yahoo.finance.industry%20where%20id%20in%20(select%20industry.id%20from%20yahoo.finance.sectors)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys')
# response['query']['results']['industry'].each do |industry|
#   if industry.has_key? ('company') && industry['company'].is_a?(Array)
#     industry['company'].each do |company|
#       Derivative.create!(name: company['name'], symbol: company['symbol'])
#     end
#   end
# end

