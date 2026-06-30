# Step 28：核心功能 3——使用統計

`cd ~/booking_system`{{execute}}

主管最愛問的問題之一：「這個月哪個會議室用最兇？」這一站我們用 Step 14 學過的 `awk` 來做統計。

## 🔹 先多新增幾筆資料，讓統計更有意義

`./scripts/add_booking.sh 2026-07-09 09:00-10:00 A會議室 陳小姐 業務部`{{execute}}

`./scripts/add_booking.sh 2026-07-09 13:00-14:00 A會議室 黃先生 業務部`{{execute}}

`./scripts/add_booking.sh 2026-07-10 09:00-10:00 C會議室 林先生 工程部`{{execute}}

確認目前累積的紀錄：

`cat data/bookings.csv`{{execute}}

## 🔹 統計每個會議室／設備被借用幾次

回想一下欄位順序：日期(1), 時段(2), 項目(3), 借用人(4), 部門(5), 登記時間(6), 狀態(7)。我們要統計的是「項目」欄，也就是第 3 欄。

因為第一行是表頭，不是真正的資料，統計時要用 `tail -n +2` 把表頭跳過（意思是「從第 2 行開始印」）：

`tail -n +2 data/bookings.csv | awk -F',' '{count[$3]++} END {for (item in count) print item, "：", count[item], "次"}'`{{execute}}

拆解一下：

- `count[$3]++`：用第 3 欄（項目名稱）當作「累加器」的名字，每讀到一行，對應的項目次數就 +1
- `END {for (item in count) print ...}`：全部讀完之後，把每個項目跟它累加到的次數都印出來

## 🔹 統計每個部門借用了幾次

部門是第 5 欄：

`tail -n +2 data/bookings.csv | awk -F',' '{count[$5]++} END {for (d in count) print d, "：", count[d], "次"}'`{{execute}}

## 🔹 寫成統計腳本

`nano scripts/stats_booking.sh`{{execute}}

輸入以下內容：

```bash
#!/bin/bash
echo "📊 各會議室／設備使用次數統計："
echo "----------------------------------------"
tail -n +2 data/bookings.csv | awk -F',' '{count[$3]++} END {for (item in count) print item, "：", count[item], "次"}'
echo ""
echo "📊 各部門借用次數統計："
echo "----------------------------------------"
tail -n +2 data/bookings.csv | awk -F',' '{count[$5]++} END {for (d in count) print d, "：", count[d], "次"}'
```

存檔離開，賦予執行權限並執行：

`chmod +x scripts/stats_booking.sh`{{execute}}

`./scripts/stats_booking.sh`{{execute}}

一行指令，馬上產出可以直接拿去開會報告的統計數字。

## ✅ 過關檢核

- [ ] 我已經理解 `tail -n +2` 是用來跳過表頭、只統計真正的資料行
- [ ] 我已經用 `awk` 統計出各會議室/設備的使用次數
- [ ] 我已經寫出 `stats_booking.sh`，一鍵產出完整統計報表

下一站，我們要做最後一個核心功能：取消借用——並且學會一個重要觀念，為什麼不該直接刪除紀錄。
