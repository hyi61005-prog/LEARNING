#!/usr/bin/env bash
# 本機開站：優先 Python http.server，其次可用其他靜態伺服。
# 用法：./Start-LocalSite.sh [port]
set -euo pipefail

PORT="${1:-8098}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
WEB="$ROOT/iis"

if [[ ! -d "$WEB" ]]; then
  echo "找不到 $WEB" >&2
  exit 1
fi

pick_python() {
  if command -v python3 >/dev/null 2>&1; then
    echo python3
  elif command -v python >/dev/null 2>&1; then
    echo python
  else
    return 1
  fi
}

echo "系統殼範本 · 本機站台"
echo "根目錄：$WEB"
echo "URL：http://localhost:${PORT}/"
echo "頁面：/  /ui-brief.html  /table-sys.html  /doc.html  /exec.html  /form.html"
echo "Ctrl+C 結束"
echo

if PY="$(pick_python)"; then
  cd "$WEB"
  exec "$PY" -m http.server "$PORT" --bind 127.0.0.1
fi

echo "未找到 Python。請安裝 python3，或用其他靜態伺服指向 iis/。" >&2
exit 1
