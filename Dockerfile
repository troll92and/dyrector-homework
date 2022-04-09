FROM golang:latest
RUN mkdir -p /app
COPY ./cats-service /app
WORKDIR /app
RUN go mod download
RUN go build  -o /main .