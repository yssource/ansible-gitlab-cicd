# Setting initial root password on installation
-------------------------------------------------
# https://docs.gitlab.com/omnibus/settings/configuration.html

The initial password for the user root can be set at the installation time with the environment variable `GITLAB_ROOT_PASSWORD.

```Example:

GITLAB_ROOT_PASSWORD="<strongpassword>" EXTERNAL_URL="http://gitlab.exmaple.com" yum install gitlab-ce

```

# https://docs.gitlab.com/runner/register/
