# Step 15：一次取代千百字——sed

人資部要求：之後所有週報裡，「加班」一律要改成「已發放加班費」，以符合最新的內部用語規範。如果用 Word 打開逐字 Ctrl+H，遇到大檔案常常會卡頓，而且沒辦法一次處理幾百份檔案。

## 🔹 操作前，先養成備份的好習慣

`sed` 預設可以直接修改原始檔案內容，動手前我們先備份一份（複習一下 Step 9 學的 `cp`）：

`cp part_time_weekly_report.txt part_time_weekly_report_before_sed.txt`{{execute}}

## 🔹 指令：sed——串流編輯器

`sed` 是 *Stream Editor*（串流編輯器）的縮寫，專門用來做文字的批次處理。先看一下原始內容：

`cat part_time_weekly_report.txt`{{execute}}

現在執行全域取代：

`sed -i 's/加班/已發放加班費/g' part_time_weekly_report.txt`{{execute}}

確認結果：

`cat part_time_weekly_report.txt`{{execute}}

## 🔹 拆解 sed 的語法

`sed -i 's/加班/已發放加班費/g' 檔名`

- `-i`：*in-place*，直接修改原始檔案本身（不加這個選項的話，`sed` 只會把結果印在螢幕上，不會真的改動檔案）
- `'s/舊字串/新字串/g'`：這是 `sed` 最常用的替換語法
  - `s`：代表 *substitute*（替換）
  - `/加班/`：要被取代的舊字串
  - `/已發放加班費/`：取代後的新字串
  - `g`：*global*，代表整份檔案裡每一處都要換，如果沒加 `g`，每一行只會換掉第一個出現的地方

## 🔹 對照備份檔，確認差異

`cat part_time_weekly_report_before_sed.txt`{{execute}}

對照剛剛已經被取代過的 `part_time_weekly_report.txt`，你可以清楚看到差異——一行指令，瞬間完成原本要在 Word 裡逐字找、逐字改的苦工。

> ⚠️ **重要提醒**：`-i` 會直接覆蓋原始檔案，沒有確認視窗。所以正式操作前，**先備份一份再執行 `sed -i`**，是非常重要的職場安全習慣，這跟 Step 11 學的「刪除前先確認」是同一種紀律。

## ✅ 過關檢核

- [ ] 我已經在執行 `sed -i` 之前，先備份了原始檔案
- [ ] 我已經用 `sed -i 's/舊字串/新字串/g'` 完成全域取代
- [ ] 我已經理解 `g` 的作用：取代「每一處」而不只是「每行第一個」

「文字處理」模組到這裡完成了！接下來模組 E，我們要進入「權限管理」——學會保護重要檔案，不讓不該看到的人看到。
