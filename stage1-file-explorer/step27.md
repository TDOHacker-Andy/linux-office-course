# Step 27：核心功能 2——查詢借用紀錄

`cd ~/booking_system`{{execute}}

現在借用紀錄已經有好幾筆了，主管隨口問一句：「B會議室最近被誰借走了？」我們要能立刻查得到。

## 🔹 直接用 grep 查詢

複習一下 Step 13 學過的 `grep`：

`grep "B會議室" data/bookings.csv`{{execute}}

馬上就能看到所有跟 B 會議室相關的借用紀錄。

## 🔹 寫成查詢腳本，讓查詢更方便

`nano scripts/search_booking.sh`{{execute}}

輸入以下內容：

```bash
#!/bin/bash
# 用法：./search_booking.sh 關鍵字
KEYWORD=$1
echo "🔍 查詢「$KEYWORD」的相關借用紀錄："
echo "----------------------------------------"
grep "$KEYWORD" data/bookings.csv
```

存檔離開，並賦予執行權限：

`chmod +x scripts/search_booking.sh`{{execute}}

## 🔹 實際使用

查詢所有跟「業務部」相關的借用：

`./scripts/search_booking.sh 業務部`{{execute}}

查詢所有跟「投影機01」相關的借用：

`./scripts/search_booking.sh 投影機01`{{execute}}

## 🔹 進階：查詢「特定日期」的所有借用狀況

因為我們的資料第一欄就是日期，可以直接用日期當關鍵字查詢：

`./scripts/search_booking.sh 2026-07-06`{{execute}}

這樣主管問「7 月 6 號那天會議室借用狀況」，你可以立刻給出完整答案，而不用翻紙本記錄。

## ✅ 過關檢核

- [ ] 我已經理解可以直接用 `grep` 對 `bookings.csv` 做查詢
- [ ] 我已經寫出 `search_booking.sh`，能依任何關鍵字（會議室、部門、日期）查詢
- [ ] 我已經實際測試過至少 2 種不同條件的查詢

下一站，我們要做「統計」功能——算出每個會議室、每個部門的使用次數。
