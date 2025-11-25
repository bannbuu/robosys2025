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

