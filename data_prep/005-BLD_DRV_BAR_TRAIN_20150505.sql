
create proc BLD_DRV_BAR_TRAIN_20150505 as

SELECT bar.[bidder_id]
		,[payment_account]
		,[address]
		,[num_distinct_auctions]
		,[normalised_num_distinct_auctions]
		,[num_distinct_auctions_less_avg]
		,[num_distinct_auctions_sqd]
		,[num_distinct_auctions_gt_avg]
		,[num_distinct_referrer_url_max]
		,[num_distinct_referrer_url_min]
		,[num_distinct_referrer_url_avg]
		,[num_distinct_bids_per_auction_max]
		,[num_distinct_bids_per_auction_min]
		,[num_distinct_bids_per_auction_avg]
		,[num_distinct_merch_types]
		,[num_distinct_countries]
		,[num_distinct_ip]
		,[multiple_bids_at_same_moment]
		,b.bid_id
		,b.auction
		,b.merchandise
		,b.device
		,b.time
		,b.country
		,b.ip
		,b.url
		,[outcome]
into DRV_BAR_TRAIN_20150505
FROM WRK_BAR_TRAIN_20150503 bar
left join bids b
on bar.bidder_id = b.bidder_id


--select top 10 * from DRV_BAR_TRAIN_20150505

