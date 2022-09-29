# A simple docker container for ssh testing

## How to use the container

In order to use the container you have to provide SSH server keys (currently **ed25519** and **RSA**) in the `/etc/ssh/keys` directory. An authorized keys file (path `/home/ssh-test/.ssh/authorized_keys`) is required to be able to log in with the user `ssh-test`.

### Example docker run command

```
docker run -v <Path to server keys directory>:/etc/ssh/keys:ro -v <Path to authorized_keys file>:/home/ssh-test/.ssh/authorized_keys:ro -p 127.0.0.1:1022:22 --name ssh-test --hostname ssh-test-container ghcr.io/dragonhill-net/ssh-test-container:<container tag>
```

### Key generation commands

```
ssh-keygen -q -N "" -t ed25519 -f <Path to server keys directory>/ssh_host_ed25519_key
ssh-keygen -q -N "" -t rsa -b 4096 -f <Path to server keys directory>/ssh_host_rsa_key
```

### Connection example

```
ssh -p 1022 ssh-test@127.0.0.1
```
