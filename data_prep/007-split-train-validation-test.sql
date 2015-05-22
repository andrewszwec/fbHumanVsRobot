/*
		-- KAGGLE --

		This script divides the Kaggle tables into Train, Validation and Test
		
*/

create proc BLD_BAR_Train_Val_Test as 

--select top 10 num_distinct_auctions from DRV_BAR_TRAIN_20150505
--select top 10 * from DRV_BAR_TEST_20150505

------------------------------------------------------------------------------------------------
-- Step 1: Prepare test, validation and train set for WRK_BAR_TRAIN_20150503
--			This is the Bidder_id level data with only summary statistics
------------------------------------------------------------------------------------------------

/* Add Binary check sum for random sampling */ 
alter table [WRK_BAR_TRAIN_20150503] --WRK_BAR_TRAIN_20150503
add Random_Num float

update   [WRK_BAR_TRAIN_20150503]
set Random_Num = rand(BINARY_CHECKSUM(bidder_id, num_distinct_auctions))
where Random_Num is null 

DECLARE @Top60 as int 
set @Top60 = floor((select count(*) from  [WRK_BAR_TRAIN_20150503]) * 0.6)

/* Make Random 60 percent Training Set */
IF OBJECT_ID('WRK_BAR_TRAIN_20150503_Train_60pc') IS NOT NULL
DROP TABLE  [WRK_BAR_TRAIN_20150503_Train_60pc];

select top (@Top60) *
into [WRK_BAR_TRAIN_20150503_Train_60pc]
from [WRK_BAR_TRAIN_20150503]
order by Random_Num asc 


DECLARE @bottom40 as int 
set @bottom40 = floor((select count(*) from  [WRK_BAR_TRAIN_20150503]) * 0.4)
/* Make Random 40 percent sample */
select top (@bottom40) *
into #bottom40pc
from [WRK_BAR_TRAIN_20150503]
order by Random_Num DESC 

