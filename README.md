# robosys2025

ロボットシステム学の練習用リポジトリ

## plus コマンド

![test](https://github.com/bannbuu/robosys2025/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ数値を足し算するコマンドです。  
整数の文字列は整数として、それ以外は浮動小数点数として扱って合計します。

### 使い方

```bash
# 実行権限を付ける（初回だけ）
chmod +x plus

# 1から5までを足し算
seq 5 | ./plus
# => 15

# 改行区切りの数値を足し算
echo -e "1\n2\n3" | ./plus
# => 6
## 必要なソフトウェア

- Python 3  
  - テスト済みバージョン: 3.8〜3.11

## テスト環境

- Ubuntu 22.04 LTS

## ライセンス

- このソフトウェアパッケージは、3 条項 BSD ライセンスの下で配布されています。  
- © 2024 Yoshiaki Naruse  
- 詳細は `LICENSE` ファイルを参照してください。  
- 各スクリプトの先頭には、次の SPDX タグを記載しています：  
  - `SPDX-FileCopyrightText: 2024 Yoshiaki Naruse`  
  - `SPDX-License-Identifier: BSD-3-Clause`

