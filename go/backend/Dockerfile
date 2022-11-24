##DO NOT RELEASE TO THE STUDENTS!
# This is the Dockerfile for the backend-dev image.
FROM golang:1.18 as builder
# Set the working directory
WORKDIR /usr/src/app
# Copy the source code
COPY . .
RUN go mod download github.com/gomodule/redigo
# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -o backend .

FROM alpine as runner
COPY --from=builder /usr/src/app/backend /
EXPOSE 9000
ENTRYPOINT ["/backend"]