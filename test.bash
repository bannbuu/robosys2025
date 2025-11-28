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

out=$(./konndate 魚 揚げる 青魚)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'アジフライ\nイワシフライ' ] || ng "$LINENO"

out=$(./konndate 魚 蒸す 貝)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "アサリの酒蒸し" ] || ng "$LINENO"

out=$(./konndate 麺 汁あり 中華)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'ラーメン\n担々麺' ] || ng "$LINENO"

out=$(./konndate 麺 汁なし 中華)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'油そば\n汁なし担々麺' ] || ng "$LINENO"

out=$(./konndate 麺 汁あり 和風)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'かけうどん\nかけそば' ] || ng "$LINENO"

out=$(./konndate 麺 汁なし 和風)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'焼きうどん\n焼きそば' ] || ng "$LINENO"

out=$(./konndate 麺 和風 冷たい)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'ざるそば\nぶっかけうどん' ] || ng "$LINENO"

out=$(./konndate 麺 中華 冷たい)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "冷やし中華" ] || ng "$LINENO"

out=$(./konndate 麺 トマト パスタ)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'ナポリタン\nアラビアータ' ] || ng "$LINENO"

out=$(./konndate 麺 クリーム パスタ)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "カルボナーラ" ] || ng "$LINENO"

out=$(./konndate 麺 和風 パスタ)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "たらこスパゲッティ" ] || ng "$LINENO"

out=$(./konndate 麺 汁あり アジア)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = $'辛ラーメン\nトムヤムヌードル' ] || ng "$LINENO"

out=$(./konndate 麺 汁なし アジア)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "パッタイ" ] || ng "$LINENO"

out=$(./konndate -h)
[ "$?" = 0 ] || ng "$LINENO"
echo "$out" | grep -q "使い方" || ng "$LINENO"

out=$(./konndate 肉 焼く 羊 2> /dev/null)
[ "$?" = 4 ] || ng "$LINENO"

out=$(./konndate 野菜 焼く 牛 2> /dev/null)
[ "$?" = 2 ] || ng "$LINENO"

out=$(./konndate 肉 焼く 2> /dev/null)
[ "$?" = 1 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res


