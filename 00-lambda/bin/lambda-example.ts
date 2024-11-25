#!/usr/bin/env node
import * as cdk from "aws-cdk-lib";
import { LambdaExampleStack } from "../lib/lambda-example-stack";

const app = new cdk.App();

const regions = ["us-east-1", "eu-west-1", "ap-southeast-1"];

regions.forEach((region) => {
  new LambdaExampleStack(app, `LambdaExample-${region}`, {
    env: {
      region,
    },
  });
});
