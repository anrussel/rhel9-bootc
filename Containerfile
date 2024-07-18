#FROM registry.redhat.io/rhel9/rhel-bootc:9.4-1719225104
FROM registry.redhat.io/rhel9/rhel-bootc:9.4


ARG rootpw
RUN echo "root:$rootpw" |chpasswd -e
