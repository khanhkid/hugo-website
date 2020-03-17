---
title: "[20200317] OPENVPN with Docker"
date: 2020-03-17T10:54:23+07:00
draft: false
tags: [docker, vpn, openvpn, devops]
---

# Cài Đặt OPENVPN in Linux with Docker#

Bỗng một ngày đẹp trời có việc bạn phải ra ngoài để làm việc thì làm sao có thể dùng LocalNetwork trong khi trong ta đang đi ngoài Office. 

VPN là một giải phải cho vấn đề hiện tại 

<img class="special-img-class"¬ src="/posts/images/20200317_openvpn/vpn_overview.png">

VPN có những thuận lợi và việc work at home như sau

- Sử dụng được LocalNetwork (các tài nguyên như NAS) trong office trong khi ở ngoài Office
- Tạo bảo mật trên đường truyền người dùng nhằm giấu danh tính (sử dụng IP của Office nên ko biết IP của client)
- Tốc độ có thể nhanh hơn khi dùng VPN (Hmmm)

Trong phạm vi bài post này chúng ta sẽ tiến hành cải một OpenVPN server trên Linux bằng docker và cách sử dụng OpenVPN 

## Requirement ##

- Git
- Docker 

## Installation ##

### Cài Đặt OPENVPN SERVER ###
**Bước 01:** Bắt đầu với việc clone rep OPENVPN và build image trong docker

    git clone https://github.com/kylemanna/docker-openvpn.git docker-openvpn

Truy cập vào thư mục `docker-openvn`
    
    cd docker-openvpn/

Thực thi cài đặt Docker Image

    docker build -t myownvpn .

Chúng ta tiếp tục cần một thư mục để chứa dữ liệu của openvpn

    cd ..
    mkdir vpn-data

**Bước 02:** Chúng ta sẽ bắt đầu chạy OpenVPN đề tạo các file cấu hình ở đây chúng ta sử dụng port 3000 cho VPN:

**[IP_ADDRESS]**: Thay đổi bằng IP public của server bạn

    $ docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn \
     ovpn_genconfig -u udp://[IP_ADDRESS]:3000

Output:

    Processing PUSH Config: 'block-outside-dns'
    Processing Route Config: '192.168.254.0/24'
    Processing PUSH Config: 'dhcp-option DNS 8.8.8.8'
    Processing PUSH Config: 'dhcp-option DNS 8.8.4.4'
    Successfully generated config
    Cleaning up before Exit ...

**Bước 03:** Tiếp tục chúng ta sẽ tạo PKI, CA, Private key những file key để mã hoá đường truyền:

    $ docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn ovpn_initpki

**Verifying - Enter PEM pass phrase:** Password cho file key ---> Pass này sẽ được hỏi khi tạo client

Output:

    init-pki complete; you may now create a CA or requests.
    Your newly created PKI dir is: /etc/openvpn/pki
    Generating a 2048 bit RSA private key
    ............................................................................+++
    ....+++
    writing new private key to '/etc/openvpn/pki/private/ca.key.XXXXCFGIEm'
    Enter PEM pass phrase:
    Verifying - Enter PEM pass phrase:
    ...
    Common Name (eg: your user, host, or server name) [Easy-RSA CA]:g
    CA creation complete and you may now import and sign cert requests.
    Your new CA certificate file for publishing is at:
    /etc/openvpn/pki/ca.crt
    Generating DH parameters, 2048 bit long safe prime, generator 2
    This is going to take a long time
    ... # Wait a while
    Enter pass phrase for /etc/openvpn/pki/private/ca.key:
    Check that the request matches the signature
    ...
    Enter pass phrase for /etc/openvpn/pki/private/ca.key:
    An updated CRL has been created.
    CRL file: /etc/openvpn/pki/crl.pem

**Bước 04:** Cuối cùng, Chúng ta sẽ chạy VPN server dựa trên những config chúng ta đã khởi tạo:

    $ docker run -v $PWD/vpn-data:/etc/openvpn -d -p 3000:1194/udp --cap-add=NET_ADMIN myownvpn

Tới thời điểm này thì chúng ta đã hoàn thành việc tạo và chạy OpenVPN server

### Cài Đặt OPENVPN ClIENT ###

Sau khi cài đặt server và các config thì ta tiếp tục tài khoản người dùng

    $ docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn easyrsa build-client-full user1 nopass
    Generating a 2048 bit RSA private key
    ........................................................+++
    ..........................................................+++
    writing new private key to '/etc/openvpn/pki/private/user1.key.XXXXeoGIJE'
    -----
    Using configuration from /usr/share/easy-rsa/openssl-1.0.cnf
    Enter pass phrase for /etc/openvpn/pki/private/ca.key:
    ...

Ở đây chúng ta tạo user với nopass để cho quá trình đăng nhập chỉ cần file key là được nếu các bạn muốn có pass thì hãy bỏ `nopass` 

Tạo file key ovpn để gửi cho người dùng config VPN

    $docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_getclient user1 > user1.ovpn

Sau đó chúng ta có thể gửi file ovpn cho người dùng và đăng nhập vào VPN sử dụng Tunnelblick hay những phần mềm khác

    <img class="special-img-class"¬ src="/posts/images/20200317_openvpn/tunnelblick.png">

### Vài Tính năng khác OPENVPN ###

Nhớ `cd` vào thư mục chứa folder vpn-data

Lấy danh sách account trong server

    $docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_listclients

Xuất tất cả các file key của người dùng vào `/tmp/openvpn_clients`

    $docker run -v $PWD/vpn-data:/etc/openvpn --volume /tmp/openvpn_clients:/etc/openvpn/clients --rm myownvpn ovpn_getclient_all

Thu hồi quyền truy cập một tài khoản VPN

    $docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_revokeclient clientname

Xoá một tài khoản VPN (xoá crt, key and req files)

    $docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_revokeclient client1 remove


## Reference ##

[https://medium.com/@gurayy/set-up-a-vpn-server-with-docker-in-5-minutes-a66184882c45]
[https://github.com/kylemanna/docker-openvpn.git]