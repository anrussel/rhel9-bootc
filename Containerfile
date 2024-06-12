FROM registry.redhat.io/rhel9/rhel-bootc:9.4

RUN dnf install -y openssh-server && \
    dnf clean all && \
    systemctl enable sshd

RUN useradd -G wheel user && \
    mkdir -m 0700 -p /home/user/.ssh/ 

COPY authorized_keys /home/user/.ssh/authorized_keys

RUN chmod 0600 /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user/

RUN echo "root:redhat" | chpasswd
