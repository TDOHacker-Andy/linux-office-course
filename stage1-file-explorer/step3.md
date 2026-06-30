# 📂 步驟三：檔案大搬家 —— 複製、移動與斷捨離

走進 `confusing_project` 房間後，看到亂成一團的檔案，身為行政救火隊的你眉頭一皺，發現事情並不簡單：
1. 剛剛下載區的發票暫存檔 `download/invoice_temp.csv` 應該要歸檔。
2. 兼職工讀生的週報表 `part_time_weekly_report.txt` 需要備份一份到一月份的資料夾。
3. 沒用的暫存垃圾需要清理。

我們用三個終端機搬家神技，一秒還原乾淨的辦公桌！

---

### 1. 移動檔案（Move）：把發票歸檔
以前我們要用滑鼠拖曳檔案，現在用 `mv`（Move）指令，直接把下載區的發票暫存檔，移動到我們剛剛建立的 `project_January`（一月專案）資料夾裡：

```bash
mv download/invoice_temp.csv project_January/
```{{execute}}

> 💡 **小秘訣：**
> 移動完後，你可以輸入 `ls project_January/` 來偷看裡面，發票是不是已經乖乖躺在裡面了？

---

### 2. 複製檔案（Copy）：備份工讀生報表
主管交代：*「工讀生的報表很重要，請複製一份到一月份的資料夾當作備份！」*
我們使用 `cp`（Copy）指令，它需要兩個參數：「你要複製誰」以及「你要複製到哪裡」：

```bash
cp part_time_weekly_report.txt project_January/backup_report.txt
```{{execute}}

> 💡 **這行指令代表什麼意思？**
> 這代表我們把原本在外面的 `part_time_weekly_report.txt` 複製了一份，放進 `project_January` 資料夾內，並且順便幫它改名叫 `backup_report.txt`。原本外面的檔案依然完好如初哦！

---

### 3. 刪除檔案（Remove）：清除沒用的下載資料夾
既然下載區 `download` 裡面的發票已經移走了，這個空資料夾留在桌上看了就礙眼。在 Linux 中，刪除「空資料夾」我們使用 `rmdir`（Remove Directory）：

```bash
rmdir download
```{{execute}}

> ⚠️ **威力強大的行政碎紙機 `rm`：**
> 如果你要刪除的是「一般檔案」，要使用的是 `rm 檔案名稱`。
> **請注意：** Linux 的碎紙機是沒有「垃圾桶」概念的，一旦按下 Enter 檔案就會從世界上徹底消失，操作時一定要保持清醒哦！

---

### 🏁 第二關任務達成！
你已經學會了 Linux 檔案管理的必殺技 `mv`、`cp` 與 `rm`！辦公桌在你的整理下變得井井有條。

請點擊右下角 **NEXT** 按鈕，主管正準備交給你一項更核心的「大數據搜查任務」！
