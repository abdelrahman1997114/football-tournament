FROM php:8.2-apache

# نسخ كل الملفات
COPY . /var/www/html/

# فتح الصلاحيات للموقع
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80
