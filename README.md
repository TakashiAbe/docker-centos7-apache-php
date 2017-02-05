## 概要

### PHP7 on Apache2.4 & CentOS7

- PHP7 & composer
- MySQLクライアント
- Systemd導入
- Crond導入
- OSのロケーションを日本に
- タイムゾーンを東京へ変更
- gitインストール
- Apache2.4

## 使い方

```
docker run -d --privileged=true --name centos7-apache-php -p 80:80 -v /var/docker-volume:/var/www/html:rw takashiabe/centos7-apache-php
```

docker-compose で使う際も、privileged: true の指定を忘れずに入れてください。

独自の設定として

```
[PHP]
memory_limit = 512M
post_max_size = 50M
upload_max_filesize = 50M


[Date]
date.timezone = 'Asia/Tokyo'
```

を入れています。

document_root は /var/www/html です。 

systemdが動きますので、Apacheの（リロード|リスタート）は

```
docker exec -it centos7-apache-php systemctl (reload|restart) httpd.service
```

です。


## License
MIT