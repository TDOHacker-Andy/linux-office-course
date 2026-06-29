#!/bin/bash

# 切換到學員預設的家目錄
cd /root

# 建立前任行政留下的混亂資料夾結構
mkdir -p documents/reports/2025/
mkdir -p documents/.secret_room/

# 在一般資料夾放一些垃圾檔案干擾
touch documents/reports/2025/meeting_notes.txt
touch documents/reports/2025/office_supply_list.txt

# 在隱藏資料夾 .secret_room 裡面藏入年度預算表，並寫入密碼
echo "恭喜通關！本關密碼為：AdminSecure2026" > documents/.secret_room/年度預算表.txt

# 確保所有檔案行政人員（學員）都能讀取
chmod -R 755 /root/documents
