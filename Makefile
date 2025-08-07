.PHONY: build scan scan-image scan-fs scan-repo scan-licenses sbom sbom-image sbom-fs npm-audit run lint

build:
	docker build -t hello-world ./hello-world

out:
	mkdir out

scan-image: build
	trivy image hello-world

scan-image-json: build out
	trivy image hello-world --format json --output out/image-report.json

scan-fs:
	trivy fs .

scan-fs-json: out
	trivy fs --format json --output out/fs-report.json .

scan-repo:
	trivy repo .

scan2html-install:
	trivy plugin install scan2html
	
report: scan-image-json scan-fs-json
	rm -f out/report.html
	trivy scan2html generate --scan2html-flags --output out/index.html \
		--from out/fs-report.json,out/image-report.json

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
