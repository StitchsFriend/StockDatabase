/*
*Authors: Xuan Lu, Yueyi Sun
*All the data are collected from Yahoo finance
*/
/* CREATE DATABASE */
USE master;
GO

IF DB_ID('project') IS NOT NULL
	DROP DATABASE project;
GO

CREATE DATABASE project;
GO

USE project;
GO


/*CREATE TABLES AND INSERTING DATA*/
-- company table:
-- Basic information about companies
--	A stock symbol is a unique series of letters assigned to a security for trading purposes.
--	stock_symbol(PK), com_name, ipo_date, exchange, ipo_price, industry, country

DROP TABLE IF EXISTS company;
CREATE TABLE company (
	stock_symbol VARCHAR(10) PRIMARY KEY,
	com_name VARCHAR(100),
	ipo_date DATE NOT NULL,
	exchange VARCHAR(50) NOT NULL,
	ipo_price MONEY NOT NULL,
	industry VARCHAR(100) NOT NULL,
	country VARCHAR(50) NOT NULL
);
GO

INSERT INTO company
VALUES
('AMZN', 'Amazon.com, Inc.', '1997-05-15', 'The Nasdaq stock exchange', '18', 'Internet Retail', 'US'),
('APPL', 'Apple Inc.', '1980-12-12', 'The Nasdaq stock exchange', '22', 'Consumer Electronics', 'US'),
('BABA', 'Alibaba Group Holding Limited', '2014-09-19', 'The New York Stock Exchange', '68', 'Internet Retail', 'China'),
('WMT','Walmart Inc.', '1970-10-01','The Nasdaq stock exchange','16.5','retail enterprise','US'),
('NVDA', 'NVIDIA Corporation','1999-01-22', 'The Nasdaq stock exchange','12','Semiconductors','US'),
('TSLA', 'Tesla, Inc.','2010-06-29', 'The Nasdaq stock exchange','17','Auto Manufacturers','US'),
('NFLX', 'Netflix, Inc.','2002-05-23','The Nasdaq stock exchange', '15','Entertainment','US'),
('DIS', 'The Walt Disney Company', '1957-11-12', 'The New York Stock Exchange','13.88' ,'Entertainment', 'US'),
('MSFT', 'Microsoft Corporation', '1986-03-13', 'The Nasdaq stock exchange', '21', 'Software—Infrastructure', 'US'),
('ADBE', 'Adobe Inc.', '1986-08-20', 'The Nasdaq stock exchange', '11', 'Software—Infrastructure', 'US'),
('AMD', 'Advanced Micro Devices, Inc.', '1972-09-27', 'The New York Stock Exchange', '15.5', 'Semiconductors', 'US'),
('KO', 'The Coca-Cola Company', '1919-09-05', 'The New York Stock Exchange', '40', 'Beverages—Non-Alcoholic', 'US'),
('PG', 'The Procter & Gamble Company', '1978-01-13', 'The New York Stock Exchange', '100', 'Household & Personal Products', 'US'),
('JNJ', 'Johnson & Johnson', '1944-09-24', 'The Nasdaq stock exchange', '37.5', 'Drug Manufacturers—General', 'US'),
('PFE', 'Pfizer Inc.', '1942-06-22', 'The New York Stock Exchange', '24.75', 'Drug Manufacturers—General', 'US'),
('ZM', 'Zoom Video Communications, Inc.', '2019-04-18', 'The Nasdaq stock exchange', '36', 'Software—Application', 'US'),
('PYPL', 'PayPal Holdings, Inc.', '2002-02-15', 'The Nasdaq stock exchange', '13', 'Credit Services', 'US'),
('PEP', 'PepsiCo, Inc.', '1986-01-01', 'The Nasdaq stock exchange', '23', 'Beverages—Non-Alcoholic', 'US'),
('SBUX', 'Starbucks Corporation', '1992-06-26', 'The Nasdaq stock exchange', '17', 'Restaurants', 'US'),
('COST', 'Costco Wholesale Corporation', '1985-12-05', 'The Nasdaq stock exchange', '10', 'Discount Stores', 'US'),
('CSCO', 'Cisco Systems, Inc.', '1990-02-16', 'The Nasdaq stock exchange', '18', 'Communication Equipment', 'US'),
('INTC', 'Intel Corporation', '1971-10-13', 'The Nasdaq stock exchange', '23.5', 'Semiconductors', 'US'),
('FB', 'Meta Platforms, Inc.', '2012-05-18', 'The Nasdaq stock exchange', '38', 'Internet Content & Information', 'US'),
('GOOG', 'Alphabet Inc.', '2004-08-14', 'The Nasdaq stock exchange', '85', 'Internet Content & Information', 'US'),
('CMCSA', 'Comcast Corporation', '1972-06-29', 'The Nasdaq stock exchange', '7', 'Entertainment', 'US'),
('TXN', 'Texas Instruments Incorporated', '2012-01-03', 'The Nasdaq stock exchange', '29.6', 'Semiconductors', 'US'),
('TMUS', 'T-Mobile US, Inc.', '2013-05-01', 'The Nasdaq stock exchange', '25.1', 'Telecom Services', 'US'),
('V', 'Visa Inc.', '2008-03-19', 'The New York Stock Exchange', '44', 'Credit Services', 'US'),
('GM', 'General Motors Company', '2010-11-17', 'The New York Stock Exchange', '35', 'Auto Manufacturers', 'US'),
('GME', 'GameStop Corp.', '2002-02-12', 'The New York Stock Exchange', '18', 'Specialty Retail', 'US'),
('COF', 'Capital One Financial Corporation', '1994-11-16','The New York Stock Exchange', '16', 'Credit Services', 'US'),
('SNAP', 'Snap Inc. ', '2017-03-02', 'The New York Stock Exchange', '17', 'Internet Content & Information', 'US'),
('MA', 'Mastercard Incorporated', '2006-05-25', 'The New York Stock Exchange', '44', 'Credit Services', 'US'),
('UNH', 'UnitedHealth Group Incorporated', '1984-10-26', 'The New York Stock Exchange', '23.5', 'Semiconductors', 'US'),
('NKE', 'NIKE, Inc.', '1980-12-02', 'The New York Stock Exchange', '22', 'Footwear & Accessories', 'US'),
('MCD', 'McDonalds Corporation', '1965-04-21', 'The New York Stock Exchange', '22.5', 'Restaurants', 'US'),
('DASH', 'DrDash, Inc.','2020-12-09', 'The New York Stock Exchange', '102', 'Internet Content & Information', 'US'),
('PINS', 'Pinterest, Inc.', '2019-04-18', 'The New York Stock Exchange', '19', 'Internet Content & Information', 'US'),
('YELP', 'Yelp Inc.', '2012-03-02', 'The New York Stock Exchange', '15', 'Internet Content & Information', 'US'),
('TSM', 'Taiwan Semiconductor Manufacturing Company Limited', '1997-10-08', 'The New York Stock Exchange', '7', 'Semiconductors', 'US');
GO


