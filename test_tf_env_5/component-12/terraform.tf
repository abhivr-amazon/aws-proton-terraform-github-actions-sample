/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:101381735630:component/component-12

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31
Description: This environment holds a simple DDB table shared between services.
Resources:
  DdbAccessRole:
    Type: AWS::IAM::Role
    Properties:
      AssumeRolePolicyDocument:
        Version: 2012-10-17
        Statement:
          - Effect: Allow
            Principal:
              Service:
                - cloudformation.amazonaws.com
            Action:
              - sts:AssumeRole
      Path: /
      Policies:
        - PolicyName: DdbAccessPolicy
          PolicyDocument:
            Version: 2012-10-17
            Statement:
              - Effect: Allow
                Action:
                  - "dynamodb:BatchGetItem"
                  - "dynamodb:BatchWriteItem"
                  - "dynamodb:ConditionCheckItem"
                  - "dynamodb:PutItem"
                  - "dynamodb:DescribeTable"
                  - "dynamodb:Scan"
                  - "dynamodb:Query"
                Resource:
                  'Fn::Join':
                    - ''
                    - - 'arn:aws:dynamodb:'
                      - !Ref 'AWS::Region'
                      - ':'
                      - !Ref 'AWS::AccountId'
                      - ':table/'
                      - "{{environment.outputs.TableName}}"

Outputs:
  StackRoleArn:
    Value: !GetAtt DdbAccessRole.Arn