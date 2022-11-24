FROM golang:1.18 AS builder

WORKDIR /usr/src/myapp
COPY . /usr/src/myapp/

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a

FROM scratch

COPY --from=builder /usr/src/myapp/frontend ./
COPY --from=builder /usr/src/myapp/static ./static
COPY --from=builder /usr/src/myapp/templates ./templates

ENTRYPOINT ["./frontend"]