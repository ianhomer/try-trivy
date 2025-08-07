# Try Trivy

Try [Trivy](https://trivy.dev/latest/getting-started/)

## Developer Setup

1. Install pre-commit:

```bash
pip install pre-commit
```

2. Install the git hook scripts:

```bash
pre-commit install
```

3. (Optional) Run against all files:

```bash
pre-commit run --all-files
```

## Commands

- `make build` - Build the hello-world Docker image
- `make scan-image` - Scan the hello-world Docker image for vulnerabilities using Trivy
- `make scan-fs` - Scan filesystem for vulnerabilities
- `make scan-repo` - Scan repository for misconfigurations and secrets
- `make scan-licenses` - Scan for license information
- `make scan` - Run both image and filesystem scans
- `make sbom-image` - Generate SBOM for Docker image (output to `out/sbom-image.json`)
- `make sbom-fs` - Generate SBOM for filesystem (output to `out/sbom-fs.json`)
- `make sbom` - Generate both SBOM files
- `make npm-audit` - Run npm audit for Node.js dependencies
- `make run` - Run the hello-world Docker image and exit
- `make lint` - Run Dockerfile linter

## Interactive HTML Reports with scan2html

For enhanced reporting, you can use the [scan2html](https://github.com/fatihtokus/scan2html) Trivy plugin to generate interactive HTML reports:

### Installation

```bash
trivy plugin install scan2html
```

### Usage Examples

```bash
# First create JSON output from Trivy
trivy fs --format json --output out/report.json .

# Then generate HTML report
trivy scan2html generate --scan2html-flags --output out/report.html \
  --from out/report.json
```
