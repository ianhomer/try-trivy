.PHONY: build scan-image run lint

build:
	docker build -t hello-world ./hello-world

scan-image: build
	trivy image hello-world

run:
	docker run --rm hello-world

lint:
	docker run --rm -i hadolint/hadolint < hello-world/Dockerfile
