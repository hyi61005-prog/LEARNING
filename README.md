# 系統殼範本（LEARNING）

內網工具感的本機／GitHub Pages demo：用 TABLE 驅動做出可點的殼，並用畫面溝通板快速跟 AI 說畫面。

## 直接開網頁（GitHub Pages）

網址（部署後）：

**https://hyi61005-prog.github.io/LEARNING/**

### 第一次要開一次設定（約 30 秒）

1. 合併 PR 到 `main`（或先用目前分支也會觸發 workflow）
2. 開：https://github.com/hyi61005-prog/LEARNING/settings/pages
3. **Build and deployment → Source** 選 **GitHub Actions**
4. 等 Actions 跑完（綠色），再開上面網址

常用頁：

| 頁面 | 網址 |
|------|------|
| 首頁 | https://hyi61005-prog.github.io/LEARNING/ |
| 畫面溝通板 | https://hyi61005-prog.github.io/LEARNING/ui-brief.html |
| TABLE 驅動 | https://hyi61005-prog.github.io/LEARNING/table-sys.html |
| 單據殼 | https://hyi61005-prog.github.io/LEARNING/doc.html |
| 執行監控 | https://hyi61005-prog.github.io/LEARNING/exec.html |
| 表單簽核 | https://hyi61005-prog.github.io/LEARNING/form.html |

## 本機開站（可選）

```powershell
# Windows
.\Start-LocalSite.ps1 -Port 8098
```

```bash
# Linux / macOS
chmod +x Start-LocalSite.sh
./Start-LocalSite.sh 8098
```

本機：http://localhost:8098/

## 產品共識（摘要）

- 表單／單據／執行本質相同：提出→等待→通過或失敗→結束
- SAP 味＝多張關聯 TABLE
- 過帳／權限／稽核都用表解（見 `HANDOFF.txt`）

## 約束

假資料；不連公司內網／正式庫／SAP；不寫對外信。
