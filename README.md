# 系統殼範本（LEARNING）

內網工具感的 demo：TABLE 驅動可點殼 ＋ 畫面溝通板（跟 AI 說畫面）。假資料。

## 立刻開網頁（不用設定）

用 jsDelivr 直接開 GitHub 上的檔案：

**https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/index.html**

| 頁面 | 連結 |
|------|------|
| 首頁 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/index.html |
| ★畫面溝通板 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/ui-brief.html |
| TABLE 驅動 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/table-sys.html |
| 單據殼 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/doc.html |
| 執行監控 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/exec.html |
| 表單簽核 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/form.html |
| Má phanh (phân bố đều) | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@main/iis/brake-pad.html |

## GitHub Pages（較短網址，需一次設定）

目標：https://hyi61005-prog.github.io/LEARNING/

1. 合併 [PR #1](https://github.com/hyi61005-prog/LEARNING/pull/1)
2. 開 https://github.com/hyi61005-prog/LEARNING/settings/pages  
   → **Source** 選 **GitHub Actions**
3. 到 Actions 重跑 **Deploy GitHub Pages**（或再 push 一次）

## 本機開站（可選）

```powershell
.\Start-LocalSite.ps1 -Port 8098
```

```bash
./Start-LocalSite.sh 8098
```

本機：http://localhost:8098/

## 約束

假資料；不連公司內網／正式庫／SAP；不寫對外信。詳見 `HANDOFF.txt`。

## 英文／多益（2026-10-06）

- 故事單字（一句英一句中・點選）：https://hyi61005-prog.github.io/LEARNING/story.html
- 多益選擇題：https://hyi61005-prog.github.io/LEARNING/english.html
- 知識庫（給手機 Cursor）：`kb/english/INDEX.md`
- 題庫 JSON：`iis/kb/english-drills.json`、`iis/kb/english-story.json`

定位約 600–700；弱點＝時態／固定搭配／自然回信。目標 900+。