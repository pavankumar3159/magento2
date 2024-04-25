-- init-user.sql
USE magento2;
GRANT ALL PRIVILEGES ON magento2.* TO 'magento2'@'%' IDENTIFIED BY 'magento2@mysql';
FLUSH PRIVILEGES;
