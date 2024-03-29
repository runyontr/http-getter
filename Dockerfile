FROM golang:1.12

ENV GO111MODULE=on

WORKDIR /http-getter

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

EXPOSE 8080
ENTRYPOINT ["/http-getter/http-getter"]
CMD ["do"]
