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
- `make run` - Run the hello-world Docker image and exit
