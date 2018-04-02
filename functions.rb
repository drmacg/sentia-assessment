def createTemplate(instanceType, ipAddress, instances)
  ec2InstanceTemplate = {
    Properties: {
      ImageId: 'ami-b97a12ce',
      InstanceType: instanceType,
      SecurityGroups: [Ref: 'InstanceSecurityGroup']
    },
    Type: 'AWS::EC2::Instance'
  }

  template = {
    AWSTemplateFormatVersion: '2010-09-09',
    Outputs: {
      PublicIP: {
        Description: 'Public IP address of the newly created EC2 instance',
        Value: {
          :"Fn::GetAtt" => %w[EC2Instance PublicIp]
        }
      }
    },
    Resources: {
      EC2Instance: ec2InstanceTemplate
    }
  }

  for i in 2..instances.to_i
    template[:Resources]['EC2Instance' + i.to_s] = ec2InstanceTemplate
  end

  template[:Resources]['InstanceSecurityGroup'] = {
    Properties: {
      GroupDescription: 'Enable SSH access via port 22',
      SecurityGroupIngress: [{
        CidrIp: ipAddress,
        FromPort: '22',
        IpProtocol: 'tcp',
        ToPort: '22'
      }]
    },
    Type: 'AWS::EC2::SecurityGroup'
  }

  return template
end
