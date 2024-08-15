FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o my-frontend
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/my-frontend .
EXPOSE 8080
CMD ["./my-frontend"]