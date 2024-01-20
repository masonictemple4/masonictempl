FROM golang:1.21

WORKDIR /usr/src/masonictempl

# Use these within our application
# to avoid issues running the cli outside of
# project root. As well as a host of other
# path issues that can arise.
ENV PWD=/usr/src/masonictempl
ENV WORKDIR=/usr/src/masonictempl

# Note: Make sure you have the certs and creds folders in a local env folder
COPY . .

RUN go mod download

RUN make build

ENV PORT=8080

# Should be set by default on the target machine, but just incase.
EXPOSE 8080

CMD ["./bin/masonictempl"]


