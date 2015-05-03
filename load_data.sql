/* Create bids table*/
CREATE TABLE bids
  (
  bid_id int,
  bidder_id text,
  auction text,
  merchandise text,
  device text,
  bid_time double,
  country text,
  ip text,
  url text
  );

/* Load in bids file*/
LOAD DATA LOCAL INFILE '/Users/andrewszwec/Documents/kaggle/fbHumanVsRobot/bids.csv' 
INTO TABLE bids
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from bids limit 10;



/* create train table*/
CREATE TABLE train
  (
  bidder_id text,
  payment_account text,
  address text,
  outcome int
  );

/* Load in bids file*/
LOAD DATA LOCAL INFILE '/Users/andrewszwec/Documents/kaggle/fbHumanVsRobot/train.csv' 
INTO TABLE train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from train limit 10;



/* Join bids and bidding data */
create table training as 
select 	t.bidder_id
		,t.payment_account
		,t.address
		,b.bid_id
		,b.auction
		,b.merchandise
		,b.device
		,b.bid_time
		,b.country
		,b.ip
		,b.url
        ,t.outcome
from train t
left join bids b
on t.bidder_id = b.bidder_id;

select * from training limit 100;