# See https://hub.docker.com/_/alpine/tags
# 3.22.1 has no known vulnerabilities
# 3.21.2 has critical - CVE-2025-26519
FROM alpine:3.22.1

# Mock secret to test scanning
# Add an "A" before K in AWS_ACCESS_KEY to see trivy catch secret in project scan
# Uncomment to see trivy catch secret key in image scan
# RUN echo "XXX_ACCES_KEY_ID=KIA0123456789ABCDEF" > ./bad-secret.txt

CMD ["echo", "Hello, World!"]
