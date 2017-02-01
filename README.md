## 概要

### PHP7 & MySQL5.7 on Apache2.4 & CentOS7

- PHP7 & composer
- MySQL5.7
- Systemd導入
- Crond導入
- OSのロケーションを日本に
- タイムゾーンを東京へ変更
- gitインストール
- Apache2.4

## 使い方

```
docker run -d --privileged=true --name centos7-apache-php-mysql -p 80:80 -v /var/docker-volume:/var/www/html:rw takashiabe/centos7-apache-php-mysql
```

docker-compose で使う際も、privileged: true の指定を忘れずに入れてください。
document_root は /var/www/html です。

systemdが動きますので、Apacheの（リロード|リスタート）は

```
docker exec -it centos7-apache-php-mysql systemctl (reload|restart) httpd.service
```

です。


## License
MIT