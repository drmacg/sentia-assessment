require 'json'


properties = {
  :ImageId => "ami-b97a12ce",
  :InstanceType => "t2.micro",
  :SecurityGroups => [:Ref => "InstanceSecurityGroup"]
}
ec2instance = {
  :Properties => properties,
  :Type => "AWS::EC2::Instance"
}
resources = {
  :EC2Instance => ec2instance,
  # :InstanceSecurityGroup = > instancesecuritygroup
}

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
  :Outputs => output,
  :Resources => resources

}


puts JSON.pretty_generate(template)
