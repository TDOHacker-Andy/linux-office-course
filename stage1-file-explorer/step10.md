# Step 10：搬家與改名——mv

## 🔹 用法 1：搬移檔案到別的資料夾

`mv` 是 *Move*（移動）的縮寫：

`mv old_files/expired_memo.txt test_folder/`{{execute}}

確認一下：原本的位置已經沒有這份檔案了，它真的「搬家」了：

`ls old_files`{{execute}}

`ls test_folder`{{execute}}

> 💡 跟 `cp` 最大的不同：`cp` 是「複製一份」，原地還留著；`mv` 是「整個搬走」，原地不會再有這份檔案。

## 🔹 用法 2：mv 也能拿來「改名」

這是很多新手不知道的小知識：Linux 沒有專門的「改名」指令，**改名其實就是「搬到同一個資料夾、但換一個名字」**：

`mv test_folder/my_first_file.txt test_folder/my_renamed_file.txt`{{execute}}

確認一下：

`ls test_folder`{{execute}}

你會發現 `my_first_file.txt` 不見了，取而代之的是 `my_renamed_file.txt`——其實它只是被「移動」到「同一個地方、新的名字」而已。

## 🔹 用法 3：搬移整個資料夾

跟 `cp` 不同，`mv` 搬移資料夾**不需要**加 `-r`，因為「搬家」本來就是把整個東西原封不動地搬走，不會有「只搬一部分」的問題：

`mv archive_backup test_folder/`{{execute}}

確認一下：

`ls test_folder`{{execute}}

## ⚠️ 使用 mv 時的重要提醒

如果目的地「已經有同名的檔案」，`mv` 會**直接覆蓋過去，不會跳出警告詢問你**。所以搬移或改名前，養成先用 `ls` 確認目的地有沒有同名檔案的習慣，可以避免不小心把重要資料覆蓋掉。

## ✅ 過關檢核

- [ ] 我已經用 `mv` 把檔案搬到另一個資料夾
- [ ] 我已經理解「改名」其實就是 `mv` 到同一個地方、換一個新名字
- [ ] 我知道 `mv` 搬移資料夾不需要加 `-r`
- [ ] 我知道 `mv` 如果遇到同名檔案會直接覆蓋，沒有警告視窗

下一站，我們要學一個威力強大、但也最需要小心使用的指令：刪除。
