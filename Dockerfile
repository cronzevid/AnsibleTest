FROM alpine:3.5

RUN apk update &&\
    apk add openssh &&\
    apk add python3 &&\
    /usr/bin/ssh-keygen -A &&\
    echo -e "PermitRootLogin yes\n" >> /etc/ssh/sshd_config && \
    echo -e "PubkeyAuthentication yes\n" >> /etc/ssh/sshd_config && \
    echo -e "PasswordAuthentication no\n" >> /etc/ssh/sshd_config && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config 

COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chown -R root:root /root/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
