use [DT_LUXOTTICA_INSIGHTS_2014]
go

CREATE CLUSTERED INDEX [Idx_bidder_id] ON train
( 
	bidder_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


CREATE CLUSTERED INDEX [Idx_bid_id] ON bids
( 
	bid_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [Idx_bidder_id] ON bids
( 
	bidder_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


select 	t.bidder_id
		,t.payment_account
		,t.address
		,b.bid_id
		,b.auction
		,b.merchandise
		,b.device
		,b.time
		,b.country
		,b.ip
		,b.url
        ,t.outcome
into training
from train t
left join bids b
on t.bidder_id = b.bidder_id;

-- Check counts
select count(*) from bids
--7,656,334


-- find nulls
select *
from training
where bid_id is  null

-- Delete nulls
delete from training
where bid_id is null;
-- counts
-- Total 3,071,253
-- where bid_id is null 29
-- 3071224


/*
		Create derived attributes
*/ 

select top 10 * 
from training

/*
		Ideas for derived attributes
		----------------------------
		Use bidder_id as the user id and roll up on this.

		DEFUNCT
		- Number of payment accounts used
		- number of addresses used

		- number of auctions in last 1 wk, 2wks, 1, 2, 3, 6, 12, 24 months
		- avg number auctions per week
		- max number auctions per week
		- min number auctions per week

		- number of distinct auctioners visited ltd
		- number of distinct auctioners visited last 1 wk, 2wks, 1, 2, 3, 6, 12, 24 months

		- avg number of bids per auction
		- max number of bids per auction
		- min number of bids per auction

		- number of unique merch types

		- avg time between bids
		- max time between bids
		- min time between bids

		- number of countries bids made from
		- number of ips used
		- max number of auctions from the same actioner

*/

/* 
		Create number of payment accounts
		Each bidder in the training set only has one payment account.
		This variables does not contain any information.
*/
-- drop table #pay_acc
select	bidder_id
		,count(*) as number_accounts
--into #pay_acc
from (
		select	bidder_id
				,payment_account

		from training
		group by bidder_id, payment_account
) t1
group by bidder_id
order by count(*) desc;




/* 
		Create number of addresses
		--------------------------
		Each bidder in the training set only has one address.
		This variables does not contain any information.
*/
-- drop table #addr
select bidder_id
		,count(*) as num_address
--into #addr
from (
	select	bidder_id
			,"address"
	from	training
	group by	bidder_id
				,"address"
) t1
group by bidder_id
order by count(*) desc
;



-- no dups in the train table
select bidder_id, count(*) 
from train
group by bidder_id
order by count(*) desc


-- many bids per bidder in the bids table
select bidder_id, count(*) 
from bids
group by bidder_id
order by count(*) desc


-- Take a look at a human bidder and see how it works
select *
from train t
inner join bids b
on t.bidder_id = b.bidder_id
where t.bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'

-- always uses the same payment accounts
-- address doesnt change
select top 10 * from bids

-- Count number of bids for this guy
select count(*) 
from bids
where bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
-- 24 bids

--$$
-- Count number of auctions from the same auctioner
select	bidder_id
		,auction
		,count(*) 
from bids
where bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
group by bidder_id
		,auction
-- this guy has bought multiple times from the same people


-- Number of bids from different countries same user
select 
	bidder_id
	,count(*) num_countries_bid_from
from (
		select	bidder_id
				, country
		from bids
		group by bidder_id, country
) t1
group by t1.bidder_id
order by count(*) desc

-- bidder_id = '332484ddd66b9a3db89ee68f08b1288amq90u'
-- bid from 8 different countries

-- look at one example
-- this guy is a human that has purchased in a heap of countries
select b.bidder_id
		,country
		,outcome
from bids b
inner join train t
on b.bidder_id = t.bidder_id
where b.bidder_id = '332484ddd66b9a3db89ee68f08b1288amq90u'
			

-- USE THIS FOR COUNT DISTCINCT
-- see if count distinct works the same
select	bidder_id
		,count(DISTINCT country) as num_countries_bid_from
from bids
where bidder_id = '332484ddd66b9a3db89ee68f08b1288amq90u'
group by bidder_id
-- YES! it works the same as the sub select



-- Number of ips used
select	bidder_id
		,count(DISTINCT ip) as num_ips_used
from bids
where bidder_id = '68d468e15e0de0bab9694cdca8e799eb2j8kn'
group by bidder_id
-- human 76 ips
-- robot 13 ips, 8 ips

-- get a robot
select top 10 * from train 
where outcome = 1.0


