# gitlab-ce 的docker镜像 跑在k8s上
> 支持 x86_64 和 arm64 
> 

## 初始密码
> 用户名 `root`
> 
> 自 gitlab-ce 14开始，初装密码都写入到了`/etc/gitlab/initial_root_password`文件中了
> 
> 这个文件将在首次执行reconfigure后24小时自动删除，所以请及时登录并修改。
> 
## 配置选择
1. `gitlab`: gitlab本地
   1. 修改 `2-config.yaml`中域名和邮件配置。
   2. 修改 `3-deployment-amd64.yaml` for amd64 或者 `3-deployment-arm64.yaml` for arm64 中的目录挂载配置。demo里面是nfs的挂载样例。
   3. 修改 `5-ingress.yaml` 中的'cert-manager注册'部分 和 域名
   4. 安装：
   ```shell
   cd gitlab
   kubectl apply -f 1-namespace.yaml
   kubectl apply -f 2-config.yaml
   ## only for x86-64  
   kubectl apply -f 3-deployment-amd64.yaml
   ## only for arm64
   kubectl apply -f 3-deployment-arm64.yaml  
   kubectl apply -f 4-service.yaml  # 如果你的k8s集群是双栈的，同时支持ipv4和ipv6,安装 `service_with_ipv6.yaml` 吧。
   kubectl apply -f 5-ingress.yaml
   ```
2. `runner`: gitlab的 runner服务
   1. 修改 `values.yaml` 中的`runnerRegistrationToken` 为你 gitlab后台的token。
   2. 安装方法：`bash install.sh` 
   3. 卸载方法：`bash uninstall.sh`

3. `.gitlab-ci.yml`: github的项目自动同步到gitlab-ce的配置demo，需要自行手动在项目内配置定时任务。定时任务的配置不在ci文件中。