FROM golang:1.12 as build

ENV GO111MODULE=on

WORKDIR /http-getter

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch

COPY --from=build /http-getter/http-getter /http-getter/
EXPOSE 8080
ENTRYPOINT ["/http-getter/http-getter"]
CMD ["do"]
