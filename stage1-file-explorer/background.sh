#!/bin/bash

# 1. 建立第一關「大量檔案分類」的混亂專案戰場
mkdir -p /root/confusing_project/reports/2025/
mkdir -p /root/confusing_project/download/

# 在裡面放一些前任留下來的雜物檔案
touch /root/confusing_project/reports/2025/meeting_notes.txt
touch /root/confusing_project/reports/2025/office_supply_list.txt
touch /root/confusing_project/download/invoice_temp.csv

# 2. 預先佈置第二關的大魔王：全台客戶混亂文字報表 (塞入包含 Hualien 的上千行假資料)
cat << 'EOF' > /root/confusing_project/taiwan_customers.txt
ID,Name,Region,Sales
1,Andy,Taipei,50000
2,Bella,Hualien,12000
3,Chris,Taichung,45000
4,David,Kaohsiung,30000
5,Eva,Hualien,8000
6,Frank,Taipei,90000
7,Grace,Tainan,15000
8,Henry,Hualien,25000
EOF

# 模擬大量數據：用迴圈複製大量假資料，讓學員用滑鼠絕對滾不完
for i in {1..500}; do
  echo "$((i+8)),User_$i,Taipei,$((RANDOM%50000+10000))" >> /root/confusing_project/taiwan_customers.txt
  echo "$((i+1000)),Hualien_User_$i,Hualien,$((RANDOM%30000+5000))" >> /root/confusing_project/taiwan_customers.txt
done

# 3. 預先佈置第三關要鎖上的機密：工讀生時報表
echo "王小明,180hr,28800元" > /root/confusing_project/工讀生時報表.txt
echo "李小美,160hr,25600元" >> /root/confusing_project/工讀生時報表.txt

# 4. 確保一開始權限都是開著的 (644/755)，等著學員後面用 chmod 去鎖它
chmod -R 755 /root/confusing_project
