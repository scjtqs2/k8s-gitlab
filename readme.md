# gitlab-ce 的docker镜像 跑在k8s上

## 初始密码
> 用户名 `root`
> 
> 自 gitlab-ce 14开始，初装密码都写入到了`/etc/gitlab/initial_root_password`文件中了
> 
> 这个文件将在首次执行reconfigure后24小时自动删除，所以请及时登录并修改。
> 
## 配置选择
1. `gitlab`: gitlab本地
   1. 修改 `config.yaml`中域名和邮件配置。
   2. 修改 `deployment-amd64.yaml` for amd64 或者 `deployment-arm64.yaml` for arm64 中的目录挂载配置。demo里面是nfs的挂载样例。
   3. 修改 `ingress.yaml` 中的'cert-manager注册'部分 和 域名
2. `runner`: gitlab的 runner服务
   1. 修改 `values.yaml` 中的`runnerRegistrationToken` 为你 gitlab后台的token。
   2. 安装方法：`bash install.sh` 
   3. 卸载方法：`bash uninstall.sh`