-- income table:
--	income statement information about companies
--	Numbers are in thousand
--	publish_date(PK), stock_symbol(PK), total_revenue, gross_profit, operating_income, net_income
DROP TABLE IF EXISTS income;
CREATE TABLE income(
	publish_date DATE NOT NULL,
	stock_symbol VARCHAR(10) NOT NULL REFERENCES company(stock_symbol),
	total_revenue MONEY NOT NULL,
	gross_profit MONEY NOT NULL,
	operating_income MONEY NOT NULL,
	net_income MONEY NOT NULL,
	PRIMARY KEY (publish_date, stock_symbol)
);
GO

INSERT INTO income
VALUES
('2021-12-31', 'AMZN', 469833000, 66315000, 24879000, 33364000),
('2020-12-31', 'AMZN', 386064000, 51500000, 22899000, 21331000),
('2019-12-31', 'AMZN', 280522000, 38823000, 14541000, 11588000),
('2018-12-31', 'AMZN', 232887000, 30867000, 12421000, 10073000),

('2021-9-30', 'APPL', 365817000, 152836000, 108949000, 94680000),
('2020-9-30', 'APPL', 274515000, 104956000, 66288000, 57411000),
('2019-9-30', 'APPL', 260174000, 98392000, 63930000, 55256000),
('2018-9-30', 'APPL', 265595000, 101839000, 70898000, 59531000),

('2021-3-31', 'BABA', 717289000, 296084000, 89678000, 150578000),
('2020-3-31', 'BABA', 509711000, 227344000, 93004000, 149433000),
('2019-3-31', 'BABA', 376844000, 169915000, 57750000, 87886000),

('2022-1-31', 'WMT', 572754000, 143754000, 25942000, 13673000),
('2021-1-31', 'WMT', 559151000, 138836000, 22548000, 13510000),
('2020-1-31', 'WMT', 523964000, 129359000, 20568000, 14881000),
('2019-1-31', 'WMT', 514405000, 129104000, 21957000, 6670000),

('2022-1-31','NVDA',26914000, 17475000, 10041000, 9752000),
('2021-1-31','NVDA', 16675000, 10396000, 4532000, 4332000),
('2020-1-31','NVDA', 10918000, 6768000, 2846000, 2796000),
('2019-1-31','NVDA', 11716000, 7171000, 3804000, 4141000),

