require 'json'
require 'argv'
require_relative '../functions'

describe 'createTemplate' do
  context 'given default params' do
    it 'creates a template using provided params' do
      file = File.read('output1.json')
      expected = JSON.parse(file)

      actual = createTemplate('t2.micro', '0.0.0.0/0', '')

      expect(actual.to_json).to eql(expected.to_json)
    end
  end
  context 'given custom params' do
    it 'creates a template using provided params' do
      file = File.read('output2.json')
      expected = JSON.parse(file)

      actual = createTemplate('t2.small', '37.17.210.74/32', '2')

      expect(actual.to_json).to eql(expected.to_json)
    end
  end
end

describe 'assignment' do
  context 'no arguments' do
    it 'creates a template with default values' do
      file = File.read('output1.json')
      expected = JSON.parse(file)

      instances, instanceType, ipAddress = parseArguments
      actual = createTemplate(instanceType, ipAddress, instances)

      expect(actual.to_json).to eql(expected.to_json)
    end
  end
end
