require 'json'

value = {
  :"Fn::GetAtt" => ["EC2Instance", "PublicIp"]
}
publicIP = {
  :Description => "Public IP address of the newly created EC2 instance",
  :Value => value
}
output = {
  :PublicIP => publicIP
}
template = {
  :AWSTemplateFormatVersion => "2010-09-09",
  :Outputs => output
}


puts JSON.pretty_generate(template)
