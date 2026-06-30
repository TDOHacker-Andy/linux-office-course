# Step 29：核心功能 4——取消借用（並保留稽核紀錄）

`cd ~/booking_system`{{execute}}

假設業務部的陳小姐臨時取消了 7 月 9 日早上的 A 會議室。直覺的做法可能是「把那一行刪掉」，但這其實是一個不太好的習慣。

## 🤔 為什麼不要直接刪除，而是「標記」取消？

如果直接刪除，未來完全沒有辦法回答「上個月被取消的借用有幾筆？是誰常常取消？」這種問題。更好的做法是：**保留這筆紀錄，只是把狀態欄從「使用中」改成「已取消」。** 這在企業實務上叫做**稽核軌跡（Audit Trail）**——任何重要紀錄的異動，都應該留下痕跡，而不是憑空消失。

## 🔹 第一步：先備份，這是不能跳過的步驟

任何要修改重要資料檔的操作前，先備份（複習 Step 9 的 `cp`）：

`cp data/bookings.csv backup/bookings_$(date '+%Y%m%d_%H%M%S').csv`{{execute}}

確認備份檔已經產生：

`ls backup`{{execute}}

> 💡 注意這裡又出現了 `$(date ...)`，這次我們把它用在檔名裡，讓每一份備份檔都有獨一無二、看了就知道時間的檔名。

## 🔹 第二步：找出要取消的那一行是第幾行

`grep -n "2026-07-09,09:00-10:00,A會議室" data/bookings.csv`{{execute}}

`-n` 這個選項會在每一行結果前面加上「行號」，例如顯示 `4:2026-07-09,...`，代表這筆資料在檔案的第 4 行。**請記住這個行號，等一下要用到。**

## 🔹 第三步：用 sed 指定行號，精準修改那一行

假設剛剛查到的行號是 `4`（請依照你自己畫面上實際顯示的行號替換掉下面指令裡的數字）：

`sed -i '4s/使用中/已取消/' data/bookings.csv`{{execute}}

拆解語法：`'4s/舊字串/新字串/'` 比 Step 15 學過的 `'s/舊字串/新字串/g'` 多了一個開頭的 `4`，意思是「只對第 4 行做這個取代」，而不是整份檔案的每一行都換，這樣才不會誤改到其他筆資料。

確認結果：

`cat data/bookings.csv`{{execute}}

你應該會看到那一筆資料還在，只是最後的狀態欄從「使用中」變成「已取消」。

## 🔹 寫成取消腳本

`nano scripts/cancel_booking.sh`{{execute}}

輸入以下內容：

```bash
#!/bin/bash
# 用法：./cancel_booking.sh "用來比對的關鍵字（建議用日期,時段,項目）"
KEYWORD=$1
cp data/bookings.csv backup/bookings_$(date '+%Y%m%d_%H%M%S').csv
LINE=$(grep -n "$KEYWORD" data/bookings.csv | head -1 | cut -d: -f1)
if [ -z "$LINE" ]; then
  echo "❌ 找不到符合「$KEYWORD」的借用紀錄。"
else
  sed -i "${LINE}s/使用中/已取消/" data/bookings.csv
  echo "✅ 已將第 $LINE 行的借用紀錄標記為「已取消」。"
fi
```

存檔離開，賦予執行權限：

`chmod +x scripts/cancel_booking.sh`{{execute}}

實際測試取消另一筆（7 月 10 日的 C 會議室）：

`./scripts/cancel_booking.sh "2026-07-10,09:00-10:00,C會議室"`{{execute}}

`cat data/bookings.csv`{{execute}}

## 🔹 查詢「目前還有效」的借用（排除已取消）

複習 Step 13 學過的 `grep -v`：

`grep -v "已取消" data/bookings.csv`{{execute}}

這樣就能只看到「真正還在使用中」的借用，已取消的紀錄不會出現干擾，但它們依然完整保留在檔案裡，供未來查核使用。

## ✅ 過關檢核

- [ ] 我已經理解「標記取消」比「直接刪除」更符合稽核需求
- [ ] 我已經在修改前先做了備份
- [ ] 我已經用 `grep -n` 找出行號，並用 `sed` 精準修改特定那一行
- [ ] 我已經寫出 `cancel_booking.sh`，並成功測試取消一筆借用
- [ ] 我已經用 `grep -v "已取消"` 篩選出仍然有效的借用紀錄

四個核心功能都做完了！下一站，我們要幫這份重要的資料檔，加上適當的權限保護。
