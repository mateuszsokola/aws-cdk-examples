# AWS CDK deployments for SDEs

Collection of production-ready AWS CDK deployment patterns that just work. Perfect for developers who want to focus on coding rather than infrastructure management.

## Examples

### Multi-Region Lambda Deployment

Deploys a Node.js Lambda function across multiple regions (US, EU, Hong Kong) with Function URLs for low-latency global access.

```bash
cd 00-lambda
npm install
cdk deploy --all
```

## Prerequisites

- Node.js (check `.nvmrc` for version)
- AWS CLI configured with appropriate credentials
- CDK CLI installed (`npm install -g aws-cdk`)

## Getting Started

1. Clone the repository
2. Navigate to the example you want to deploy. Eg. `cd 00-lambda/`
3. Install dependencies: `npm install`
4. Deploy: `cdk deploy --all`

## Contributing

Feel free to submit issues and enhancement requests!

## License

MIT
