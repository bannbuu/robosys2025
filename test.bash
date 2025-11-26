#!/bin/bash -xv

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### plus コマンドのテスト ###

# NORMAL INPUT
out=$(seq 5 | ./plus)
[ "$?" = 0 ] || ng "$LINENO"          # 正常終了しているか
[ "${out}" = 15 ] || ng "$LINENO"     # 1+2+3+4+5 = 15 か

# STRANGE INPUT 1: 計算できない値
out=$(echo あ | ./plus)
[ "$?" = 1 ] || ng "$LINENO"          # エラー終了しているか
[ "${out}" = "" ] || ng "$LINENO"     # 標準出力には何も出ていないか

# STRANGE INPUT 2: 何も入力しない
out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"


### food コマンドのテスト ###

# NORMAL INPUT: 肉 / 焼く / 牛
out=$(./food 肉 焼く 牛)
[ "$?" = 0 ] || ng "$LINENO"          # 正常終了しているか
[ -n "${out}" ] || ng "$LINENO"       # 1行以上出力されているか（ステーキ/焼肉など）

# HELP の確認
out=$(./food --help)
[ "$?" = 0 ] || ng "$LINENO"          # ヘルプは正常終了であるべき
# ヘルプの内容まではここではチェックしない

# 未対応の大ジャンル
out=$(./food 野菜 焼く 牛)
[ "$?" = 2 ] || ng "$LINENO"          # 想定どおり終了ステータス2か
[ "${out}" = "" ] || ng "$LINENO"     # 標準出力は空（エラーはstderr）

# 組み合わせが見つからない場合
out=$(./food 肉 揚げる 羊)
[ "$?" = 4 ] || ng "$LINENO"          # 想定どおり終了ステータス4か
[ "${out}" = "" ] || ng "$LINENO"     # 標準出力は空

### すべてのテストが通ったかどうか ###

[ "${res}" = 0 ] && echo OK
exit $res

