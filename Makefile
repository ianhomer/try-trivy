.PHONY: build scan scan-image scan-fs scan-repo sbom sbom-image sbom-fs run lint

build:
	docker build -t hello-world ./hello-world

scan-image: build
	trivy image hello-world

scan-fs:
	trivy fs .

scan-repo:
	trivy repo .

scan: scan-image scan-fs

sbom-image: build
	mkdir -p out
	trivy image --format spdx-json --output out/sbom-image.json hello-world

sbom-fs:
	mkdir -p out
	trivy fs --format spdx-json --output out/sbom-fs.json .

sbom: sbom-image sbom-fs

run:
	docker run --rm hello-world

lint:
	docker run --rm -i hadolint/hadolint < hello-world/Dockerfile
