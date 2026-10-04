# 系統殼範本（LEARNING）

內網工具感的本機 demo：用 TABLE 驅動做出可點的殼，並用畫面溝通板快速跟 AI 說畫面。

## 開站

```powershell
# Windows
.\Start-LocalSite.ps1 -Port 8098
```

```bash
# Linux / macOS
chmod +x Start-LocalSite.sh
./Start-LocalSite.sh 8098
```

開啟：<http://localhost:8098/>

## 頁面

| 路徑 | 用途 |
|------|------|
| `/` | 首頁 |
| `/ui-brief.html` | ★畫面溝通板（選殼→短欄→線框→複製口令） |
| `/table-sys.html` | FieldDef／ActionDef 驅動 |
| `/doc.html` | 單據：表頭＋明細＋過帳／反沖 |
| `/exec.html` | 執行監控：Job＋Audit＋重跑 |
| `/form.html` | 表單簽核：Status＋角色 |

## 產品共識（摘要）

- 表單／單據／執行本質相同：提出→等待→通過或失敗→結束
- SAP 味＝多張關聯 TABLE
- 過帳／權限／稽核都用表解（見 `HANDOFF.txt`）

## 約束

假資料；不連公司內網／正式庫／SAP；不寫對外信。