('2021-12-31','TSLA', 53823000, 13606000, 6496000, 5519000),
('2020-12-31','TSLA', 31536000, 6630000, 1994000, 690000),
('2019-12-31','TSLA', 24578000, 4069000, 80000, -862000),
('2018-12-31','TSLA', 21461268, 4042021, -252840, -976091),

('2021-12-31','NFLX', 29697844, 12365161, 6194509, 5116228),
('2020-12-31','NFLX', 24996056, 9719737, 4585289, 2761395),
('2019-12-31','NFLX', 20156447, 7716234, 2604254, 1866916),
('2018-12-31','NFLX', 15794341, 5826803, 1605226, 1211242),

('2021-09-30','DIS', 67418000, 22287000, 3659000, 2024000),
('2020-09-30','DIS', 65388000, 21508000, 3794000, -2832000),
('2019-09-30','DIS', 69570000, 27552000, 11851000, 10383000),
('2018-09-30','DIS', 59434000, 26708000, 14837000, 12598000),

('2021-06-30','MSFT', 168088000, 115856000, 69916000, 61271000),
('2020-06-30','MSFT', 143015000, 96937000, 52959000, 44281000),
('2019-06-30','MSFT', 125843000, 82933000, 42959000, 39240000),
('2018-06-30','MSFT', 110360000, 72007000, 35058000, 16571000),

('2021-11-30','ADBE', 15785000, 13920000,5802000, 4822000),
('2020-11-30','ADBE', 12868000, 11146000, 4237000, 5260000),
('2019-11-30','ADBE', 11171297, 9498577, 3268121, 2951458),
('2018-11-30','ADBE', 9030008, 7835009, 2840369, 2590774),

('2021-12-31','AMD', 16434000, 7929000, 3648000, 3162000),
('2020-12-31','AMD', 9763000, 4347000, 1369000, 2490000),
('2019-12-31','AMD', 6731000, 2868000, 631000, 341000),
('2018-12-31','AMD', 6475000, 2447000, 451000, 337000),

('2021-12-31','KO', 38655000, 23298000, 11039000, 9771000),
('2020-12-31','KO', 33014000, 19581000, 9725000, 7747000),
('2019-12-31','KO', 37266000, 22647000, 10269000, 8920000),
('2018-12-31','KO', 31856000, 20086000, 10269000, 6685000),

('2021-06-30','PG', 76118000, 39010000, 17986000, 14306000),
('2020-06-30','PG', 70950000, 35700000, 15706000, 13027000),
('2019-06-30','PG', 67684000, 32916000, 13832000, 3897000),
('2018-06-30','PG', 66832000, 32564000, 13711000, 9750000),

('2021-12-31','JNJ', 93775000, 63920000, 24547000, 20878000),
('2020-12-31','JNJ', 82584000, 54157000, 19914000, 14714000),
('2019-12-31','JNJ', 82059000, 54503000, 20970000, 15119000),
('2018-12-31','JNJ', 81581000, 54490000, 21175000, 15297000),

('2021-12-31','PFE', 81288000, 50467000, 20235000, 22413000),
('2020-12-31','PFE', 41908000, 33216000, 8760000, 6985000),
('2019-12-31','PFE', 51750000, 41531000, 13921000, 16269000),
('2018-12-31','PFE', 53647000, 42399000, 15045000, 11143000)

GO

--balance table:
--balance statements about companies
--Numbers are in thousand
--publish_date(PK), stock_symbol(PK), total_assets, total_liabilities, total_equity, working_capital
DROP TABLE IF EXISTS balance;
CREATE TABLE balance(
	publish_date DATE NOT NULL,
	stock_symbol VARCHAR(10) NOT NULL REFERENCES company (stock_symbol),
	total_assets MONEY NOT NULL,
	total_liabilities MONEY NOT NULL,
	total_equity MONEY NOT NULL,
	working_capital MONEY NOT NULL,
	PRIMARY KEY (publish_date, stock_symbol)
);

INSERT INTO balance
VALUES
('2021-12-31', 'AMZN', 420549000, 282304000, 138245000, 19314000),
('2020-12-31', 'AMZN', 321195000,  227791000, 93404000, 6348000),
('2019-12-31', 'AMZN', 225248000, 163188000, 62060000, 8522000),
('2018-12-31', 'AMZN', 162648000, 119099000, 43549000, 6710000),

('2021-9-30', 'APPL', 351002000, 287912000, 63090000, 9355000 ),
('2020-9-30', 'APPL', 323888000, 258549000, 65339000, 38321000),
('2019-9-30', 'APPL', 338516000, 248028000, 90488000, 57101000),
('2018-9-30', 'APPL', 365725000, 258578000, 107147000, 14473000),

