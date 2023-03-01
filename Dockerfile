FROM ubuntu:lunar as builder
WORKDIR /app
RUN apt update && apt install curl -y
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod u+x ./kubectl

FROM gcr.io/kaniko-project/executor:latest
COPY --from=builder /app/kubectl /usr/bin/kubectl

ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null"]
