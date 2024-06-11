FROM registry.redhat.io/rhel9/rhel-bootc:9.4



RUN dnf install -y openssh-server && \
    dnf clean all && \
    systemctl enable sshd

ARG sshpubkey
RUN if test -z $"sshpubkey"; then echo "must provide sshpubkey"; exit 1; fi; \
    useradd -G wheel cloud-user && \
    mkdir -m 0700 -p /home/cloud-user/.ssh/ && \
    echo $sshpubkey > /home/cloud-user/.ssh/authorized_keys && \
    chmod 0600 /home/cloud-user/.ssh/authorized_keys && \
    chown -R cloud-user: /home/cloud-user