('2021-3-31', 'BABA', 1690218000, 615257000,1074961000, 266002000),
('2020-3-31', 'BABA', 1312985000, 442437000,870548000, 221051000),
('2019-3-31', 'BABA', 965076000, 356493000, 608583000, 62604000),

('2022-1-31', 'WMT', 244860000, 152969000, 91891000, -6309000),
('2021-1-31', 'WMT', 252496000, 164965000, 87531000, -2578000),
('2020-1-31', 'WMT', 236495000, 154943000, 81552000, -15984000),
('2019-1-31', 'WMT', 219295000, 139661000, 79634000, -15580000),

('2022-1-31','NVDA', 44187000, 17575000, 26612000, 24494000),
('2021-1-31','NVDA', 28791000, 11898000, 16893000, 12130000),
('2020-1-31','NVDA', 17315000, 5111000, 12204000, 11906000),
('2019-1-31','NVDA', 13292000, 3950000, 9342000, 9228000),

('2021-12-31','TSLA', 62131000, 31116000, 31015000, 7395000),
('2020-12-31','TSLA', 52148000, 29073000, 23075000, 12469000),
('2019-12-31','TSLA', 34309000, 26842000, 7467000, 1436000),
('2018-12-31','TSLA', 29739614, 23981974, 5757640, -1685828),

('2021-12-31','NFLX', 44584663, 28735415, 15849248, -419141),
('2020-12-31','NFLX', 39280359, 28215119, 11065240, 1955795),
('2019-12-31','NFLX', 33975712, 26393555, 7582157, -677192),
('2018-12-31','NFLX', 25974400, 20735635, 5238765, 3206815),

('2021-09-30','DIS', 203609000, 110598000, 93011000, 2580000),
('2020-09-30','DIS', 201549000, 113286000, 88263000, 8623000),
('2019-09-30','DIS', 193984000, 100095000,93889000, -3217000),
('2018-09-30','DIS', 98598000, 45766000, 52832000, -1035000),

('2021-06-30','MSFT', 333779000, 191791000, 141988000, 95749000),
('2020-06-30','MSFT', 301311000, 183007000, 118304000, 109605000),
('2019-06-30','MSFT', 286556000, 184226000, 102330000, 106132000),
('2018-06-30','MSFT', 258848000, 176130000, 82718000, 111174000),

('2021-11-30','ADBE', 27241000, 12444000, 14797000, 1737000),
('2020-11-30','ADBE', 24284000, 11020000, 13264000, 2634000),
('2019-11-30','ADBE', 20762400, 10232245, 10530155, -1696013),
('2018-11-30','ADBE', 18768682, 9406568, 9362114, 555913),

('2021-12-31','AMD', 12419000, 4922000, 7497000, 4343000),
('2020-12-31','AMD', 8962000, 3125000, 5837000, 3726000),
('2019-12-31','AMD', 6028000, 3201000, 2827000, 2238000),
('2018-12-31','AMD', 4556000, 3290000, 1266000, 1556000),

('2021-12-31','KO', 94354000, 69494000, 24860000,2595000),
('2020-12-31','KO', 87296000, 66012000, 21284000, 4639000),
('2019-12-31','KO', 86381000, 65283000, 21098000, -6562000),
('2018-12-31','KO', 83216000, 64158000, 19058000, 1411000),

('2021-06-30','PG', 119307000, 72653000, 46654000, -10041000),
('2020-06-30','PG', 120700000, 73822000, 46654000, -4989000),
('2019-06-30','PG', 115095000, 67516000, 47579000, -7538000),
('2018-06-30','PG', 118310000, 65427000, 52883000, -4917000),

('2021-12-31','JNJ', 182018000, 107995000, 74023000, 15753000),
('2020-12-31','JNJ', 174894000, 111616000, 63278000, 8744000),
('2019-12-31','JNJ', 157728000, 98257000, 59471000, 9310000),
('2018-12-31','JNJ', 152954000, 93202000, 59752000,14803000),

('2021-12-31','PFE', 181476000, 104014000, 77462000, 17022000),
('2020-12-31','PFE', 154229000, 90756000, 63473000, 9147000),
('2019-12-31','PFE', 167489000, 104042000, 63447000, -4501000),
('2018-12-31','PFE', 159422000, 95664000, 63758000, 18068000)

GO


-- history table:
--	historical trading price
--	Numbers are in thousand
--	stock_symbol(PK), trading_date(PK), open_price, max_price, min_price, close_price, volume
DROP TABLE IF EXISTS history;
CREATE TABLE history (
	stock_symbol VARCHAR(10) NOT NULL REFERENCES company (stock_symbol),
	trading_date DATE NOT NULL,
	open_price MONEY NOT NULL,
	max_price MONEY NOT NULL,
	min_price MONEY NOT NULL,
	close_price MONEY NOT NULL,
	volume MONEY NOT NULL,
	PRIMARY KEY (trading_date, stock_symbol)
);


