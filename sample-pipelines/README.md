

https://docs.gitlab.com/ee/ci/ssh_keys/

gitlab-runner register \
  --tls-ca-file /etc/gitlab-runner/certs/ca.crt \
  --tls-cert-file "/etc/gitlab-runner/certs/usctvltstgitlbrn02v.curbstone.com.crt" \
  --tls-key-file "/etc/gitlab-runner/certs/usctvltstgitlbrn02v.curbstone.com.key" \
  --tag-list shell,ssh  \
  -n -r vu1zFo5okhrn69uBLApq \
  --url https://usctvltstgitlbci01v.curbstone.com \
  --run-untagged=true  \
  --locked=false  \
  --name="usctvltstgitlbci01v.curbstone.com-ssh" \
  --executor=ssh \
  --ssh-host usctvltstgitlbci01v.curbstone.com \
  --ssh-port 22 \
  --ssh-identity-file /home/gitlab-runner/.ssh/id_rsa \
  --ssh-user gitlab-runner
