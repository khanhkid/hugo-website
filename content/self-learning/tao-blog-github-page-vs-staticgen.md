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

1. Tạo 1 trang Github Page theo hướng dẫn https://pages.github.com/
2. Cài đặt Hugo (https://gohugo.io/getting-started/installing)

Cài đặt trên Linux
        
        sudo apt-get install hugo
        hugo version #Kiểm tra hugo đã được cài hay chưa 

Khởi tạo 1 Hugo structure 

        hugo new site [PATH_NAME]

## Structure Hugo

Giới thiệu về  structure của HUGO

        .
        ├── archetypes      # chứa mẫu của 1 bài post title, date, draft ... khi dùng hugo new [post-name]
        ├── config.toml     # chứa config khi hugo generate  dùng lệnh hugo
        ├── content         # chứa nội dung các bài viết
        ├── data            # optional
        ├── layouts         # optional
        ├── static          # optional
        └── themes          # chứa themes của trang web

## Cài Đặt Themes

Danh sách các theme được đóng góp trên hugo https://themes.gohugo.io/. Chúng ta chọn 1 theme phù hợp và cài đặt vào trong Hugo. Trong bài viết tôi chọn theme `Ezhil` và đây là github của theme https://github.com/vividvilla/ezhil

Trong 1 theme thường sẽ có 2 phần chính 

Cách cài đặt

File config.toml

## Tạo bài post

Khởi tạo server 

        hugo server

Tạo 1 bài post mới 

        hugo new [post-name].md

Sau khi chạy hàm trên sẽ tạo ra 1 file `[post-name].md` trong thư mục `content/posts`

