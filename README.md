# robosys2025

ロボットシステム学の練習用リポジトリ

![test](https://github.com/bannbuu/robosys2025/actions/workflows/test.yml/badge.svg)

---

## food コマンド

コマンドライン引数で料理のジャンルを指定すると，対応する料理名を表示するコマンドです。  
3つの引数で「大ジャンル」「調理法」「食材」を指定します。

### 使い方の例

```sh
# 初回のみ実行権限を付与
chmod +x food

# 例: 肉 / 焼く / 牛 に対応する料理を表示
./food 肉 焼く 牛
# => ステーキ
#    焼肉

# ヘルプの表示
./food --help

