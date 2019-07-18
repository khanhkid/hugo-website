---
title: "Tôi học Vim"
date: 2019-07-17T16:46:58+07:00
draft: false
tags: vim, editor, linux
---
# OVERVIEW

Ngẫm cuộc đời chắc sẽ gắn bó với Linux cũng nhiều nên thôi nay mình tỉm hiểu học về `Vim`. Đó giờ thường dùng nhất vẫn là `Nano` mà cũng có nhiều bất tiện vì `Nano` không phải là default của Linux cho lắm.

Ngồi nghĩ thôi chi bằng ngồi học `Vim` để cập nhật theo thời đại vậy.

`Vim` thì mình follow theo `vimtutor` nếu bạn nào hứng thú thì có thể gõ lệnh này trên command line sẽ ra hướng dẫn chi tiết.

# VÀO PHẦN CHÍNH

## BASIC

1. Nhấn `Esc` để trở về Normal mode
2. Về cách di chuyển cursor (thường thì mình dùng mấy phím mũi tên nhiều hơn)

        h (left) j (down)  k (up) l (right)
3. Chỉnh sửa

        i - chỉnh sửa tại vị trí cursor
        A - chuyển qua mode chỉnh sửa và di chuyển cursor đến Endline
        v - chọn 1 vùng văn bản
                d -> cut -> p để dán ra
                y -> copy -> p để dán ra
                :w -> ghi ra file mới
                :r -> dán ra vị trí cursor
                
4. Cách lưu sau khi chỉnh sữa

        <ESC>  +  :q!   <ENTER>  to trash all changes.
        <ESC>  + :wq   <ENTER>  to save the changes.
        :w [name] ghi vùng chọn hoặc file thành tên file khác

5. Undo and Redo

        u - Undo last action
        U - Undo tất cả thai đổi trên dòng
        Ctrl + r - Redo

## EDITOR

### Di chuyển cursor 

        2w to move the cursor two words forward
        3e  to move the cursor to the end of the third word forward.
        0  (zero) to move to the start of the line.
        G: di chuyển cursor to end line file
        gg: di chuyển cursor to start file      
        Ctrl + G : hiển thị location và file status        

### Xoá

Di chuyển Cursor đến nơi cần xoá

Character

        x -  xoá 1 ký tự 

        dw - Delete word và next character
        de - Delete just word 
        d$ - Delete từ cursor đến end line
        d [num] [e|w|$] - số lượng muốn delete  
        
        dd - xoá dòng

        c [num] [e|w|$]  deletes the word and places you in Insert mode

### Copy and Paste 

Sau khi `d [e|d|$]` thì dòng xoá hay ký tự sẽ được lưu lại trong `Vim register` dùng

        `p` để in `Vim register` ra -> Dạng như Cut

### Di chuyển cursor và thông tin file

        Ctrl + G : hiển thị location và file status
        G: di chuyển cursor to end line file
        gg: di chuyển cursor to start file

## Tìm kiếm - Searching

        / [word searching]
        n : nhảy đến vị trí tiếp theo - FORWARD
        N : nhảy ngược lại vị trí trước đó - BACKWARD
        CTRL + [O|I]: Nhảy để vị trí con trỏ trước hoặc sau đó

        :s/old/new - Thay thế old thành new trên DÒNG cursor đang đứng
        :s/old/new/g - Thay thế TẤT CẢ old thành new trên DÒNG cursor đang đứng
        :%s/old/new/g - Thay thế TẤT CẢ old thành new trong file
        :%s/old/new/gc - Hỏi xác nhận mỗi lần          

## Thực thi Command trong VIM

        :![command]: chạy hàm command khi trong giao diện vim
                :!ls 
                :!pwd

# SUMMARY

Tổng hợp cơ bản những về những hàm mình thấy hữu ích trong `Vim` và theo `vimtutor`. Nếu các muốn nâng cao hơn thì có thể vào trực tiếp `vimtutor` để xem nhé. Cảm ơn các bạn đã đọc đến đây.