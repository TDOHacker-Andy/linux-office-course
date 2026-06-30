#!/bin/bash
# ============================================================
# 「Linux 辦公室升級營」— Killercoda Foundation 腳本
# 本檔案請設定為「場景啟動時背景執行」，不要顯示給學員看，
# 它的工作是把整堂課（模組 A ~ G）會用到的練習素材準備好。
#
# 注意：期末專題（模組 H：會議室/設備借用登記系統）
#       是學員自己從零開始建立的，本腳本「不會」預先建立
#       booking_system 資料夾，這是刻意保留給學員自己動手規劃。
# ============================================================
set -e
cd /root

# ------------------------------------------------------------
# 練習場：office_drill
# ------------------------------------------------------------
mkdir -p office_drill/download
cd office_drill

# 客戶清單（CSV），稍後壓縮進 customers.zip，供 grep / awk 練習
cat > /tmp/taiwan_customers.txt << 'EOF'
姓名,城市,電話,業績金額
王小明,台北,0912345678,85000
陳美玲,花蓮,0922334455,42000
李大華,台中,0933445566,67000
張淑芬,花蓮,0944556677,53000
林志成,高雄,0955667788,91000
黃秀英,花蓮,0966778899,38000
吳建宏,台南,0977889900,72000
劉雅雯,花蓮,0988990011,46000
蔡明哲,新竹,0911223344,58000
楊麗華,花蓮,0922113344,61000
EOF
( cd download && zip -q customers.zip /tmp/taiwan_customers.txt -j )
rm -f /tmp/taiwan_customers.txt

# 沒有副檔名的「黑戶檔案」，其實是純文字會議記錄，供 file / cat / less 練習
cat > download/unknown_file << 'EOF'
[會議記錄] 2026/06/26 行政部週五例會
1. 本週加班申請共 7 件，待簽核。
2. 影印機耗材需於下週一前補貨。
3. 茶水間咖啡機故障，已通報總務。
4. 暑期實習生將於下週三報到，需準備帳號與電腦。
EOF

# 工讀生週報，內含多處「加班」字眼，供 sed 練習
cat > part_time_weekly_report.txt << 'EOF'
工讀生週報彙整
---------------
小美：本週加班 3 小時，協助整理客戶資料。
小強：本週加班 2 小時，支援活動布置。
小芳：本週無加班，準時完成日常文書工作。
小傑：本週加班 5 小時，加班原因為月底結算。
備註：加班申請請於隔週一前送出，逾期不予計算加班費。
EOF

# 給 cp / mv / rm 練習用的雜物資料夾
mkdir -p old_files
echo "這是一份已經過期、可以刪除的舊備忘錄。" > old_files/expired_memo.txt
echo "這是一份還在使用中的待辦清單。" > old_files/todo_list.txt

# 給 find / 萬用字元練習：散落在不同資料夾的同類型檔案
mkdir -p archive/2025_q4 archive/2025_q3
echo "2025 Q4 業績摘要" > archive/2025_q4/summary.log
echo "2025 Q3 業績摘要" > archive/2025_q3/summary.log
echo "2025 Q4 會議紀要" > archive/2025_q4/minutes.txt

# 給權限管理（chmod / sudo）練習用的共用資料夾
mkdir -p /tmp/share_box
chmod 1777 /tmp/share_box

cd /root
apt-get update -y -qq || true

echo "✅ 練習場 office_drill 已經準備完成，開始上課吧！"
