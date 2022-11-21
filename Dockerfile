FROM golang:1.16-buster AS builder

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o bin .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/bin /app/bin

# ENTRYPOINT ["/"]
CMD ["/app/./bin"]