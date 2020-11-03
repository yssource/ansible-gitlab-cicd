# ansible-gitlab-cicd
--------------------------------------

Setting initial root password on installation
===============================================

# https://docs.gitlab.com/omnibus/settings/configuration.html

The initial password for the user root can be set at the installation time with the environment variable `GITLAB_ROOT_PASSWORD.

```Example:
GITLAB_ROOT_PASSWORD="<strongpassword>"
EXTERNAL_URL="http://gitlab.exmaple.com" yum install gitlab-ce
```

Set API User Access Token 
--------------------------------------------
Token Must be exactly 20 characters

```
set -x
gitlab-rails runner "token = User.find_by_username('root').personal_access_tokens.create(scopes: [:api, :write_repository, :sudo], name: 'root'); token.set_token('vu1zFo5okhrn69uBLApq'); token.save!"
```

Verify API User Access Token

```
[root@usctvltstgitlbci01v ~]# curl -s --header "PRIVATE-TOKEN: vu1zFo5okhrn69uBLApq" http://localhost:80/api/v4/user | jq '.'
{
  "id": 1,
  "name": "Administrator",
  "username": "root",
  "state": "active",
  "avatar_url": "https://www.gravatar.com/avatar/e64c7d89f26bd1972efa854d13d7dd61?s=80&d=identicon",
  "web_url": "http://usctvltstgitlbci01v.curbstone.com/root",
  "created_at": "2020-10-31T13:45:32.383Z",
  "bio": "",
  "bio_html": "",
  "location": null,
  "public_email": "",
  "skype": "",
  "linkedin": "",
  "twitter": "",
  "website_url": "",
  "organization": null,
  "job_title": "",
  "work_information": null,
  "last_sign_in_at": "2020-10-31T14:25:52.988Z",
  "confirmed_at": "2020-10-31T13:45:32.224Z",
  "last_activity_on": "2020-10-31",
  "email": "admin@example.com",
  "theme_id": 1,
  "color_scheme_id": 1,
  "projects_limit": 100000,
  "current_sign_in_at": "2020-10-31T14:25:52.988Z",
  "identities": [],
  "can_create_group": true,
  "can_create_project": true,
  "two_factor_enabled": false,
  "external": false,
  "private_profile": false,
  "is_admin": true,
  "note": null
}
[root@usctvltstgitlbci01v ~]#
```

Using the API to Register Gitlab-Runner
============================================

```
[root@usctvltstgitlbci01v ~]# curl --request POST "https://localhost:80/api/v4/runners" --form "token=vu1zFo5okhrn69uBLApq" --form "description=localRunner" --form "tag_list=ruby,mysql,shell"
```

```
curl --request POST "https://gitlab.example.com/api/v4/runners" \
     --form "token=<registration_token>" \
     --form "description=test-1-20150125-test" \
     --form "locked=false" \
     --form "tag_list=shell"
```

Manually Registering GitLab runner
==============================
Obtain a regoistration token
Shared Runner:
For a shared runner, have an administrator go to the GitLab Admin Area:
http://<gitlab-url>
==> Overview 
  ==> Runners

# https://docs.gitlab.com/runner/register/


Installing helm
--------------------

Download Helm v3.3.4. The common platform binaries are here:

    Linux amd64
    checksum: 'sha256:b664632683c36446deeb85c406871590d879491e3de18978b426769e43a1e82c'

   Avalable at https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz


/var/opt/gitlab/.ssh/authorized_keys
command="/opt/gitlab/embedded/service/gitlab-shell/bin/gitlab-shell key-1",no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrp8iKsIqhMs9AatruTpYuNBubeEiKlGIg+1YQoD4eXggfcdrMo/B+Zl6OT1JVTk4que1P2hfXw1gQeayELHWhPFRYcMA/Qsnf96u/vOsthEMUYplBibBBx4umAvFjj9L2IzAixV/svst5gJVR/d6z5C5xz9mogLeN2HpIUMbSjsld4nKqZR2Q0CZskzjesr8YOwa1OcX3JeJ2BDdx/stEQzbI8yUrHX0x+2Vc8a8eCCvA5D6idF+wA6nBIwfojrWrW++bF9Dvyj2No7iLOYqhjqTf18ZEXbTlCwn2MJSXb1AFz2mKI28g8tKxdOEmfkY3XXYlBXtiDyVj2RMMDSWL


Enable Prometheus Metrics
=========================

To enable prometheus metrics the monitoring endpoint/prometheus server's IP address must be whitelisted in /etc/gitlab/gitlab.rb config file as follows:
```
/etc/gitlab/gitlab.rb
gitlab_rails['monitoring_whitelist'] = ['127.0.0.0/8', '192.168.0.1']

```

### For setting up different data storing directory
###! Docs: https://docs.gitlab.com/omnibus/settings/configuration.html#storing-git-data-in-an-alternative-directory
###! **If you want to use a single non-default directory to store git data use a
###!   path that doesn't contain symlinks.**
 git_data_dirs({
   "default" => {
     "path" => "/apps/gitlab/git-data"
    }
 })
