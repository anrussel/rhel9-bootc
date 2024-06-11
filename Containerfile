FROM registry.redhat.io/rhel9/rhel-bootc:9.4



RUN dnf install -y openssh-server && \
    dnf clean all && \
    systemctl enable sshd

RUN useradd -G wheel cloud-user && \
    mkdir -m 0700 -p /home/cloud-user/.ssh/ 

COPY authorized_keys /home/cloud-user/.ssh/authorized_keys

RUN chmod 0600 /home/cloud-user/.ssh/authorized_keys && \
    chown -R cloud-user: /home/cloud-user

RUN echo "root:redhat" | chpasswd
