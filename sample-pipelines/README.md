

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



Create GitLab Api Access Token
========================================
```
gitlab-rails runner "token = User.find_by_username('root').personal_access_tokens.create(scopes: \
  [:api, :write_repository ], \
  name: 'Automation token'); \
  token.set_token('tHb88257Z40e349b97a5'); \
  token.save!"
```

Revoke GitLab Api Access Token
========================================

```
gitlab-rails runner "PersonalAccessToken.find_by_token('tHb88257Z40e349b97a5').revoke!"
```

```
curl -kv -s --header "PRIVATE-TOKEN: tHb88257Z40e349b97a5" http://localhost:80/api/v4/user | jq '.'
```

Create GitLab Project groups
========================================

```
curl -v --cacert /etc/gitlab/ssl/ca.crt --cert /etc/gitlab/ssl/usctvltstgitlbci01v.curbstone.com.crt \
  --key /etc/gitlab/ssl/usctvltstgitlbci01v.curbstone.com.key \
  --request POST --header "PRIVATE-TOKEN: tHb88257Z40e349b97a5" \
  --header "Content-Type: application/json" \
  --data '{ "name": "devops", "path": "devops", "description": "Configuration management Repo" }' \
      "https://usctvltstgitlbci01v.curbstone.com:443/api/v4/groups" | jq '.id'
      ```


      lindsworthgarvey@marcusAlexandra ansible-devops-tools % git push --set-upstream http://localhost:8080/lgarvey/ansible-devops-tools.git master
      Username for 'http://localhost:8080': lgarvey
      Password for 'http://lgarvey@localhost:8080':
      Counting objects: 284, done.
      Delta compression using up to 16 threads.
      Compressing objects: 100% (259/259), done.
      Writing objects: 100% (284/284), 62.28 KiB | 0 bytes/s, done.
      Total 284 (delta 9), reused 0 (delta 0)
      remote: Resolving deltas: 100% (9/9), done.
      remote:
      remote:
      remote: The private project lgarvey/ansible-devops-tools was successfully created.
      remote:
      remote: To configure the remote, run:
      remote:   git remote add origin http://symtstgtlbcivm001/lgarvey/ansible-devops-tools.git
      remote:
      remote: To view the project, visit:
      remote:   http://symtstgtlbcivm001/lgarvey/ansible-devops-tools
      remote:
      remote:
      remote:
      To http://localhost:8080/lgarvey/ansible-devops-tools.git
       * [new branch]      master -> master
      Branch master set up to track remote branch master from http://localhost:8080/lgarvey/ansible-devops-tools.git.
      lindsworthgarvey@marcusAlexandra ansible-devops-tools %

Push the Tags

      lindsworthgarvey@marcusAlexandra ansible-devops-tools % git push   git push --tags
