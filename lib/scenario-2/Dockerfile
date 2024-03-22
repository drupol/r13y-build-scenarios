FROM alpine as build-env
RUN apk add --no-cache build-base
WORKDIR /app
COPY . .
RUN gcc datetime.c -o datetime

FROM alpine
COPY --from=build-env /app/datetime /app/datetime
WORKDIR /app
CMD ["/app/datetime"]
