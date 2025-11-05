#!/bin/bash
# SPDX-FileCopyrightText: 2025 Ryuichi Ueda 　　　　　
# SPDX-License-Identifier: GPL-3.0-only

ng () {
        echo ${1}行目が違うよ
        res=1                   #追加
}

res=0

out(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK #通ったのが（人間に）分かるように表示

exit $res     # このシェルスクリプトの終了ステータスを返して終了
