---
title: "Tạo Blog Cá Nhân bằng Github Page vs Staticgen"
date: 2019-07-18T23:17:30+07:00
disqus: true
---

# Requirement

<img class="special-img-class"¬ src="/self-learning/img/hugo-github.png">

Github Page: <https://pages.github.com/>

`Github Page` là một nơi github chia sẽ cho developer một resource để build 1 trang `website tĩnh`. github.io sẽ để trang website của chúng ta dưới tên 1 subdomain `[username].github.io`. Giống như trang blog của mình nó là <https://khanhkid.github.io>. 

`Hugo`: <https://www.staticgen.com/hugo>

Hugo is a static site generator written in Go

`Git` và một chút kiến thức về  `Markdown`

# Installing 

1. Tạo 1 trang Github Page theo hướng dẫn <https://pages.github.com/>
2. Cài đặt Hugo (<https://gohugo.io/getting-started/installing>)

Cài đặt trên Linux

        sudo apt-get install hugo
        hugo version #Kiểm tra hugo đã được cài hay chưa 

Khởi tạo 1 Hugo structure

        hugo new site [PATH_NAME]

## Structure Hugo

Giới thiệu về  structure của HUGO

        .
        ├── archetypes      # chứa mẫu của 1 bài post title, date, draft ... khi dùng `hugo new [post-name]`
        ├── config.toml     # chứa config variable khi hugo generate dùng lệnh `hugo`
        ├── content         # chứa nội dung các bài viết
        ├── data            # optional
        ├── layouts         # optional
        ├── static          # optional
        └── themes          # chứa themes của trang web

## Cài Đặt Themes

Danh sách các theme được đóng góp trên hugo <https://themes.gohugo.io/>. Chúng ta chọn 1 theme phù hợp và cài đặt vào trong Hugo. Trong bài viết tôi chọn theme `Ezhil` và đây là github của theme <https://github.com/vividvilla/ezhil>

Trong 1 theme thường sẽ có 2 phần chính

Cách cài đặt và file `config.toml`.

2 phần này sẽ được miêu tả chi tiết trong github của từng theme.

## Tạo bài post

Khởi tạo server

        hugo server

Sau khi run thì server thông thường sẽ hiển thị ở consolog đường link của test server. Thường sẽ là <http://localhost:1313/>

Tạo 1 bài post mới

        hugo new [post-name].md

Sau khi chạy hàm trên sẽ tạo ra 1 file `[post-name].md` trong thư mục `content/posts`

Tiếp theo là giai đoạn dùng `Markdown` style để viết bài post

## Generate blog

Sau quá trình chỉnh sửa vào viết `gì đó` thì chúng ta sẽ đến công đoạn cuối cùng là Generate blog từ `Markdown` -> `website tĩnh`. Lệnh để generate.

        hugo 

Sau khi generate thì website tĩnh sẽ được tạo trong thư mục `public`. Nhiệm vụ cuối cùng của chúng ta sẽ là copy toàn bộ file trong `public` và Repo `[username].github.io`

# Summary

Về căn bản chúng ta đã tạo được 1 blog tĩnh từ `Hugo` và có thể dùng nó để làm nơi note, lữu trữ những bài viết của mình cũng như share cho mọi người về những kiến thức của chúng ta.
