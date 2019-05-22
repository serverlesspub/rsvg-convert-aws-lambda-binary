STACK_NAME ?= rsvg-layer-example
RSVG_STACK_NAME ?= rsvg-layer

RSVG_LAYER ?=$(shell aws cloudformation describe-stacks --stack-name $(RSVG_STACK_NAME) --query Stacks[].Outputs[].OutputValue --output text)
SOURCES=$(shell find src/)

clean: 
	rm -rf build

output.yaml: template.yaml $(SOURCES)
	mkdir -p build
	aws cloudformation package --template-file $< --output-template-file $@ --s3-bucket $(DEPLOYMENT_BUCKET)

deploy: output.yaml
	aws cloudformation deploy --template-file $< --stack-name $(STACK_NAME) --capabilities CAPABILITY_IAM --parameter-overrides RsvgLayer=$(RSVG_LAYER)
	aws cloudformation describe-stacks --stack-name $(STACK_NAME) --query Stacks[].Outputs --output table

