DROP TABLE IF EXISTS `click`;
CREATE TABLE click (
  advertiser_id text NOT NULL,
  ad_id text NOT NULL,
  agent text,
  age int DEFAULT NULL,
  gender text,
  INDEX idx_advertiser_id(advertiser_id),
  INDEX idx_ad_id(ad_id)
);


DROP TABLE IF EXISTS `click_counter`;
CREATE TABLE click_counter (
  advertiser_id text NOT NULL,
  ad_id text NOT NULL,
  counter int,
  INDEX idx_advertiser_id(advertiser_id),
  INDEX idx_ad_id(ad_id)
);
