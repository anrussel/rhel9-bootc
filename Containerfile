FROM registry.redhat.io/rhel9/rhel-bootc:9.4

RUN dnf install -y openssh-server && \
    dnf clean all && \
    systemctl enable sshd

ARG rootpw
RUN echo "root:$rootpw" |chpasswd -e
RUN echo "$rootpw" > p.txt
