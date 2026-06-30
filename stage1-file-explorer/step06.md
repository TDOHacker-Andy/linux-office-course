# Step 6：建立資料夾——mkdir

從這一站開始，我們正式進入「檔案與目錄操作」模組。這是整堂課使用頻率最高的指令家族，請務必紮實練習。

先確認一下你的位置：

`pwd`{{execute}}

如果不是在 `/root/office_drill`，先切換過去：

`cd ~/office_drill`{{execute}}

## 🔹 指令：mkdir（建立單一資料夾）

`mkdir` 是 *Make Directory*（建立目錄）的縮寫：

`mkdir test_folder`{{execute}}

確認一下：

`ls`{{execute}}

## 🔹 一次建立多層巢狀資料夾：-p

假設你要建立 `2026年度 → 第一季 → 一月` 這種三層的資料夾結構，如果一層一層手動建立會很麻煩。加上 `-p`（*parents*，連同上層一起建立）：

`mkdir -p projects_2026/q1/january`{{execute}}

確認一下三層結構都建好了：

`ls projects_2026/q1`{{execute}}

> ⚠️ **沒加 `-p` 會發生什麼事？** 如果你直接打 `mkdir projects_2026/q1/january`，而 `projects_2026` 跟 `q1` 都還不存在，系統會回報錯誤 `No such file or directory`，因為它不知道要把 `january` 放進哪裡。`-p` 的意思就是「上層不存在的話，順便幫我建好」。

## 🔹 進階技：一次建立多個同類型資料夾

還記得這個課程一開始提過的「一秒生出 12 個月份資料夾」嗎？我們現在來試試看：

`mkdir month_{01..12}`{{execute}}

確認成果：

`ls -d month_*`{{execute}}

`{01..12}` 這種寫法叫做 **Brace Expansion（大括號展開）**，Shell 會自動把它展開成 `01 02 03 ... 12`，再一次丟給 `mkdir` 執行，等於一行指令做了 12 次「新增資料夾」。

## ✅ 過關檢核

- [ ] 我已經用 `mkdir` 建立一個資料夾
- [ ] 我已經用 `mkdir -p` 一次建立三層巢狀資料夾
- [ ] 我已經用 `mkdir 名稱_{01..12}` 一次建立 12 個資料夾

下一站，我們要學會在資料夾裡放進真正的「檔案」。
