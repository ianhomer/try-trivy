.PHONY: build scan-image run

build:
	docker build -t hello-world ./hello-world

scan-image:
	trivy image hello-world

run:
	docker run --rm hello-world
