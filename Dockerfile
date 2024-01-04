FROM alpine:latest

ARG TARGETOS
ARG TARGETARCH
ARG CONNECTOR_VERSION

# Install necessary dependencies
RUN apk add --no-cache wget

RUN wget -P /tmp/plugin https://repo1.maven.org/maven2/org/mongodb/kafka/mongo-kafka-connect/${CONNECTOR_VERSION}/mongo-kafka-connect-${CONNECTOR_VERSION}-all.jar

# Define the entry point command
ENTRYPOINT [ "/bin/sh", "-c", "cp -r /tmp/plugin/ /opt/kafka/libs/connector-plugins/mongodb-official/" ]
