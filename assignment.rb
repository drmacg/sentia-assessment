require 'json'

test = {
  :AWSTemplateFormatVersion => "2010-09-09"
}

puts JSON.pretty_generate(test)
