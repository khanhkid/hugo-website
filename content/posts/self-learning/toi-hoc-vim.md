---
title: "Tôi học Vim"
date: 2019-07-17T16:46:58+07:00
draft: false
tags: [ vim, editor, linux]
---

## OVERVIEW

Ngẫm cuộc đời chắc sẽ gắn bó với Linux cũng nhiều nên thôi nay mình tìm hiểu và học về `Vim`. Đó giờ thường dùng nhất vẫn là `Nano` mà cũng có nhiều bất tiện vì `Nano` không phải là default của Linux nên lần nào connect lên là phải cài thêm.

Ngồi nghĩ thôi chi bằng ngồi học `Vim` để cập nhật theo thời đại vậy.

`Vim` thì mình follow theo `vimtutor` nếu bạn nào hứng thú thì có thể gõ lệnh này trên command line sẽ ra hướng dẫn chi tiết.

## VÀO PHẦN CHÍNH

### BASIC

1. Nhấn `Esc` để trở về Normal mode
2. Về cách di chuyển cursor (thường thì mình dùng mấy phím mũi tên nhiều hơn)

        h (left) j (down)  k (up) l (right)
3. Chỉnh sửa

        i - chỉnh sửa tại vị trí cursor
        A - chuyển qua mode chỉnh sửa và di chuyển cursor đến Endline
        v - chọn 1 vùng văn bản
                d -> cut -> p để dán ra
                y -> copy -> p để dán ra
                :w [filename] -> ghi ra file mới
                :r -> dán ra vị trí cursor

4. Cách lưu sau khi chỉnh sữa

        <ESC>  +  :q!   <ENTER>  to trash all changes.
        <ESC>  + :wq   <ENTER>  to save the changes.
        :w [name] ghi vùng chọn hoặc file thành tên file khác

5. Undo and Redo

        u - Undo last action
        U - Undo tất cả thai đổi trên dòng
        Ctrl + r - Redo

### EDITOR

Quy tắc chung thường là `[operator] [num] [motion]`

`operator`: thường là các hàm vd `d` là delete

`num`: số lượng motion

`motion` là chuyển động của cursor VD: `w` word, `$` endline

#### Di chuyển cursor

        e - Di chuyển đến cuối từ
        b - Di chuyển đến đầu từ (lùi lại)
        w - Di chuyển đến đầu từ (tiến lên)
        0(zero) - Di chuyển đến đầu dòng
        G - Di chuyển đến cuối file
        gg - Di chuyển đến đầu file
        L - Di chuyển đến cuối screen
        :59 hoặc 59G - Di chuyển đến dòng 59
        20 - Di chuyển đến cột 20
        % - Di chuyển đến các ngoặc trong dòng
        [[ - Nhảy đến nơi bắt đầu function
        [{ - Nhảy đến nơi bắt đầu block
        
        Ctrl + G - hiển thị location và file status        

Thêm [num] ở đầu để thực hiện số lượng `motion`

EX:

        3e - Di chuyển đến cuối từ 3
        2b - Di chuyển đến đầu từ 2 (lùi lại)
        4w - Di chuyển đến đầu từ 4 (tiến lên)

#### Xoá

Di chuyển Cursor đến nơi cần xoá

Character

        x -  xoá 1 ký tự 

        dw - Delete word và next character
        de - Delete just word 
        d$ - Delete từ cursor đến end line
        d [num] [e|w|$] - số lượng muốn delete  
        
        dd - xoá dòng

        c [num] [e|w|$]  deletes the word and places you in Insert mode

#### Cut, copy & paste

        y - Copy phần text đã chọn vào clipboard
        p - Paste content
        dd - Cut dòng hiện tại
        yw - Copy word
        yy - Copy dòng hiện tại
        y$ - Copy đến cuối dòng
        D - Copy tới cuối file

#### Di chuyển cursor và thông tin file

        Ctrl + G : hiển thị location và file status
        G: di chuyển cursor to end line file
        gg: di chuyển cursor to start file

#### Tìm kiếm - Searching

        /word - Tìm kiếm "word" từ trên xuống dưới
        ?word - Tìm kiếm "word" từ dưới lên trên
        * - Tìm kiếm từ con trỏ
        /\cstring - Tìm "String" cả chữ hoa lẫn chữ thường
        /jo[ha]n - Tìm "john" và "joan"
        /< the - Tìm từ bắt đầu bằng the ví dụ: theatre or then
        /the> - Tìm từ kết thúc bằng the ví dụ: breathe

                n - nhảy đến vị trí tiếp theo - FORWARD
                N - nhảy ngược lại vị trí trước đó - BACKWARD
                CTRL + [O|I]: Nhảy để vị trí con trỏ trước hoặc sau đó
        
        Thay thế (substitution) 
        :s/old/new - Thay thế old thành new trên DÒNG cursor đang đứng
        :s/old/new/g - Thay thế TẤT CẢ old thành new trên DÒNG cursor đang đứng
        :%s/old/new/g - Thay thế TẤT CẢ old thành new trong file
        :%s/old/new/gc - Hỏi xác nhận mỗi lần          

#### Thực thi Command trong VIM

        :![command]: chạy hàm command khi trong giao diện vim
                :!ls 
                :!pwd

## SUMMARY

Tổng hợp cơ bản những về những hàm mình thấy hữu ích trong `Vim` và theo `vimtutor`. Nếu các muốn nâng cao hơn thì có thể vào trực tiếp `vimtutor` để xem nhé. Cảm ơn các bạn đã đọc đến đây.
