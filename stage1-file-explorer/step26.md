Step 26：核心功能 1——新增借用紀錄

cd ~/booking_system{{execute}}

🔹 第一步：手動新增一筆，理解原理

我們先不用腳本，純手動操作一次，搞懂背後的邏輯。假設業務部的陳小姐，要借用 7 月 6 日早上 9 點到 10 點的 A 會議室：

date '+%Y-%m-%d %H:%M:%S'{{execute}}

date 指令會印出目前系統的日期時間，等一下我們會把它當作「登記時間」自動記錄下來，不需要自己手動打。

現在手動把這筆借用，追加進 bookings.csv（記得用兩個角括號 >> 才是追加，不是覆蓋）：

echo "2026-07-06,09:00-10:00,A會議室,陳小姐,業務部,$(date '+%Y-%m-%d %H:%M:%S'),使用中" >> data/bookings.csv{{execute}}

確認結果：

cat data/bookings.csv{{execute}}

你應該會看到表頭下面多了一行剛剛登記的資料，最後一欄的時間是系統當下自動產生的，完全不用自己算。



💡 $(...) 這種寫法叫做「指令替換」，意思是「先執行括號裡的指令，把結果當成文字塞進這個位置」。所以 $(date '+%Y-%m-%d %H:%M:%S') 會先被換成當下的日期時間，再整行一起被 echo 寫進檔案。

🔹 第二步：寫成一個可重複使用的腳本

手動打這麼長一行指令很容易出錯，我們把它包裝成腳本，以後只要打一個簡短的指令就能完成：

nano scripts/add_booking.sh{{execute}}

請輸入以下內容：

#!/bin/bash
# 用法：./add_booking.sh 日期 時段 項目 借用人 部門
DATE=$1
TIME=$2
ITEM=$3
NAME=$4
DEPT=$5
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "$DATE,$TIME,$ITEM,$NAME,$DEPT,$TIMESTAMP,使用中" >> data/bookings.csv
echo "✅ 借用登記成功：$DATE $TIME $ITEM（借用人：$NAME，$DEPT）"

存檔離開（Ctrl+O → Enter → Ctrl+X）。

拆解一下這段腳本：





$1 $2 $3 $4 $5：分別代表你執行腳本時，依序給的「第 1、2、3、4、5 個參數」



中間組裝出一行資料，用 >> 追加進 bookings.csv



最後印出一行確認訊息，讓使用者知道登記成功

🔹 賦予執行權限，並實際使用

chmod +x scripts/add_booking.sh{{execute}}

現在試著用這個腳本，幫工程部的林先生登記 7 月 7 日下午的 B 會議室：

./scripts/add_booking.sh 2026-07-07 14:00-15:00 B會議室 林先生 工程部{{execute}}

確認結果：

cat data/bookings.csv{{execute}}

是不是只要一行簡短指令，就能完成一筆完整的登記？再多練習新增一筆，鞏固一下：

./scripts/add_booking.sh 2026-07-08 10:00-11:00 投影機01 王小姐 行銷部{{execute}}

✅ 過關檢核





我理解 >> 是「追加」而不是「覆蓋」



我理解 $(date ...) 可以把指令的執行結果塞進文字裡



我已經寫出 add_booking.sh，並理解 $1 $2 $3... 代表執行時給的參數



我已經成功用腳本新增至少 2 筆借用紀錄

下一站，我們要做「查詢」功能——讓你或同事能快速找到特定的借用紀錄。
