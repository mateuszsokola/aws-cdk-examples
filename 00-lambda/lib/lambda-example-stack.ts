import * as cdk from "aws-cdk-lib";
import { Construct } from "constructs";
import * as lambda from "aws-cdk-lib/aws-lambda";
import assert = require("node:assert");

export class LambdaExampleStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);
    assert(props !== undefined);

    const handler = new lambda.Function(this, "LambdaExample", {
      runtime: lambda.Runtime.NODEJS_22_X,
      code: lambda.Code.fromAsset("api"),
      handler: "index.handler",
    });

    const fnUrl = handler.addFunctionUrl({
      authType: lambda.FunctionUrlAuthType.NONE,
      cors: {
        allowedOrigins: ["*"],
        allowedHeaders: ["*"],
        allowedMethods: [lambda.HttpMethod.ALL],
      },
    });

    new cdk.CfnOutput(this, "LambdaExampleUrl", { value: fnUrl.url });
  }
}
