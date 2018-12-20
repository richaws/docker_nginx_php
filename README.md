# Author

Richard Shilingford  <Richard.Shillingford@Kaizentechpartners.com>
Jenkins pipeline build for CI

# About

A Dockerfile that installs and configures NGINX + php-fpm + modifies php.ini.

# Usage
```
$ docker build . -t nginx_php
$ docker run -p 8181:8181 -d nginx_php:latest
```

Now you should be able to display the PHP info page at http://127.0.0.1:8181/info.php
