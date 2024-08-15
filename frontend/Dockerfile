FROM golang:1.20-alpine AS builder
WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o frontend .

FROM alpine:latest
WORKDIR /root/

COPY --from=builder /app/frontend .

COPY --from=builder /app/templates /root/templates
COPY --from=builder /app/static /root/static

EXPOSE 8080

CMD ["./frontend"]
