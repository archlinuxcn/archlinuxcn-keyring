# archlinuxcn 社区源打包者 PGP keyring

这里存放 Arch Linux CN 社区源打包者 PGP keyring

## archlinuxcn 用户

请根据 [archlinuxcn/repo README.md](https://github.com/archlinuxcn/repo/blob/master/README.md) 添加软件源仓库并安装 archlinuxcn-keyring 包。

## archlinuxcn 打包者

如需添加新 key ，请按照以下方式提出 PR ：

1. 将您的 pubkey 提交到某个公开的 keyserver ，确保 `gpg --keyserver --recv-key <fingerprint>` 可接收到您的 pubkey 。
2. 将您的 pubkey fingerprint 填入 master-keyids ，格式为
```
<fingerprint>    <username>    <keyserver>
```
3. 执行 update-keys 确保能接收到您的 pubkey ，在 master 文件夹创建了 `<username>.asc` 的 pubkey 。
4. 在 commit 中确保 master-keyids 包含了您的 fingerprint

在接收到 PR 后，我们会在本地再次执行 update-keys 并打包。