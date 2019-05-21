PROJECT_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

DOCKER_IMAGE ?= lambci/lambda-base-2:build
TARGET ?=/opt/

MOUNTS = -v $(PROJECT_ROOT):/var/task \
	-v $(PROJECT_ROOT)result:$(TARGET)

DOCKER = docker run -it --rm -w=/var/task/build
build result: 
	mkdir $@

clean:
	rm -rf build result

bash:
	$(DOCKER) $(MOUNTS) --entrypoint /bin/bash -t $(DOCKER_IMAGE)

all libs: 
	$(DOCKER) $(MOUNTS) --entrypoint /usr/bin/make -t $(DOCKER_IMAGE) TARGET_DIR=$(TARGET) -f ../Makefile_Rsvg init $@


STACK_NAME ?= rsvg-layer 

result/bin/rsvg: all

build/output.yaml: template.yaml result/bin/rsvg
	aws cloudformation package --template $< --s3-bucket $(DEPLOYMENT_BUCKET) --output-template-file $@

deploy: build/output.yaml
	aws cloudformation deploy --template $< --stack-name $(STACK_NAME)
	aws cloudformation describe-stacks --stack-name $(STACK_NAME) --query Stacks[].Outputs --output table

deploy-example:
	cd example && \
		make deploy DEPLOYMENT_BUCKET=$(DEPLOYMENT_BUCKET) RSVG_STACK_NAME=$(STACK_NAME)
