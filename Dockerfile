# Build stage
FROM golang:1.17-alpine AS builder
WORKDIR /app
COPY go.mod ./
COPY *.go ./
RUN go build -o /go-webapp

# Run stage
FROM alpine:3.14
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go-webapp ./
EXPOSE 8080
CMD ["./go-web-app"]