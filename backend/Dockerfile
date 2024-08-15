FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o my-backend
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/my-backend .
EXPOSE 8080
CMD ["./my-backend"]