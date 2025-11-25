#!/bin/bash -xv

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### NORMAL INPUT ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT 1: 計算できない値 ###
out=$(echo あ | ./plus)     # ひらがなを入れてわざとエラー
[ "$?" = 1 ] || ng "$LINENO"    # 終了ステータスが 1 か？
[ "${out}" = "" ] || ng "$LINENO"   # 何も出力していないか？

### STRANGE INPUT 2: 何も入力しない ###
out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK   # ここまで全部通ったら OK と表示
exit $res                     # テスト結果を終了ステータスで返す