INSERT INTO history
VALUES
('AMZN', '2021-12-01', 3545.00, 3559.88, 3303.90, 3334.34, 64381700),
('AMZN', '2021-11-01', 3361.80, 3762.15, 3283.55, 3507.07, 75799500),
('AMZN', '2021-10-01', 3289.01, 3479.00, 3176.25, 3372.43, 63673300),
('AMZN', '2021-9-01', 3496.40, 3549.99, 3273.99, 3285.04, 62527700),
('AMZN', '2021-8-01', 3553.10, 3472.58, 3175.76, 3470.79, 62848200),
('AMZN', '2021-7-01', 3434.61, 3773.08, 3306.98, 3327.59, 83729300),
('AMZN', '2021-6-01', 3243.50, 3524.86, 3172.20, 3440.16, 67011000),
('AMZN', '2021-5-01', 3484.73, 3486.65, 3127.37, 3223.07, 75183900),
('AMZN', '2021-4-01', 3117.94, 3554.00, 3115.55, 3467.42, 76839600),
('AMZN', '2021-3-01', 3127.89, 3182.00, 2881.00, 3094.08, 78188000),
('AMZN', '2021-2-01', 3242.36, 3434.00, 3036.70, 3092.93, 72107000),
('AMZN', '2021-1-01', 3270.00, 3363.89, 3086.00, 3206.20, 71528900),
('AMZN', '2020-12-01', 3188.50, 3350.65, 3072.82, 3256.93, 77556200),
('AMZN', '2020-11-01', 3061.74, 3366.80, 2950.12, 3168.04, 90810500),
('AMZN', '2020-10-01', 3208.00, 3496.24, 3019.00, 3036.15, 116226100),
('AMZN', '2020-8-01', 3180.51, 3495.00, 3073.00, 3450.96, 83516600),
('AMZN', '2020-7-01', 2757.99, 3344.29, 2754.00, 3164.68, 127502000),
('AMZN', '2020-6-01', 2448.00, 2796.00, 2437.13, 2758.82, 87818300),
('AMZN', '2020-5-01', 2336.80, 2525.45, 2256.38, 2442.37, 82584400),

('NVDA', '2021-12-01', 332.19, 332.89, 271.45, 294.11, 1105850500),
('NVDA', '2021-11-01', 256.49, 346.47, 252.27, 326.76, 1081117000),
('NVDA', '2021-10-01', 207.50, 257.09, 195.55, 255.67, 497107800),
('NVDA', '2021-9-01', 224.85, 229.86, 204.67, 207.16, 499898600),
('NVDA', '2021-8-01', 197.00, 230.43, 187.62, 223.85, 641638600),
('NVDA', '2021-7-01', 201.25, 208.75, 178.65, 194.99, 782307700),
('NVDA', '2021-6-01', 162.70, 201.63, 159.03, 200.02, 1027329200),
('NVDA', '2021-5-01', 151.25, 162.77, 134.59, 162.45, 705438000),
('NVDA', '2021-4-01', 135.72, 162.14, 135.11, 150.10, 671879600),
('NVDA', '2021-3-01', 138.75, 139.25, 115.67, 133.48, 764865600),
('NVDA', '2021-2-01', 130.53, 153.73, 129.03, 137.15, 668032400),
('NVDA', '2021-1-01', 131.04, 139.99, 125.86, 129.90, 615417200),
('NVDA', '2020-12-01', 134.92, 137.31, 127.63, 130.55, 512099600),
('NVDA', '2020-11-01', 126.58, 146.91, 123.95, 134.01, 759482000),
('NVDA', '2020-10-01', 137.58, 143.49, 123.00, 125.34, 802235600),
('NVDA', '2020-9-01', 134.80, 147.27, 117.04, 135.30, 1585655200),
('NVDA', '2020-8-01', 107.32, 135.75, 107.15, 133.74, 967254400),
('NVDA', '2020-7-01', 95.21, 107.92, 94.13, 106.15, 809445200),
('NVDA', '2020-6-01', 88.33, 96.43, 86.58, 94.98,  971946400),
('NVDA', '2020-5-01', 71.09, 91.82, 70.21, 88.75, 1254887600)

GO


/*12 Queries*/

--Query 1 Annual growth rate of gross profit of company apple (income table)
WITH apple_revenue AS (
	SELECT total_revenue,YEAR(publish_date) AS [Year]
	FROM income
	WHERE stock_symbol = 'APPL'
)
SELECT this_year.Year,
	(this_year.total_revenue - last_year.total_revenue) / last_year.total_revenue * 100 AS [growth rate of total revenue in percentage]
