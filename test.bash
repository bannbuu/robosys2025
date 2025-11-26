#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Yoshiaki Naruse <zhengyit364@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### NORMAL INPUT: 正常な入力 ###
# 期待する出力:
# ステーキ
# 焼肉
out=$(./food 肉 焼く 牛)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'ステーキ\n焼肉' ] || ng "$LINENO"

### STRANGE INPUT 1: 存在しない組み合わせ ###
# 第3引数に「羊」を渡して、見つからずエラー終了(4)になるか
out=$(./food 肉 焼く 羊 2> /dev/null)
[ "$?" = 4 ] || ng "$LINENO"

### STRANGE INPUT 2: 引数が足りない ###
# 引数 2 個で実行して、使い方エラー(1)になるか
out=$(./food 肉 焼く 2> /dev/null)
[ "$?" = 1 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK   # ここまで全部通ったら OK と表示
exit $res
