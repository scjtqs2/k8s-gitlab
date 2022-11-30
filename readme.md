# gitlab-ce 的docker镜像 跑在k8s上

## 初始密码
> 用户名 `root`
> 
> 自 gitlab-ce 14开始，初装密码都写入到了`/etc/gitlab/initial_root_password`文件中了
> 
> 这个文件将在首次执行reconfigure后24小时自动删除，所以请及时登录并修改。