FROM apple_revenue AS this_year JOIN apple_revenue AS last_year ON this_year.year = last_year.year + 1;


--Query 2 Amazon's highest, lowest, and average opening price for year 2021 (histry table)
SELECT MAX(close_price ) AS [Highest closing price], MIN(close_price ) AS [Lowest closing price], AVG(close_price) AS [Average closing price]
FROM history
WHERE stock_symbol = 'AMZN'  AND YEAR(trading_date) = 2021;

--Query 3 Yearly closing price change in 2021 for each company (histry table)
WITH max_min_date (first_date, last_date)
-- we have weekends and holidays, which are not trading days.
AS (
	SELECT MIN(trading_date) AS first_date, MAX(trading_date) AS last_date
	FROM history
	WHERE YEAR(trading_date) = 2021
)
SELECT first_price.stock_symbol,
	(last_price.close_price - first_price.close_price ) / first_price.close_price * 100 AS [Yearly Price Change in %]
FROM history AS first_price JOIN history AS last_price
ON first_price.stock_symbol = last_price.stock_symbol
WHERE first_price.trading_date = (SELECT first_date FROM max_min_date)
	AND last_price.trading_date = (SELECT last_date FROM max_min_date);


--Query 4 Counting the # of companies in different industry (company table)
SELECT industry, COUNT(stock_symbol) AS [count]
FROM company
GROUP BY industry;

--Query 5 The average annual growth rate of stock price
SELECT c.stock_symbol,
	ipo_date,
	ipo_price,
	(SELECT MAX(trading_date) FROM history) AS [current_date], close_price,
	POWER(close_price- ipo_price, 1.0 / DATEDIFF(YEAR, ipo_date,
	(SELECT MAX(trading_date) FROM history))) * 100 AS [Annual growth rate since ipo]
	 FROM company c, history h
	 WHERE c.stock_symbol = h.stock_symbol
	 AND h.trading_date = (SELECT MAX(trading_date) FROM history);

--Query 6 Display the stock_symbol, com_name, industry,  closing price with volume  in excess of 100000000 in Dec 2021.
SELECT h. stock_symbol, com_name, industry,  close_price, volume
FROM history h ,company c
where h.stock_symbol= c.stock_symbol
AND volume > 100000000
AND month(trading_date)= 12
AND year(trading_date)= 2021;


--Query 7 Calculate return on equity (ROE) on each company in year 2021 (ROE = Net Income / Total Equity)
SELECT i.stock_symbol, i.net_income / b.total_equity AS ROE
FROM income AS i, balance AS b
WHERE i.publish_date = b.publish_date
	AND i.stock_symbol = b.stock_symbol
	AND year(i.publish_date) = 2021
	AND year(b.publish_date) = 2021
ORDER BY ROE DESC;


--Query 8 Find the highest, average, lowest ROE in 2021 in each industry
SELECT industry, MAX(ROE) AS [highest ROE], MIN(ROE) AS [lowest ROE], AVG(ROE) AS [average ROE]
FROM (
	SELECT industry, com_name, i.net_income / b.total_equity AS [ROE]
	FROM balance b JOIN income i
	ON b.stock_symbol = i.stock_symbol
		AND b.publish_date = i.publish_date
	    JOIN company c
	ON c.stock_symbol = b.stock_symbol
) t
GROUP BY industry
ORDER BY industry;


--Query 9 Add “IC-” before company in Internet Contect & Information industry (company table)
UPDATE company
 SET com_name = concat('IC-', TRIM(com_name))
WHERE industry = 'Internet Content & Information';

SELECT com_name,industry
FROM company
WHERE industry = 'Internet Content & Information';


--Query 10 Display companies in entertainment industry in 2021, sorted by total_revenue (company table, income table)
SELECT DISTINCT com_name, total_revenue
FROM company c, income i
WHERE c.stock_symbol= i.stock_symbol
 AND industry ='Entertainment'
 AND YEAR(publish_date) = 2021
ORDER BY total_revenue DESC;


--Query 11 Fine the highest, lowest and average ipo_price of each company(company table)
SELECT MAX(ipo_price) AS [max ipo price], MIN(ipo_price) AS [min ipo price], AVG(ipo_price) AS [average ipo price]
FROM company
GROUP BY com_name;


--Query 12 Display all companies and industry which ipo_price is greater than average ipo_price (company table)
SELECT com_name, industry
FROM company
WHERE ipo_price >
	(SELECT AVG(ipo_price) FROM company);

GO

/*4 Functions*/
--Function to get company with a revenue over million in 2021
CREATE OR ALTER FUNCTION fn_total_revenue_2021
	(@cutoff MONEY = 0)
	RETURNS table
