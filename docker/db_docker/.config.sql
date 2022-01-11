CREATE DATABASE mediawiki_db;
GRANT ALL PRIVILEGES ON mediawiki_db.* TO 'wiki_user'@'localhost' IDENTIFIED BY 'P@ssWord@123#' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;
