インフラ情報を CI 等から参照するために、ファイルに出力しておく

# Usage

## 1. Generate `meta.json` by terraform

以下のコードは、`meta.json` に terraform で作成したインフラの情報を出力する例です。
このファイルは git 管理します。

```terraform
module "metadata" {
  source = "git@github.com:moajo/terraform-metadata?ref=v1"

  metadata_path = "meta.json"
  vars = {
    ACCOUNT_ID       = "0123456789",
    AWS_REGION       = "ap-northeast-1",
    ECR_URL          = module.main.ecr_repo_url,
    ECS_CLUSTER_NAME = module.main.ecs_cluster_name,
  }
}
```

## 2. Use `meta.json` in CI

```yaml
jobs:
  sample:
    runs-on: ubuntu-latest
    name: this is sample
    steps:
      - uses: actions/checkout@v3
      - uses: moajo/terraform-metadata@v1
        with:
          metadata_path: "./meta.json"
      - run: echo "Current account is $ACCOUNT_ID !"
```