DECLARE @evenSplit as int 
set @evenSplit = floor((select count(*) from  #bottom40pc) * 0.5)

/* Make Random 20 percent Test set */
IF OBJECT_ID('WRK_BAR_TRAIN_20150503_Test_20pc') IS NOT NULL
DROP TABLE [WRK_BAR_TRAIN_20150503_Test_20pc];

select top (@evenSplit) *
into [WRK_BAR_TRAIN_20150503_Test_20pc]
from #bottom40pc
order by Random_Num asc 

/* Make Random 20 percent Validation set */
IF OBJECT_ID('WRK_BAR_TRAIN_20150503_Validation_20pc') IS NOT NULL
DROP TABLE [WRK_BAR_TRAIN_20150503_Validation_20pc];

select top (@evenSplit) *
into [WRK_BAR_TRAIN_20150503_Validation_20pc]
from #bottom40pc
order by Random_Num DESC 


DECLARE @train as int 
set @train = (select count(*) from [WRK_BAR_TRAIN_20150503_Train_60pc])
DECLARE @validation as int 
set @validation = (select count(*) from [WRK_BAR_TRAIN_20150503_Validation_20pc])
DECLARE @test as int 
set @test = (select count(*) from [WRK_BAR_TRAIN_20150503_Test_20pc])

DECLARE @total as int 
set @total = (select @train + @validation + @test)

select round(convert(float, @train)/convert(float, @total),3) as train_pc, round(convert(float, @validation)/convert( float, @total),3) as validation_pc, round(convert(float, @test)/convert(float, @total),3) as test_pc


select 'WRK_BAR_TRAIN_20150503_Train_60pc', count(*) as Counts from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'WRK_BAR_TRAIN_20150503_Train_60pc'
select 'WRK_BAR_TRAIN_20150503_Validation_20pc', count(*) as Counts from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'WRK_BAR_TRAIN_20150503_Validation_20pc'
select 'WRK_BAR_TRAIN_20150503_Test_20pc', count(*) as Counts from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'WRK_BAR_TRAIN_20150503_Test_20pc'




------------------------------------------------------------------------------------------------
-- Step 2: Prepare test, validation and train set for DRV_BAR_TRAIN_20150505
--			Bid level data + summary statistics
------------------------------------------------------------------------------------------------

/* Add Binary check sum for random sampling */ 
alter table [DRV_BAR_TRAIN_20150505] --DRV_BAR_TRAIN_20150505
add Random_Num float

update   [DRV_BAR_TRAIN_20150505]
set Random_Num = rand(BINARY_CHECKSUM(bidder_id, num_distinct_auctions))
where Random_Num is null 

DECLARE @Top60 as int 
set @Top60 = floor((select count(*) from  [DRV_BAR_TRAIN_20150505]) * 0.6)

/* Make Random 60 percent Training Set */
IF OBJECT_ID('DRV_BAR_TRAIN_20150505_Train_60pc') IS NOT NULL
DROP TABLE  [DRV_BAR_TRAIN_20150505_Train_60pc];

select top (@Top60) *
into [DRV_BAR_TRAIN_20150505_Train_60pc]
from [DRV_BAR_TRAIN_20150505]
order by Random_Num asc 


DECLARE @bottom40 as int 
set @bottom40 = floor((select count(*) from  [DRV_BAR_TRAIN_20150505]) * 0.4)
/* Make Random 40 percent sample */
select top (@bottom40) *
into #bottom40pc
from [DRV_BAR_TRAIN_20150505]
order by Random_Num DESC 

DECLARE @evenSplit as int 
set @evenSplit = floor((select count(*) from  #bottom40pc) * 0.5)

/* Make Random 20 percent Test set */
IF OBJECT_ID('DRV_BAR_TRAIN_20150505_Test_20pc') IS NOT NULL
DROP TABLE [DRV_BAR_TRAIN_20150505_Test_20pc];

select top (@evenSplit) *
into [DRV_BAR_TRAIN_20150505_Test_20pc]
from #bottom40pc
order by Random_Num asc 

/* Make Random 20 percent Validation set */
IF OBJECT_ID('DRV_BAR_TRAIN_20150505_Validation_20pc') IS NOT NULL
DROP TABLE [DRV_BAR_TRAIN_20150505_Validation_20pc];

select top (@evenSplit) *
into [DRV_BAR_TRAIN_20150505_Validation_20pc]
from #bottom40pc
order by Random_Num DESC 


DECLARE @train as int 
set @train = (select count(*) from [DRV_BAR_TRAIN_20150505_Train_60pc])
DECLARE @validation as int 
set @validation = (select count(*) from [DRV_BAR_TRAIN_20150505_Validation_20pc])
DECLARE @test as int 
set @test = (select count(*) from [DRV_BAR_TRAIN_20150505_Test_20pc])

DECLARE @total as int 
set @total = (select @train + @validation + @test)

select round(convert(float, @train)/convert(float, @total),3) as train_pc, round(convert(float, @validation)/convert( float, @total),3) as validation_pc, round(convert(float, @test)/convert(float, @total),3) as test_pc


select 'DRV_BAR_TRAIN_20150505_Train_60pc', count(*) as Counts from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DRV_BAR_TRAIN_20150505_Train_60pc'
select 'DRV_BAR_TRAIN_20150505_Validation_20pc', count(*) as Counts from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DRV_BAR_TRAIN_20150505_Validation_20pc'
select 'DRV_BAR_TRAIN_20150505_Test_20pc', count(*) as Counts from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DRV_BAR_TRAIN_20150505_Test_20pc'


-- Exec BLD_BAR_Train_Val_Test

--select count(*) from DRV_BAR_TRAIN_20150505_Train_60pc where outcome = '1.0'			-- # 277,574
--select count(*) from DRV_BAR_TRAIN_20150505_Validation_20pc where outcome = '1.0'		-- # 66,675
--select count(*) from DRV_BAR_TRAIN_20150505_Test_20pc where outcome = '1.0'				-- # 68,166

