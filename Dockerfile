
############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git

# Force the go compiler to use modules
ENV GO111MODULE=on

# Add Maintainer Info
LABEL maintainer="Cristian Chaparro <cristianchaparroa@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/app/backend

# Copy everything from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

# Download all the dependencies
RUN go mod download
RUN go mod tidy



RUN go build -o app
RUN cp app /go/bin

############################
# STEP 2 build a small image
############################
FROM alpine:latest
WORKDIR /go/bin
# Copy our static executable.
COPY --from=builder /go/bin/app .

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD  ["./app"]
