#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Yoshiaki Naruse <zhengyit364@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

out=$(./konndate 肉 焼く 牛)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'ステーキ\n焼肉' ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res


