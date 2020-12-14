#===============================================================================
#
# TODO:
#    Search for Regex before attempting to replace it for idempotency
#
# - name: Set Gitlab EXTERNAL_URL
#   lineinfile:
#     path: /etc/gitlab/gitlab.rb
#     regexp: "^external_url 'http://gitlab.example.com'"
#     line: external_url 'http://{{ ansible_fqdn }}'
#===============================================================================

#===============================================================================
#
# Install supporting Insrstructure Code Packages
#
#===============================================================================
# TODO:
#  bsdtar -x -f helm-v3.3.4-linux-amd64.tar.gz --strip-components 1
# README.md
# LICENSE
# helm
#
# Or
#
# [root@usctvltstgitlbci01v tmp]# tar -zxvf helm-v3.3.4-linux-amd64.tar.gz
# linux-amd64/
# linux-amd64/README.md
# linux-amd64/LICENSE
# linux-amd64/helm
# [root@usctvltstgitlbci01v tmp]#
#===============================================================================
