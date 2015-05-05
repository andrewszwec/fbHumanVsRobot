/* 
	Number of distinct auctions  
*/
select	bidder_id
		,count(DISTINCT auction) as num_distinct_auctions
into #auctions_d
from bids
group by bidder_id
order by count(*) desc


/* 
	Number of distinct auctions  Compared to average
*/
DECLARE @avg_num_distinct_auctions as numeric;
set @avg_num_distinct_auctions  = (select avg(num_distinct_auctions)  from #auctions_d);
DECLARE @std_num_distinct_auctions as numeric;
set @std_num_distinct_auctions  = (select stdev(num_distinct_auctions)  from #auctions_d);
select 
bidder_id
,(num_distinct_auctions - @avg_num_distinct_auctions) / @std_num_distinct_auctions as normalised_num_distinct_auctions
,(num_distinct_auctions - @avg_num_distinct_auctions) as num_distinct_auctions_less_avg
,num_distinct_auctions*num_distinct_auctions as num_distinct_auctions_sqd
,case when num_distinct_auctions >= @avg_num_distinct_auctions then 1 else 0 end as num_distinct_auctions_gt_avg
into #auctions_summary
from #auctions_d


/*
	Number of distinct referrer urls
	Same auction, same bidder, same merch, different url
*/

select 
	bidder_id
	,max(num_distinct_referrer_url) as  num_distinct_referrer_url_max
	,min(num_distinct_referrer_url)	as  num_distinct_referrer_url_min
	,avg(num_distinct_referrer_url)	as  num_distinct_referrer_url_avg
into #num_distinct_referrer_urls
from (
		select 
			bidder_id
			,auction
			,merchandise
			,count(distinct url) as num_distinct_referrer_url
		from bids
		group by	bidder_id
					,auction
					,merchandise
) t1
group by bidder_id


/* 
	Number of bids per auction
*/
select 
		bidder_id
		,max(num_distinct_bids_per_auction) as  num_distinct_bids_per_auction_max
		,min(num_distinct_bids_per_auction)	as  num_distinct_bids_per_auction_min
		,avg(num_distinct_bids_per_auction)	as  num_distinct_bids_per_auction_avg
into #bids_auction
from (
		select	bidder_id
				,auction
				,count(distinct bid_id) as num_distinct_bids_per_auction
		from bids
		group by bidder_id
				,auction
) t1
group by bidder_id

/* 
	Number of distinct merchandise typess
	(probably a poor estimator)
*/
select	bidder_id
		,count(distinct merchandise) as num_distinct_merch_types
into #merch_types
from bids
group by bidder_id

/* 
	Number of distinct countries bids made from 
	
*/
select	bidder_id
		,count(distinct country) as num_distinct_countries
into #countries
from bids
group by bidder_id

/* 
	Number of distinct ips bids made from 
	
*/
select	bidder_id
		,count(distinct ip) as num_distinct_ip
into #ips
from bids
group by bidder_id

/*
		Number of bids at same moment
		Same bidder_id, same time, different auction 
*/
select 
		bidder_id
		,sum(case when num_bids_at_same_moment > 1 then 1 else 0 end) as multiple_bids_at_same_moment
into #bids_same_moment
from (
SELECT	bidder_id
		,time
		,count(distinct auction) as num_bids_at_same_moment
from bids
group by bidder_id, time
) t1
group by bidder_id;



/*************************************************************************/
--	Stitch it all together
--
/*************************************************************************/

-- TRAINING
-- drop table WRK_BAR_TRAIN_20150503
select 
		tr.bidder_id
		,tr.payment_account
		,tr.address
		,ac.num_distinct_auctions
		,round(acs.normalised_num_distinct_auctions,5) as normalised_num_distinct_auctions
		,acs.num_distinct_auctions_less_avg
		,acs.num_distinct_auctions_sqd
		,acs.num_distinct_auctions_gt_avg
		,dru.num_distinct_referrer_url_max
		,dru.num_distinct_referrer_url_min
		,dru.num_distinct_referrer_url_avg
		,ba.num_distinct_bids_per_auction_max
		,ba.num_distinct_bids_per_auction_min
		,ba.num_distinct_bids_per_auction_avg
		,mt.num_distinct_merch_types
		,cc.num_distinct_countries
		,ipp.num_distinct_ip
		,bsm.multiple_bids_at_same_moment
		,[outcome] -- robot or human

into WRK_BAR_TRAIN_20150503
from train tr
left join #auctions_d ac
on tr.bidder_id = ac.bidder_id
left join #auctions_summary acs
on tr.bidder_id = acs.bidder_id
left join #num_distinct_referrer_urls dru
on tr.bidder_id = dru.bidder_id
left join #bids_auction ba
on tr.bidder_id = ba.bidder_id
left join #merch_types mt
on tr.bidder_id = mt.bidder_id
left join #countries cc
on tr.bidder_id = cc.bidder_id
left join #ips ipp
on tr.bidder_id = ipp.bidder_id
left join #bids_same_moment bsm
on tr.bidder_id = bsm.bidder_id


select top 100 * from WRK_BAR_TRAIN_20150503



-- TEST
select 
		tr.bidder_id
		,tr.payment_account
		,tr.address
		,ac.num_distinct_auctions
		,acs.normalised_num_distinct_auctions
		,acs.num_distinct_auctions_less_avg
		,acs.num_distinct_auctions_sqd
		,acs.num_distinct_auctions_gt_avg
		,dru.num_distinct_referrer_url_max
		,dru.num_distinct_referrer_url_min
		,dru.num_distinct_referrer_url_avg
		,ba.num_distinct_bids_per_auction_max
		,ba.num_distinct_bids_per_auction_min
		,ba.num_distinct_bids_per_auction_avg
		,mt.num_distinct_merch_types
		,cc.num_distinct_countries
		,ipp.num_distinct_ip
		,bsm.multiple_bids_at_same_moment
		,[outcome] -- robot or human

into WRK_BAR_TEST_20150503
from test tr
left join #auctions_d ac
on tr.bidder_id = ac.bidder_id
left join #auctions_summary acs
on tr.bidder_id = acs.bidder_id
left join #num_distinct_referrer_urls dru
on tr.bidder_id = dru.bidder_id
left join #bids_auction ba
on tr.bidder_id = ba.bidder_id
left join #merch_types mt
on tr.bidder_id = mt.bidder_id
left join #countries cc
on tr.bidder_id = cc.bidder_id
left join #ips ipp
on tr.bidder_id = ipp.bidder_id
left join #bids_same_moment bsm
on tr.bidder_id = bsm.bidder_id





/*************************************************************************
--	Code Graveyard
--
/*************************************************************************
/* 
	DEFUNCT: (same as number of bids per auction, since we dont have a proper time to identify bids)
	Number of auctions from the same actioner
	
*/
select	bidder_id
		,auction
		,count(bid_id)
from bids
where bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
group by bidder_id, auction







/*
		Number of bids at same moment (unit test)
		Same bidder_id, same time, different auction 
*/
SELECT	bidder_id
		,time
		,count(distinct auction) as num_bids_at_same_moment
from bids
where bidder_id = '668d393e858e8126275433046bbd35c6tywop'
group by bidder_id, time
order by count(distinct auction) desc


/* 
	Number of distinct auctions  (UNIT TESTS)
*/

select	bidder_id
		,count(DISTINCT auction) 
from bids
where bidder_id in ( '91a3c57b13234af24875c56fb7e2b2f4rb56a'
,'668d393e858e8126275433046bbd35c6tywop'
,'aa5f360084278b35d746fa6af3a7a1a5ra3xe'
,'3939ac3ef7d472a59a9c5f893dd3e39fh9ofi'
,'8393c48eaf4b8fa96886edc7cf27b372dsibi'
,'e8291466de91b0eb4e1515143c7f74dexy2yr'
)

group by bidder_id
order by count(*) desc


select count(DISTINCT auction) from bids 
where bidder_id = 'aa5f360084278b35d746fa6af3a7a1a5ra3xe'

select count(DISTINCT auction) from bids 
where bidder_id = 'e8291466de91b0eb4e1515143c7f74dexy2yr'






/* 
	Number of distinct auctions in last 1 wk, 2wks, 1, 2, 3, 6, 12, 24 months 
*/

-- MASTER -- number of distinct auctions LTD
select	bidder_id
		,count(DISTINCT auction) 
from bids
where bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
group by bidder_id
order by count(*) desc

-- number of acutions in last 7 days
select	bidder_id
		,auction
		,sum(	case when datediff(days, time, current_date) <= 7 then 1 else 0 end) as num_rows_last_7_days 
from bids
where bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
group by bidder_id, auction

---------------------------------------------------------------
-- try and roll up customers bids that occured in a (1 hour) window
-- assume time is in mill seconds

drop table #temp;
SELECT	
		bidder_id
		,convert(numeric, "time") as "time"
into #temp
from bids
where bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
order BY time asc

select t1.bidder_id
		,t1.time as time1
		,t2.time as time2
into #temp2
from #temp t1
left join #temp t2
on t1.time +100 <= t2.time 
where t1.time = 9759489368421052

/*  


*/
;WITH cte AS
 (
  SELECT convert(numeric,[time]) as [time], bidder_id
  FROM bids  
  where bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
  GROUP BY [time], bidder_id
  )
  SELECT c.time, c.bidder_id, o.Occurrences
  FROM cte c 
    CROSS APPLY (
                 SELECT t2.[time], t2.bidder_id,
                        ROW_NUMBER() OVER(PARTITION BY c.[time] ORDER BY t2.[time]) AS Occurrences        
                 FROM dbo.bids t2
                 WHERE c.bidder_id = t2.bidder_id
				 and bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'
                   AND t2.[time]- c.[time] BETWEEN 0 AND 1
                 ) o
  WHERE c.bidder_id = o.bidder_id AND c.[time] = o.[time] 
  ORDER BY c.[time]





/* 
		DELETE ME!!
*/
-- Take a look at a human bidder and see how it works
select *
from train t
inner join bids b
on t.bidder_id = b.bidder_id
where t.bidder_id = '91a3c57b13234af24875c56fb7e2b2f4rb56a'


-- Bids
select *
from bids 
where time = '9769583684210526'

