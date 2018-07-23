FROM rastasheep/ubuntu-sshd:18.04

COPY id_rsa.pub /root/.ssh/authorized_keys
COPY p2p-port-forward-linux-amd64 /bin/p2p-port-forward-linux-amd64

RUN sed -ri 's/^#?ChallengeResponseAuthentication\s+.*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
RUN sed -ri 's/^#?PasswordAuthentication\s+.*/PasswordAuthentication no/' /etc/ssh/sshd_config
