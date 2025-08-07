# See https://hub.docker.com/_/alpine/tags
# 3.21.2 has critical - CVE-2025-26519
FROM alpine:3.21.2

# Mock secret to test scanning
# Uncomment to see trivy catch secret key
# RUN echo "AWS_ACCESS_KEY_ID=AKIA0123456789ABCDEF" > ./bad-secret.txt

CMD ["echo", "Hello, World!"]
