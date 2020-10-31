# Setting initial root password on installation
-------------------------------------------------
# https://docs.gitlab.com/omnibus/settings/configuration.html

The initial password for the user root can be set at the installation time with the environment variable `GITLAB_ROOT_PASSWORD.

```Example:
GITLAB_ROOT_PASSWORD="<strongpassword>" 
EXTERNAL_URL="http://gitlab.exmaple.com" yum install gitlab-ce
```

Registering GitLab runner
==============================
Obtain a regoistration token
Shared Runner:
For a shared runner, have an administrator go to the GitLab Admin Area:
http://<gitlab-url>
click Overview > Runners

# https://docs.gitlab.com/runner/register/


Installinng helm
--------------------

Download Helm v3.3.4. The common platform binaries are here:

    Linux amd64
    checksum: 'sha256:b664632683c36446deeb85c406871590d879491e3de18978b426769e43a1e82c'

   Avalable at https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz


/var/opt/gitlab/.ssh/authorized_keys
command="/opt/gitlab/embedded/service/gitlab-shell/bin/gitlab-shell key-1",no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrp8iKsIqhMs9AatruTpYuNBubeEiKlGIg+1YQoD4eXggfcdrMo/B+Zl6OT1JVTk4que1P2hfXw1gQeayELHWhPFRYcMA/Qsnf96u/vOsthEMUYplBibBBx4umAvFjj9L2IzAixV/svst5gJVR/d6z5C5xz9mogLeN2HpIUMbSjsld4nKqZR2Q0CZskzjesr8YOwa1OcX3JeJ2BDdx/stEQzbI8yUrHX0x+2Vc8a8eCCvA5D6idF+wA6nBIwfojrWrW++bF9Dvyj2No7iLOYqhjqTf18ZEXbTlCwn2MJSXb1AFz2mKI28g8tKxdOEmfkY3XXYlBXtiDyVj2RMMDSWL
