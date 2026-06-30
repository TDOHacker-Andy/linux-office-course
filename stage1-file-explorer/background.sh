#!/bin/bash

# 定義我們要建立的目標路徑（兩個地方都建，確保 ls 一定看得到）
PATHS=("/root/confusing_project" "/filesystem/root/confusing_project")

for TARGET_DIR in "${PATHS[@]}"; do
    # 建立第一關的專案戰場
    mkdir -p "${TARGET_DIR}/reports/2025"
    mkdir -p "${TARGET_DIR}/download"

    # 放入前任留下來的雜物檔案
    touch "${TARGET_DIR}/reports/2025/meeting_notes.txt"
    touch "${TARGET_DIR}/reports/2025/office_supply_list.txt"
    touch "${TARGET_DIR}/download/invoice_temp.csv"

    # 佈置第二關的大魔王：全台客戶文字報表
    cat << 'EOF' > "${TARGET_DIR}/taiwan_customers.txt"
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

    # 複製大量假資料
    for i in {1..200}; do
      echo "$((i+8)),User_$i,Taipei,$((RANDOM%50000+10000))" >> "${TARGET_DIR}/taiwan_customers.txt"
      echo "$((i+1000)),Hualien_User_$i,Hualien,$((RANDOM%30000+5000))" >> "${TARGET_DIR}/taiwan_customers.txt"
    done

    # 佈置第三關要鎖上的機密：工讀生時報表
    echo "王小明,180hr,28800元" > "${TARGET_DIR}/工讀生時報表.txt"
    echo "李小美,160hr,25600元" >> "${TARGET_DIR}/工讀生時報表.txt"

    # 權限全開
    chmod -R 755 "$TARGET_DIR"
done
