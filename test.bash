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

out=$(./konndate 肉 揚げる 牛)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'コロッケ\nメンチカツ\n牛かつ' ] || ng "$LINENO"

out=$(./konndate 肉 丼 豚)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'ソースカツ丼\nかつ丼\n味噌カツ丼' ] || ng "$LINENO"

out=$(./konndate 肉 揚げる 鳥)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'鳥のから揚げ\nチキン南蛮\nフライドチキン' ] || ng "$LINENO"

out=$(./konndate 魚 焼く 白身)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'白身魚の塩焼き\nムニエル' ] || ng "$LINENO"

out=$(./konndate 魚 生 赤身)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'マグロの刺身\nカツオのたたき' ] || ng "$LINENO"

out=$(./konndate 魚 丼 赤身)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'鉄火丼\n海鮮丼' ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res


