# RSVG-Convert (LibRSVG) for AWS Lambda

Scripts to compile LibRSVG for AWS Lambda instances powered by Amazon Linux 2.x, such as the `nodejs10.x` runtime, and the updated 2018.03 Amazon Linux 1 runtimes. 

## Usage

Absolutely the easiest way of using this is to pull it directly from the AWS Serverless Application repository into a CloudFormation/SAM application, or deploy directly from the Serverless Application Repository into your account, and then link as a layer. 

The `rsvg` binary will be in `/opt/bin/rsvg-convert` after linking the layer to a Lambda function.

For more information, check out the [rsvg-convert-lambda-layer](https://console.aws.amazon.com/lambda/home?region=us-east-1#/create/app?applicationId=arn:aws:serverlessrepo:us-east-1:145266761615:applications/rsvg-convert-lambda-layer) application in the Serverless App Repository.

For manual deployments and custom builds, read below...

## Prerequisites

* Docker desktop
* Unix Make environment
* AWS command line utilities (just for deployment)

## Compiling the code

* start Docker services
* `make all`

There are two `make` scripts in this project.

* [`Makefile`](Makefile) is intended to run on the build system, and just starts a Docker container matching the AWS Linux 2 environment for Lambda runtimes to compile Rsvg using the second script.
* [`Makefile_Rsvg`](Makefile_Rsvg) is the script that will run inside the container, and actually compile binaries. 

The output will be in the `result` dir.

### Configuring the build

By default, this compiles a version expecting to run as a Lambda layer from `/opt`. You can change the expected location by providing a `TARGET` variable when invoking `make`.

The default Docker image used is `lambci/lambda-base-2:build`. To use a different base, provide a `DOCKER_IMAGE` variable when invoking `make`.

Modify the versions of libraries or librsvg directly in [`Makefile_Rsvg`](Makefile_Rsvg).

### Experimenting

* `make bash` to open an interactive shell with all the build directories mounted

### Compiled info

```
rsvg-convert version 2.26.3
```

## Deploying to AWS as a layer

Run the following command to deploy the compiled result as a layer in your AWS account.

```
make deploy DEPLOYMENT_BUCKET=<YOUR BUCKET NAME>
```

### configuring the deployment

By default, this uses `rsvg-layer` as the stack name. Provide a `STACK_NAME` variable when
calling `make deploy` to use an alternative name.

### example usage

An example project is in the [example](example) directory. It sets up two buckets, and listens to file uploads on the first bucket to convert and generate PDF files from SVG images. You can deploy it from the root Makefile using:

```
make deploy-example DEPLOYMENT_BUCKET=<YOUR BUCKET NAME>
```

For more information, check out:

* https://github.com/GNOME/librsvg

## Author

Gojko Adzic <https://gojko.net>

## License

* These scripts: [MIT](https://opensource.org/licenses/MIT)
* Rsvg: <https://github.com/GNOME/librsvg/blob/master/COPYING>
* Contained libraries all have separate licenses, check the respective web sites for more information
