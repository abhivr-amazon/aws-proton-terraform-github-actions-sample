/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:101381735630:component/component-10

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31
Description: This environment holds a simple DDB table shared between services.
Resources:
  BasicEnvParameter:
    Type: AWS::SSM::Parameter
    Properties:
      Name: test-ssm-env-param
      Type: String
      Value: "{{environment.outputs.TableName}}"
Outputs:
  ParameterValue:
    Value: !GetAtt BasicEnvParameter.Value