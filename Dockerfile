FROM debian:bullseye-slim

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y openssh-server socat \
    && rm -rf /var/lib/apt/lists/* \
    && rm /etc/ssh/ssh_host_*_key* \
    && printf "\nHostKey /etc/ssh/keys/ssh_host_ed25519_key\nHostKey /etc/ssh/keys/ssh_host_rsa_key\n" >> /etc/ssh/sshd_config \
    && mkdir /var/run/sshd \
    && useradd --create-home --user-group --shell /bin/bash ssh-test \
    && mkdir /home/ssh-test/.ssh \
    && chown ssh-test:ssh-test /home/ssh-test/.ssh \
    && chmod 700 /home/ssh-test/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
