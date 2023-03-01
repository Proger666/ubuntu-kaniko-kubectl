FROM gcr.io/kaniko-project/executor:latest as kaniko

FROM ubuntu:lunar

COPY --from=kaniko . .

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod u+x ./kubectl && cp ./kubectl /usr/bin/ && mv ./kubectl /usr/local/bin/kubectl


ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null"]
