require_relative 'spec_helper'

describe 'Corva API' do
  let(:uri) { '/compute/1' }

  # length of data.[0].values & data.[1].values are not equal
  let(:incorrect_json_1) do
    {
      timestamp: 1493758596,
      data: [
        { title: 'Part 1', values: [0, 3, 5, 6, 2, 9] },
        { title: 'Part 2', values: [6, 3, 1, 3, 9, 4, 10] }
      ]
    }.to_json
  end

  # mandatory field data doesn't exist
  let(:incorrect_json_2) do
    {
      timestamp: 1493758596
    }.to_json
  end

  # one of elements of data.[1].values has wrong type - string
  let(:incorrect_json_3) do
    {
      timestamp: 1493758596,
      data: [
        { title: 'Part 1', values: [0, 3, 5, 6, 2, 9] },
        { title: 'Part 2', values: [6, 3, 1, 3, 9, 4, 10] }
      ]
    }.to_json
  end

  let(:correct_json) do
    {
      timestamp: 1493758596,
      data: [
        { title: 'Part 1', values: [0, 3, 5, 6, 2, 9] },
        { title: 'Part 2', values: [6, 3, 1, 3, 9, 4] }
      ]
    }.to_json
  end

  let(:correct_response) do
    {
      request_id: 1,
      timestamp: 1493758596,
      result: { title: 'Result', values: [ -6, 0, 4, 3, -7, 5 ] }
    }
  end

  let(:headers) { 
    { 'content-type' => "application/json" }
  }

  it 'should return error code if request body is malformed' do
    post uri, incorrect_json_1, headers
    expect(last_response.status).to eq 400

    post uri, incorrect_json_2, headers
    expect(last_response.status).to eq 400

    post uri, incorrect_json_3, headers
    expect(last_response.status).to eq 400
  end

  it 'should return subtract result on' do
    post uri, correct_json, headers
    expect(last_response).to be_ok
    expect(last_response.body).to eq correct_response.to_json
  end
end