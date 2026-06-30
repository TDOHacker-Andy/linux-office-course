#!/bin/bash
apt-get update && apt-get install -y zip
# 確保目錄存在
mkdir -p /root/confusing_project/reports/2025
mkdir -p /root/confusing_project/download

# 建立模擬的報表與客戶檔案
printf "ID,Name,Region,Sales\n1,Andy,Taipei,50000\n2,Bella,Hualien,12000\n3,Chris,Taichung,45000\n" > /root/confusing_project/taiwan_customers.txt
echo "Andy,180hr,28800,加班" > /root/confusing_project/part_time_weekly_report.txt
echo "Bella,160hr,25600,未加班" >> /root/confusing_project/part_time_weekly_report.txt

# 建立一個隱藏內容的神秘檔案
echo "Secret_Key_2026" > /root/confusing_project/download/unknown_file

# 建立一個空資料夾供後續測試
mkdir -p /root/confusing_project/empty_folder

# 處理壓縮檔測試
zip -qj /root/confusing_project/download/customers.zip /root/confusing_project/taiwan_customers.txt

# 給個提示，讓後台確認完成
echo "---環境初始化完成---"
