require 'json'
require 'argv'
require_relative 'functions'

instances, instanceType, ipAddress = parseArguments()

template = createTemplate(instanceType, ipAddress, instances)

puts JSON.pretty_generate(template)
