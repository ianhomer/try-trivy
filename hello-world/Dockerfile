FROM alpine:3.20

# Mock secret to test scanning
RUN echo "AWS_ACCESS_KEY_ID=AKIA0123456789ABCDEF" > ./bad-secret.txt

CMD ["echo", "Hello, World!"]
