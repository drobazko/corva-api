require 'sinatra'

class App < Sinatra::Application
  require_relative '../app/helpers/_init'

  post '/compute/:request_id' do
    content_type :json

    input = request.body.read
    status 400 and return unless is_correct_input?(input)

    input_json = JSON.parse(input)
    status 400 and return unless is_correct_json?(input_json)

    body({
      request_id: params['request_id'].to_i,
      timestamp: input_json['timestamp'],
      result: { title: 'Result', values: compute(input_json) }
    }).to_json
  end
end