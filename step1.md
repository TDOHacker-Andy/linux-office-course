歡迎來到 Linux 的世界！這個黑底白字的視窗叫做 **Shell（命令列介面）**。不要被它空空的外表嚇到了，它其實就是一個「只聽指令辦事」的超高效祕書。

當主管把一堆混亂的檔案丟給你的時候，動手分類前，我們先按下一鍵下載，把戰場布置好，再用三個基本動作來摸清狀況。

---

### 🚀 任務啟動：一鍵生成業務部混亂專案
主管剛把混亂的檔案發過來了！請**用滑鼠點擊下方灰色方塊**，這行指令會自動在你的辦公桌上建立我們接下來幾關要用的所有檔案：

```bash
mkdir -p confusing_project/reports/2025 confusing_project/download && touch confusing_project/reports/2025/meeting_notes.txt confusing_project/reports/2025/office_supply_list.txt confusing_project/download/invoice_temp.csv && printf "ID,Name,Region,Sales\n1,Andy,Taipei,50000\n2,Bella,Hualien,12000\n3,Chris,Taichung,45000\n4,David,Kaohsiung,30000\n5,Eva,Hualien,8000\n6,Frank,Taipei,90000\n7,Grace,Tainan,15000\n8,Henry,Hualien,25000\n" > confusing_project/taiwan_customers.txt && for i in {1..200}; do echo "$((i+8)),User_$i,Taipei,$((RANDOM%50000+10000))" >> confusing_project/taiwan_customers.txt; echo "$((i+1000)),Hualien_User_$i,Hualien,$((RANDOM%30000+5000))" >> confusing_project/taiwan_customers.txt; done && echo "Andy,180hr,28800" > confusing_project/part_time_weekly_report.txt && echo "Bella,160hr,25600" >> confusing_project/part_time_weekly_report.txt && echo -e "\n🎉 【環境初始化成功！】\n主管交代的 confusing_project 資料夾已經送達你的辦公桌，請繼續往下閱讀講義。"
```{{execute}}


---

### 🔍 觀念打底：練習看懂畫面的「暗號」


在動手打字前，請先看看你右邊黑色視窗的最後一行，是不是長類似這樣：`root@ubuntu:~$ `

> * **`root`**：代表你目前登入的「使用者帳號名稱」。在 Linux 裡，root 是最大的超級管理員（就像公司總裁，擁有最高通行權）。
> * **`ubuntu`**：這台电脑（伺服器）的名字。
> * **`~`（波浪號）**：這代表你目前「人停留在你自己的個人資料夾（又叫家目錄）」。
> * **`$` 或 `#`**：這是一個權限符號。如果是 `$` 代表你是一般受限員工；如果是 `#` 則代表你是權限極大的管理員。

---


### 1. 檢查我的權限：我是誰？
在辦公室裡分清身分很重要。使用下方指令，確認你目前在系統裡的行政身分：

```bash
whoami
```{{execute}}

> root 這就是電腦回答你的答案，確認你現在是用管理員帳號在操作，接下來做任何設定都不會被系統阻攔。

### 2. 確認位置：我在哪裡？
雖然看到波浪號 `~` 知道在家目錄，但如果想知道目前在電腦裡的「絕對具體位置」，請輸入代表 Print Working Directory（列出工作目錄）的縮寫：

```bash
pwd
```{{execute}}

> 畫面上顯示的 `/root` 或 `/home`，就是你目前的「桌面位置」。

### 3. 清點檔案：這裡有什麼？
主管丟過來的專案資料在哪裡？我們用 `ls`這個指令來看有什麼檔案：

```bash
ls
```{{execute}}

> 💡 **這行指令代表什麼意思？**
> 它是 List（清單）的縮寫，意思是「請把這裡所有的東西列出來給我看」。
> 
> 按下後，請仔細觀察畫面上跳出來的字：
> * **藍色的字（例如 `confusing_project`）**：在 Linux 的預設畫面中，藍色代表它是一個「資料夾」，代表裡面還有其他檔案，我們可以走進去。
> * **白色的字**：代表它是一個「普通檔案」（例如一般的文字檔、圖片檔或試算表）。

---

你應該會看到一個叫做 `confusing_project`（混亂的專案）的資料夾。找到了！接下來，我們要施展空間瞬移跳進去。請點擊右下角按鈕進入下一步！
