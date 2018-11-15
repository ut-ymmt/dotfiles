#!/bin/bash

readonly AWS_ACCOUNT=$1
readonly NAME_TAG=$2
readonly INSTANCE_STATE=$3

if [ -z $AWS_ACCOUNT ]; then
  echo 'usage: show-ip [AWS_ACCOUNT_PROFILE] [INSTANCE_STATE default running]'
  exit 1
fi

if [ -z $INSTANCE_STATE ]; then
  state='running'
else
  state=$INSTANCE_STATE
fi

aws --profile $AWS_ACCOUNT ec2 describe-instances --filter "Name=tag:Name,Values=*$NAME_TAG*" \
  | jq -r ".Reservations[].Instances[] \
  | select(.State.Name==\"$state\") \
  | [.Tags[] | select(.Key == \"Name\").Value][] + \"\t\" +  .InstanceId + \"\t\" + .PrivateIpAddress + \"\t\" + .PublicIpAddress" \
  | column -t \
  | sort
