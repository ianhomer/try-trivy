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

1. **Scan local filesystem and generate HTML report:**
   ```bash
   trivy scan2html fs --scanners vuln,secret,misconfig . --scan2html-flags --output interactive_report.html
   ```

2. **Generate report from existing JSON scan results:**
   ```bash
   # First create JSON output from Trivy
   trivy fs --format json --output vulnerabilities.json .
   
   # Then generate HTML report
   trivy scan2html generate --scan2html-flags --output interactive_report.html --from vulnerabilities.json
   ```

### Features
- Interactive HTML reports for vulnerabilities, misconfigurations, secrets, and SBOM
- EPSS (Exploit Prediction Scoring System) score integration
- 100% open-source with no API keys or rate limits
- Works with existing Trivy JSON scan results

## Vulnerability Management with DefectDojo

[DefectDojo](https://github.com/DefectDojo/django-DefectDojo) is an open-source DevSecOps and Application Security Posture Management (ASPM) platform that can help you manage Trivy scan results at scale.

### What is DefectDojo?

DefectDojo orchestrates end-to-end security testing, vulnerability tracking, deduplication, remediation, and reporting. It's an OWASP Flagship project designed for security teams managing vulnerabilities across multiple applications and environments.

### Key Features
- **Vulnerability Management**: Centralized tracking and remediation of security findings
- **Tool Integration**: Import scan results from multiple security tools including Trivy
- **Deduplication**: Automatically identifies and merges duplicate vulnerabilities
- **Reporting & Analytics**: Comprehensive dashboards and reports for stakeholders
- **Workflow Automation**: Automate vulnerability triage and remediation workflows

### Quick Setup with Docker

```bash
# Clone the repository
git clone https://github.com/DefectDojo/django-DefectDojo
cd django-DefectDojo

# Start with Docker Compose
docker-compose up -d
```

### Integrating Trivy with DefectDojo

1. **Export Trivy results in JSON format:**
   ```bash
   trivy fs --format json --output trivy-results.json .
   ```

2. **Import results into DefectDojo** through the web interface or API

3. **Set up automated pipelines** to regularly import Trivy scan results for continuous monitoring

### Benefits for Security Teams
- Centralized vulnerability management across all applications
- Historical tracking of security posture improvements
- Integration with ticketing systems (Jira, etc.)
- Compliance reporting and metrics
- Team collaboration and workflow management