RETURN
SELECT com_name, total_revenue
FROM income i  JOIN company c ON i.stock_symbol = c.stock_symbol
WHERE i.publish_date >= '2020-12-31' AND publish_date < '2021-12-31'
	AND total_revenue >= @cutoff;
GO
--test
SELECT * FROM dbo.fn_total_revenue_2021(1000000) ORDER BY total_revenue DESC;
GO

--Function to calculate MA5 (Under different time frame, moving averages represent prices averaged over different period of time.
--For example, if we choose the 4-hour candle, MA5 is the average closing price of 5 Candlesticks, which means is no more than 20 hours)
CREATE OR ALTER FUNCTION fn_MA5(@stock_symbol VARCHAR(10))
RETURNS @out_table TABLE (
	trading_date DATE,
	close_price MONEY,
	MA5 MONEY
)
AS
BEGIN
	INSERT @out_table
	SELECT trading_date,close_price ,
	 AVG(close_price ) OVER (ORDER BY trading_date ASC ROWS 4 PRECEDING) AS MA5
	FROM history
	WHERE stock_symbol = @stock_symbol;
	RETURN;
END;
GO
-- test GET MA5 for AMAZON
SELECT * FROM dbo.fn_MA5('AMZN');
GO


--Function to get the information of company
CREATE OR ALTER FUNCTION fn_companyInfo(@stock_symbol VARCHAR(10))
 RETURNS TABLE
 RETURN
 (SELECT com_name, c.stock_symbol, ipo_date, ipo_price, total_revenue, net_income, industry, country
 FROM company c, income i
 WHERE c.stock_symbol = i.stock_symbol
 AND i.stock_symbol = @stock_symbol
 AND YEAR(publish_date) = 2021)
 Go

-- test
SELECT * FROM dbo.fn_companyInfo('AMZN');
SELECT * FROM dbo.fn_companyInfo('APPL');
GO


--Function to get price change in one day
CREATE OR ALTER FUNCTION PriceChange
 (@Cutoff money = 0)
 RETURNS TABLE
 RETURN (SELECT stock_symbol, SUM(max_price-min_price) AS 'Today price change'
   FROM history
   GROUP BY stock_symbol
   HAVING SUM(max_price-min_price) >= @CutOff);
Go

--test
SELECT * FROM dbo.PriceChange(500);
GO


/*4 Stored Procedures*/
--Procedure spAmazonInfoCopy - a table contains Amazon’s data in both income and company table
IF OBJECT_ID('spAmazonInfoCopy') IS NOT NULL
	DROP PROC spAmazonInfoCopy;
GO

CREATE PROC spAmazonInfoCopy
AS
	IF OBJECT_ID('AmazonInfoCopy') IS NOT NULL
		DROP TABLE AmazonInfoCopy;
	SELECT i.publish_date, i.stock_symbol, total_revenue, gross_profit, operating_income, net_income,
		total_assets, total_liabilities, total_equity, working_capital
	INTO AmazonInfoCopy
	FROM income i  join balance b
		ON i .stock_symbol = b.stock_symbol
	WHERE b.stock_symbol = 'AMZN';
GO
--test
EXEC spAmazonInfoCopy;
SELECT * FROM AmazonInfoCopy;
GO


--Procedure to compute average of total revenue for a company
IF OBJECT_ID('spAVG_TotalIncome') IS NOT NULL
	DROP PROC spAVG_TotalIncome;
GO

CREATE PROC spAVG_TotalIncome
	@STOCK_SYMBOL VARCHAR(10),
	@AvgTotalIncome MONEY OUTPUT
AS
	SELECT @AvgTotalIncome = AVG(net_income)
	FROM income
	WHERE stock_symbol = @STOCK_SYMBOL;
GO
--test
DECLARE @AvgTotalIncomeForAlibaba MONEY;
EXEC spAVG_TotalIncome 'BABA', @AvgTotalIncomeForAlibaba OUTPUT;
PRINT @AvgTotalIncomeForAlibaba ;
GO


--Procedure for companies with positive net_income
IF OBJECT_ID('companies_balance') IS NOT NULL
	DROP PROC companies_balance;
GO

CREATE PROC companies_balance
AS
SELECT i.stock_symbol, i.publish_date, i.total_revenue, i.gross_profit,
	i.operating_income, i.net_income, b.total_assets, b.total_equity, b.total_liabilities,
	b.working_capital
FROM balance AS b JOIN income AS i
	ON b.stock_symbol = i.stock_symbol AND b.publish_date = i.publish_date
WHERE net_income > 0
AND YEAR(i.publish_date) = 2021
ORDER BY stock_symbol DESC, publish_date;
GO
-- test
EXEC companies_balance;
GO


