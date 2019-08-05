FROM registry.cn-beijing.aliyuncs.com/nfangxu/laranginx:1.1
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

ADD ./ /var/www/html/
WORKDIR "/var/www/html"

RUN composer install
RUN cp .env.example .env && chmod -R 777 storage/ && chmod -R 777 bootstrap/cache/

EXPOSE 443 80

CMD ["/init.sh"]