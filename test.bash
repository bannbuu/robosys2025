#!/bin/bash

ng () {
    echo ${1}行目が違うよ
    res=1              # エラーが見つかったら res を1にする
}

res=0                 # 最初は「問題なし」=0
a=山田
[ "$a" = 上田 ] || ng "$LINENO"   # ↑のテストが失敗したら ng を呼ぶ
[ "$a" = 山田 ] || ng "$LINENO"

exit $res             # このシェルスクリプトの終了ステータスとして res を返す

