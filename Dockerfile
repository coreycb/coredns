FROM debian:stable-slim

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates
RUN apt-get -y install procps net-tools iputils-ping iproute2 tcpdump dnsutils vim

#FROM scratch

#COPY --from=0 /etc/ssl/certs /etc/ssl/certs
ADD coredns /coredns

EXPOSE 53 53/udp
ENTRYPOINT ["/coredns"]
