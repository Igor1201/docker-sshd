FROM rastasheep/ubuntu-sshd:18.04

COPY id_rsa.pub /root/.ssh/authorized_keys

RUN sed -ri 's/^#?ChallengeResponseAuthentication\s+.*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config \
    && sed -ri 's/^#?PasswordAuthentication\s+.*/PasswordAuthentication no/' /etc/ssh/sshd_config \

    && apt-get update \
    && apt-get install -y curl sudo git \

    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
