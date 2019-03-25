require "json-schema"

module ApiHelper
  SCHEMA = {
    type: 'object',
    required: ['timestamp', 'data'],
    properties: {
      timestamp: {
        type: 'integer',
      },
      data: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            title: {
              type: 'string'
            },
            values: {
              type: 'array',
              items: {
                type: 'number'
              }
            }
          }
        }
      }
    }
  }

  def is_correct_json?(json)
    JSON::Validator.validate(SCHEMA, json) && json['data'][0]['values'].length == json['data'][1]['values'].length 
  end

  def is_correct_input?(input)
    input && !input.empty?
  end

  def compute(json)
    part_1 = json['data'][0]['values']
    part_2 = json['data'][1]['values']
    part_1.map.with_index{ |el, i| el - part_2[i] }
  end
end