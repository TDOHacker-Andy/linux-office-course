# Step 31：實測——模擬同事帳號的操作體驗

`cd ~/booking_system`{{execute}}

這一站，我們複習 Step 19、20 學過的 `useradd` 跟 `su`，建立一個模擬的同事帳號，實際驗證上一站設定的權限有沒有真的生效。

## 🔹 建立模擬同事帳號

`sudo useradd -m staff_demo`{{execute}}

`sudo passwd staff_demo`{{execute}}

依照提示設定一組練習密碼（例如 `Staff2026!`，兩次輸入要一致）。

## 🔹 切換成這個同事的身分

`su - staff_demo`{{execute}}

輸入剛剛設定的密碼登入。

## 🔹 測試 1：同事可以「查詢」嗎？

`cat /root/booking_system/data/bookings.csv`{{execute}}

應該可以成功看到完整內容——因為 Step 30 設定的 `644` 允許其他人讀取，這符合我們希望「同事能自己查詢確認」的設計。

## 🔹 測試 2：同事可以「直接竄改」資料嗎？

嘗試直接寫入一筆假資料：

`echo "亂改的資料" >> /root/booking_system/data/bookings.csv`{{execute}}

你應該會看到 `Permission denied`（權限被拒絕）。這證明了 Step 30 的權限設計確實生效：**同事可以看，但不能繞過系統直接竄改紀錄。**

## 🔹 測試 3：同事可以執行查詢腳本嗎？

`/root/booking_system/scripts/search_booking.sh 業務部`{{execute}}

應該可以正常執行並看到結果——因為 Step 30 把 `scripts` 設成 `755`，允許其他人讀取並執行（但不能修改腳本內容本身）。

## 🔹 回到管理者身分

`exit`{{execute}}

`whoami`{{execute}}

## 📋 小結：這套權限設計達成了什麼？

| 角色 | 查詢 | 新增/取消 | 修改腳本邏輯 | 動備份檔 |
|---|---|---|---|---|
| 你（管理者） | ✅ | ✅ | ✅ | ✅ |
| 一般同事 | ✅ | ❌ | ❌ | ❌ |

這正是企業實務上常見的**最小權限原則（Principle of Least Privilege）**：每個人只擁有完成自己工作所必需的最小權限，不多不少。

## ✅ 過關檢核

- [ ] 我已經建立模擬同事帳號 `staff_demo` 並成功登入
- [ ] 我已經驗證同事可以讀取借用紀錄
- [ ] 我已經驗證同事無法直接竄改資料（出現 Permission denied）
- [ ] 我已經驗證同事可以正常執行查詢腳本
- [ ] 我已經理解「最小權限原則」的意義

最後一站，我們要把所有功能整合成一個選單系統，讓操作變得更專業、更不容易出錯，並學會怎麼跟主管展示這個成果。
