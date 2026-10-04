# 系統殼範本（LEARNING）

內網工具感的 demo：TABLE 驅動可點殼 ＋ 畫面溝通板（跟 AI 說畫面）。假資料。

## 立刻開網頁（不用設定）

用 jsDelivr 直接開 GitHub 上的檔案：

**https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@cursor/system-shell-demo-f309/iis/index.html**

| 頁面 | 連結 |
|------|------|
| 首頁 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@cursor/system-shell-demo-f309/iis/index.html |
| ★畫面溝通板 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@cursor/system-shell-demo-f309/iis/ui-brief.html |
| TABLE 驅動 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@cursor/system-shell-demo-f309/iis/table-sys.html |
| 單據殼 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@cursor/system-shell-demo-f309/iis/doc.html |
| 執行監控 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@cursor/system-shell-demo-f309/iis/exec.html |
| 表單簽核 | https://cdn.jsdelivr.net/gh/hyi61005-prog/LEARNING@cursor/system-shell-demo-f309/iis/form.html |

> 合併進 `main` 後，可把網址裡的 `@cursor/system-shell-demo-f309` 改成 `@main`。

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
