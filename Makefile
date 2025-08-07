.PHONY: build scan scan-image scan-fs scan-repo scan-licenses sbom sbom-image sbom-fs npm-audit run lint

build:
	docker build -t hello-world ./hello-world

scan-image: build
	trivy image hello-world

scan-fs:
	trivy fs .

scan-repo:
	trivy repo .

scan-licenses:
	trivy fs --scanners license .

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

npm-audit:
	cd hello-react && npm audit --audit-level=high

lint:
	docker run --rm -i hadolint/hadolint < hello-world/Dockerfile
