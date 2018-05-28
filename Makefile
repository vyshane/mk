CONCOURSE_TARGET?=''

dev:
	skaffold dev

test:
	sbt test

build:
	skaffold build

deploy:
	skaffold run

ci:
	fly sp -t $(CONCOURSE_TARGET) -c pipeline.yaml -p mk