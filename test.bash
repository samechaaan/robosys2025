#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kanon Ode
# SPDX-License-Identifier: GPL-3.0-only

export PYTHONIOENCODING=utf-8

ng () {
      echo "${1}行目が違うよ"
      echo "  期待した答え: [${2}]"
      echo "  Pythonの答え: [${out}]"
      res=1
}

res=0

# --- テスト実行（jp_calendar.py を呼び出すように変更！） ---

out=$(echo 2026 | python3 jp_calendar | tr -d '\r')
[ "${out}" = "不明" ] || ng "$LINENO" "不明"

out=$(echo 2025 | python3 jp_calendar | tr -d '\r')
[ "${out}" = "令和7年" ] || ng "$LINENO" "令和7年"

out=$(echo 2019 | python3 jp_calendar | tr -d '\r')
[ "${out}" = "令和元年" ] || ng "$LINENO" "令和元年"

out=$(echo 1989 | python3 jp_calendar | tr -d '\r')
[ "${out}" = "平成元年" ] || ng "$LINENO" "平成元年"

out=$(echo 1926 | python3 jp_calendar | tr -d '\r')
[ "${out}" = "昭和元年" ] || ng "$LINENO" "昭和元年"

out=$(echo 1868 | python3 jp_calendar | tr -d '\r')
[ "${out}" = "明治元年" ] || ng "$LINENO" "明治元年"

out=$(echo 1867 | python3 jp_calendar | tr -d '\r')
[ "${out}" = "明治以前" ] || ng "$LINENO" "明治以前"

# --- 結果判定 ---
[ "$res" = 0 ] && echo OK
exit $res
