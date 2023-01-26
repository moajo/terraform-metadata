Github action and terraform module to refer to the infrastructure information created by terraform from CI/CD.

# Usage

## 1. Generate `meta.json` by terraform

以下のコードは、`meta.json` に terraform で作成したインフラの情報を出力します。
このファイルは git 管理します。

```terraform
module "metadata" {
  source = "git@github.com:moajo/terraform-metadata?ref=v1"

  metadata_path = "meta.json"
  vars = {
    ACCOUNT_ID = data.aws_caller_identity.current.account_id,
    SG_ID      = aws_security_group.example.id,
    # ...
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
      # use $ACCOUNT_ID, $SG_ID, ...
```