--Procedure to check the validation of the stock symbol
IF OBJECT_ID('xyz') IS NOT NULL
	DROP PROC xyz;
GO

CREATE PROC xyz
	@publish_date DATE,
	@stock_symbol VARCHAR(10),
	@total_assets MONEY,
	@total_liabilities MONEY,
	@total_equity MONEY,
	@working_capital MONEY
AS
	IF EXISTS(SELECT * FROM balance WHERE stock_symbol = @stock_symbol)
		INSERT balance
		VALUES(@publish_date, @stock_symbol, @total_assets, @total_equity, @total_liabilities,NULL);
	ELSE
		THROW 50001, 'Not a valid Stock Symbol!', 1;
GO

BEGIN TRY
	EXEC xyz '2021-06-06','ZZZ',111,222,333,444; -- throw an error since ZZZ doesn't exist in the balance table.
	PRINT 'Record added!';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'Please double check the Information';
END CATCH;
GO


/*4 Triggers*/
--Instead of deleting rows, setting the cells to null
IF OBJECT_ID('AmazonInfoCopy_DELETE') IS NOT NULL
	DROP TRIGGER AmazonInfoCopy_DELETE;
GO

CREATE OR ALTER TRIGGER AmazonInfoCopy_DELETE
	ON AmazonInfoCopy
	INSTEAD OF DELETE
AS
	UPDATE AmazonInfoCopy
	SET total_revenue = 0.00,
		gross_profit = 0.00,
		operating_income = 0.00,
		net_income = 0.00,
		total_assets = 0.00,
		total_liabilities = 0.00,
		total_equity = 0.00,
		working_capital = 0.00,
		stock_symbol = 'deleted'
	WHERE publish_date IN (SELECT publish_date FROM Deleted);
GO

DELETE FROM AmazonInfoCopy
WHERE publish_date = '2020-12-31';

SELECT * FROM AmazonInfoCopy;
GO


--Updating the stock_symbol
IF OBJECT_ID('AmazonInfoCopy_UPDATE') IS NOT NULL
	DROP TRIGGER AmazonInfoCopy_UPDATE;
GO

CREATE OR ALTER TRIGGER AmazonInfoCopy_UPDATE
	ON AmazonInfoCopy
	AFTER UPDATE
AS
	UPDATE AmazonInfoCopy
	SET stock_symbol = 'updated'
	WHERE publish_date IN (SELECT publish_date FROM inserted);
GO

UPDATE AmazonInfoCopy
SET total_revenue = 666
WHERE publish_date = '2018-12-31';

SELECT * FROM AmazonInfoCopy;
GO


-- 	Create a trigger to protect data from income_statementBackup
SELECT *
INTO income_statementBackup
FROM income;

CREATE TABLE income_statementArchive (
	publish_date DATE NOT NULL,
	stock_symbol VARCHAR(10) NOT NULL,
	total_revenue MONEY NOT NULL,
	gross_profit MONEY NOT NULL,
	operating_income MONEY NOT NULL,
	net_income MONEY NOT NULL,
);
GO

CREATE OR ALTER TRIGGER income_statement_DELETE
	ON income_statementBackup
	AFTER DELETE
AS
	INSERT INTO income_statementArchive(
		publish_date, stock_symbol, total_revenue, gross_profit,
		operating_income, net_income)
	SELECT publish_date, stock_symbol, total_revenue, gross_profit, operating_income, net_income
	FROM deleted;
GO

SELECT * FROM income_statementBackup;

DELETE FROM income_statementBackup
WHERE stock_symbol ='AMZN';

SELECT * FROM income_statementArchive;
GO


--A DDL run in response to CREATE, ALTER, DROP statements
IF OBJECT_ID('tempdb..DDL') IS NOT NULL
    DROP TABLE DDL;
GO

CREATE TABLE DDL (
   EventData xml,
   EventType varchar(20)
);
GO

IF OBJECT_ID('Database_CreateTable_DropTable') IS NOT NULL
	DROP TRIGGER Database_CreateTable_DropTable;
GO

CREATE OR ALTER TRIGGER Database_CreateTable_DropTable
	ON DATABASE
	AFTER CREATE_TABLE, DROP_TABLE
AS
	DECLARE @EventData xml;
	DECLARE @EventType varchar(20);

	SELECT @EventData = EVENTDATA();
	SET @EventType = @EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(100)');

	INSERT INTO DDL (EventType, EventData)
	VALUES(@EventType, @EventData);
GO

IF OBJECT_ID('income_statmentTest') IS NOT NULL
    DROP TABLE income_statmentTest;
CREATE TABLE income_statmentTest (ID int, Name varchar(50));
DROP TABLE IF EXISTS income_statmentTest;

SELECT * FROM DDL;
