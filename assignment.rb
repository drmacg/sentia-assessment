require 'json'
require 'argv'
require_relative 'functions'

arguments = ARGV.to_hash

instances = arguments['instances']
instanceType = arguments['instance-type']
ipAddress = arguments['allow-ssh-from']

instanceType = 't2.micro' if instanceType.nil?

ipAddress = if ipAddress.nil?
              '0.0.0.0/0'
            else
              ipAddress + '/32'
            end

template = createTemplate(instanceType, ipAddress, instances)

puts JSON.pretty_generate(template)
