FROM registry.redhat.io/rhel9/rhel-bootc:9.4

RUN dnf install -y openssh-server && \
    dnf clean all && \
    systemctl enable sshd

RUN echo "root:$rootpw" |chpasswd -e
