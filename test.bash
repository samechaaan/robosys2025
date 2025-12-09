#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kanon Ode
# SPDX-License-Identifier: GPL-3.0-only

ng () {
      echo "${1}行目が違うよ"
      res=1
}

res=0

out=$(echo 2026 | python3 gengo.py)
[ "${out}" = "不明" ] || ng "$LINENO"

out=$(echo 2025 | python3 gengo.py)
[ "${out}" = "令和7年" ] || ng "$LINENO"

out=$(echo 2019 | python3 gengo.py)
[ "${out}" = "令和元年" ] || ng "$LINENO"

out=$(echo 1989 | python3 gengo.py)
[ "${out}" = "平成元年" ] || ng "$LINENO"

out=$(echo 1926 | python3 gengo.py)
[ "${out}" = "昭和元年" ] || ng "$LINENO"

out=$(echo 1868 | python3 gengo.py)
[ "${out}" = "明治元年" ] || ng "$LINENO"

out=$(echo 1867 | python3 gengo.py)
[ "${out}" = "明治以前" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
