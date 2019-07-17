---
title: "Tôi học Vim"
date: 2019-07-17T16:46:58+07:00
draft: false
---

Ngẫm cuộc đời chắc sẽ gắn bó với Linux cũng nhiều nên thôi nay mình tỉm hiểu học về `Vim`. Đó giờ thường dùng nhất vẫn là `Nano` mà cũng có nhiều bất tiện vì `Nano` không phải là default của Linux cho lắm.

Ngồi nghĩ thôi chi bằng ngồi học `Vim` để cập nhật theo thời đại vậy.

`Vim` thì mình follow theo `vimtour` nếu bạn nào hứng thú thì có thể gõ lệnh này trên command line sẽ ra hướng dẫn luôn. 

## BASIC ##

1. Nhấn `Esc` để trở về Normal mode
2. Về cách di chuyển cursor (thường thì mình dùng mấy phím mũi tên nhiều hơn)

        h (left) j (down)  k (up) l (right)
3. Chỉnh sửa

        i - chỉnh sửa tại vị trí cursor
        A - chuyển qua mode chỉnh sửa và di chuyển cursor đến Endline

4. Cách lưu sau khi chỉnh sữa
   
        <ESC>  +  :q!   <ENTER>  to trash all changes.
        <ESC>  + :wq   <ENTER>  to save the changes.

5. Undo and Redo
   
        u - Undo last action
        U - Undo tất cả thai đổi trên dòng
        Ctrl + r - Redo
        

## EDITOR ##

### MOVING CURSOR ###

        2w to move the cursor two words forward
        3e  to move the cursor to the end of the third word forward.
        0  (zero) to move to the start of the line.

### DELETION ###

Di chuyển Cursor đến nơi cần xoá

Character

        x -  xoá 1 ký tự 

        dw - Delete word và next character
        de - Delete just word 
        d$ - Delete từ cursor đến end line
        d [num] [e|w|$] - số lượng muốn delete  
        
        dd - xoá dòng

        c [num] [e|w|$]  deletes the word and places you in Insert mode

### COPY AND PASTE ###

Sau khi `d [e|d|$]` thì dòng xoá hay ký tự sẽ được lưu lại trong `Vim register` dùng

        `p` để in `Vim register` ra -> Dạng như Cut

### CURSOR LOCATION AND FILE STATUS ###

        Ctrl + G : hiển thị location và file status
        G: di chuyển cursor to end line file
        gg: di chuyển cursor to start file

To Be Continues 4.2
