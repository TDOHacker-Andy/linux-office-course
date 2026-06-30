# Step 1: 確認帳號與路徑

歡迎來到「辦公室自動化實戰」！在開始處理那些複雜的報表前，我們先確認一下你的工作環境，並建立必要的練習檔案。

### 1. 建立練習環境
請複製並執行以下指令，系統會為你自動建立這次任務所需的完整專案目錄與練習素材：

```bash
# 建立完整的目錄架構
mkdir -p ~/confusing_project/reports/2025
mkdir -p ~/confusing_project/reports/2026
mkdir -p ~/confusing_project/download
mkdir -p ~/confusing_project/temp_trash

# 生成各關卡需要的練習檔案
printf "ID,Name,Region,Sales\n1,Andy,North,5000\n2,Bob,South,3000\n3,Charlie,East,4500" > ~/confusing_project/reports/2025/sales_data.csv
printf "ID,Name,Region,Sales\n4,David,North,7000\n5,Eve,West,2000" > ~/confusing_project/reports/2026/sales_data_new.csv
touch ~/confusing_project/download/backup_old.tar.gz
touch ~/confusing_project/temp_trash/useless_1.log
touch ~/confusing_project/temp_trash/useless_2.tmp
touch ~/confusing_project/temp_trash/important_notes.txt

2. 環境確認與教學練習
現在環境已經準備好了，讓我們確認你是否已經準備好開始課程：
請在下方的終端機輸入以下指令進行確認：
確認你是誰：
輸入 whoami，確認系統識別的帳號。
看看你在哪裡：
輸入 pwd，查看目前的目錄路徑。
查看這裡有什麼：
輸入 ls -R ~/confusing_project，檢查剛剛建立的檔案與目錄結構是否都已到位。
💡 小提示：如果你成功列出了 confusing_project 下的所有資料夾，恭喜你，你已經完成了最基礎的環境設置，準備好進入下一關挑戰「檔案清點與識破」了！
