FROM golang:1.12 AS build
ADD cmd/waitforsignal /go/src/waitforsignal
RUN CGO_ENABLED=0 GOOS=linux go install -a -ldflags '-extldflags "-static"' waitforsignal

FROM scratch
COPY --from=build /go/bin/waitforsignal /usr/local/bin/waitforsignal
ENTRYPOINT ["/usr/local/bin/waitforsignal"]
