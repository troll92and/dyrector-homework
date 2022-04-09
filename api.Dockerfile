FROM golang:latest
RUN mkdir -p /app
COPY ./cats-service /app
WORKDIR /app
RUN go mod download
RUN go build  -o /main .
COPY ./wait.sh ./wait.sh
RUN chmod +rx ./wait.sh
CMD ./wait.sh -t 180 localhost:3306 -- /main
