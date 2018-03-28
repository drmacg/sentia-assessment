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
securityGroupIngress = {
  :CidrIp => "0.0.0.0/0",
  :FromPort => "22",
  :IpProtocol => "tcp",
  :ToPort => "22"
}
props = {
  :GroupDescription => "Enable SSH access via port 22",
  :SecurityGroupIngress => [securityGroupIngress]
}
instancesecuritygroup = {
  :Properties => props,
  :Type => "AWS::EC2::SecurityGroup"
}
resources = {
  :EC2Instance => ec2instance,
  :InstanceSecurityGroup => instancesecuritygroup
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
