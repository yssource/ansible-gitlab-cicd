https://github.com/nodesource/distributions

https://computingforgeeks.com/how-to-install-latest-redis-on-centos-7/

https://docs.gitlab.com/ee/install/requirements.html


```
#
# .gitlab-ci.yml
#

before_script:
  - echo "Executing Before Scripts"
  - whoami
  - sudo su -  -c "yum install -y ansible bc"

after_script:
  - echo "Executing After Script(s)"
  - sudo su -  -c "yum clean all"

stages:
  - build
  - test
  - deploy

build:
  stage: build
  script:
    - |
      echo "In the Build script section"

test:
  stage: test
  script:
    - echo "Do a test here"
    - echo "For example run a test suite"

deploy:
  stage: deploy
  script:
    - echo "Do your deploy here"

```
