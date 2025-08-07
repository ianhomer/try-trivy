.PHONY: build scan scan-image scan-fs scan-repo scan-licenses sbom sbom-image sbom-fs npm-audit run lint

build:
	docker build -t hello-world ./hello-world

out-directory:
	mkdir out

report-directory:
	mkdir -p out/report

scan-image: build
	trivy image hello-world

scan-image-json: build report-directory
	trivy image hello-world --scanners secret,vuln,misconfig,license --format json --output out/report/image-report.json

scan-fs:
	trivy fs .

scan-fs-json: report-directory
	trivy fs --scanners secret,vuln,misconfig,license --format json --output out/report/fs-report.json .

scan-repo:
	trivy repo .

scan-repo-json: report-directory
	trivy repo --scanners misconfig,license --format json --output out/reportrepo-report.json .

scan-license:
	trivy fs --scanners license .

scan: scan-image scan-fs scan-licenses

scan2html-install:
	trivy plugin install scan2html

report: scan-image-json scan-fs-json
	rm -f out/index.html
	trivy scan2html generate --scan2html-flags --output out/report/index.html \
		--from out/report/fs-report.json,out/report/image-report.json

sbom-image: build out-directory
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
