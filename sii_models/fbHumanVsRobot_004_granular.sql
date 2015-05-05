-- SAP InfiniteInsight - 0020113175 Luxottica Retail Australia Pty 7.0.0 - Copyright 2014 SAP AG or an SAP affiliate company. All rights reserved. - Model built in 7.0.0 - Model Name is fbHumanVsRobot_004_granular - Model Version is 1
DECLARE @t TABLE(bidder_id nvarchar(50), "rr_outcome" FLOAT)
INSERT INTO @t
SELECT bidder_id, 
(
 CAST( (CASE 
WHEN ( "num_distinct_referrer_url_max" IS NULL ) THEN 2.609947111956e-2
WHEN "num_distinct_referrer_url_max" <= 1.0e0 THEN 7.491008657488e-2
WHEN "num_distinct_referrer_url_max" <= 6.0e0 THEN  ( 2.372518479062e-5*"num_distinct_referrer_url_max"+7.48863613901e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 7.0e0 THEN 1.271337113842e-1
WHEN "num_distinct_referrer_url_max" <= 8.0e0 THEN  ( 2.789928007418e-2*"num_distinct_referrer_url_max"-6.816124912988e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 1.0e1 THEN  ( 2.789928007418e-2*"num_distinct_referrer_url_max"-6.816124912467e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 1.5e1 THEN  ( -1.118422608139e-2*"num_distinct_referrer_url_max"+3.514665773405e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 1.7e1 THEN  ( -9.259370886671e-2*"num_distinct_referrer_url_max"+1.603830447072e0 ) 
WHEN "num_distinct_referrer_url_max" <= 2.0e1 THEN  ( -1.594380936751e-2*"num_distinct_referrer_url_max"+1.614218552787e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 2.1e1 THEN -1.350859733013e-1
WHEN "num_distinct_referrer_url_max" <= 2.3e1 THEN  ( 2.731190972609e-2*"num_distinct_referrer_url_max"-7.086360775453e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 3.4e1 THEN  ( 3.318165203612e-3*"num_distinct_referrer_url_max"-1.567799535243e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 6.4e1 THEN  ( 5.813749954539e-4*"num_distinct_referrer_url_max"-6.112549625783e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 1.02e2 THEN  ( 4.471964761364e-4*"num_distinct_referrer_url_max"-5.25380710198e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 1.12e2 THEN  ( 6.545964036873e-3*"num_distinct_referrer_url_max"-6.761544590368e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 1.21e2 THEN  ( 6.989614715033e-3*"num_distinct_referrer_url_max"-7.258433349842e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 1.3e2 THEN  ( 6.989614715033e-3*"num_distinct_referrer_url_max"-7.258433349779e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 1.4e2 THEN  ( -6.369142731855e-3*"num_distinct_referrer_url_max"+1.014171157431e0 ) 
WHEN "num_distinct_referrer_url_max" <= 1.48e2 THEN  ( -1.035974225587e-2*"num_distinct_referrer_url_max"+1.573641704795e0 ) 
WHEN "num_distinct_referrer_url_max" <= 1.96e2 THEN  ( -1.658081972876e-3*"num_distinct_referrer_url_max"+2.857959829036e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 2.44e2 THEN  ( -1.658081972876e-3*"num_distinct_referrer_url_max"+2.857959828956e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 2.66e2 THEN  ( 3.69474664293e-3*"num_distinct_referrer_url_max"-1.022167207786e0 ) 
WHEN "num_distinct_referrer_url_max" <= 2.85e2 THEN  ( 5.203753085964e-3*"num_distinct_referrer_url_max"-1.424197201838e0 ) 
WHEN "num_distinct_referrer_url_max" <= 2.98e2 THEN  ( 7.421289662963e-3*"num_distinct_referrer_url_max"-2.056195126273e0 ) 
WHEN "num_distinct_referrer_url_max" <= 3.13e2 THEN  ( 5.29570205489e-3*"num_distinct_referrer_url_max"-1.422748505523e0 ) 
WHEN "num_distinct_referrer_url_max" <= 3.2e2 THEN  ( -1.194334421042e-2*"num_distinct_referrer_url_max"+3.980337691825e0 ) 
WHEN "num_distinct_referrer_url_max" <= 3.27e2 THEN  ( -1.194334421042e-2*"num_distinct_referrer_url_max"+3.980337691816e0 ) 
WHEN "num_distinct_referrer_url_max" <= 3.81e2 THEN  ( -1.465546676639e-3*"num_distinct_referrer_url_max"+5.54097898262e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 4.65e2 THEN  ( -6.128584269601e-4*"num_distinct_referrer_url_max"+2.287500125535e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 4.76e2 THEN  ( -4.419860133262e-3*"num_distinct_referrer_url_max"+1.999005805978e0 ) 
WHEN "num_distinct_referrer_url_max" <= 5.31e2 THEN  ( -1.898042777609e-4*"num_distinct_referrer_url_max"-1.853700331799e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 5.43e2 THEN  ( 1.014183676736e-3*"num_distinct_referrer_url_max"-6.5844088283e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 5.55e2 THEN  ( 1.014183676736e-3*"num_distinct_referrer_url_max"-6.584408828288e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 6.34e2 THEN  ( 1.709296565928e-4*"num_distinct_referrer_url_max"-1.904349016481e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 7.13e2 THEN  ( 1.709296565928e-4*"num_distinct_referrer_url_max"-1.904349016467e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 7.64e2 THEN  ( -2.050586435516e-4*"num_distinct_referrer_url_max"+7.772240030142e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 8.15e2 THEN  ( -2.050586435516e-4*"num_distinct_referrer_url_max"+7.772240030037e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 9.23e2 THEN  ( -8.384453897517e-5*"num_distinct_referrer_url_max"-2.106709493035e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 1.031e3 THEN  ( -8.384453897517e-5*"num_distinct_referrer_url_max"-2.106709493126e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 1.213e3 THEN  ( 8.77021092754e-5*"num_distinct_referrer_url_max"-1.980172393317e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 1.285e3 THEN  ( 4.383777213186e-4*"num_distinct_referrer_url_max"-6.235646656709e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 1.692e3 THEN  ( 9.640218698538e-5*"num_distinct_referrer_url_max"-1.841261040488e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 2.1e3 THEN  ( 9.640218698538e-5*"num_distinct_referrer_url_max"-1.841261040449e-1 ) 
WHEN "num_distinct_referrer_url_max" <= 2.727e3 THEN  ( -2.354701986453e-5*"num_distinct_referrer_url_max"+6.786209039196e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 3.355e3 THEN  ( -2.354701986453e-5*"num_distinct_referrer_url_max"+6.786209039048e-2 ) 
WHEN "num_distinct_referrer_url_max" <= 3.356e3 THEN  ( -1.771691799394e-2*"num_distinct_referrer_url_max"+5.94291217084e1 ) 
WHEN "num_distinct_referrer_url_max" <= 5.026e3 THEN  ( 2.372518479062e-5*"num_distinct_referrer_url_max"-1.203807723862e-1 ) 
ELSE -1.137993628575e-3
END) AS FLOAT)+
 CAST( (CASE 
WHEN ( "num_distinct_referrer_url_avg" IS NULL ) THEN 2.579429263643e-2
WHEN "num_distinct_referrer_url_avg" <= 1.0e0 THEN 9.142348713509e-2
WHEN "num_distinct_referrer_url_avg" <= 2.0e0 THEN -2.9594049747e-2
WHEN "num_distinct_referrer_url_avg" <= 3.0e0 THEN 2.43691608872e-2
WHEN "num_distinct_referrer_url_avg" <= 4.0e0 THEN 1.660899139716e-2
WHEN "num_distinct_referrer_url_avg" <= 5.0e0 THEN -4.634181324333e-2
WHEN "num_distinct_referrer_url_avg" <= 6.0e0 THEN 8.855352514754e-3
WHEN "num_distinct_referrer_url_avg" <= 7.0e0 THEN 2.946048410359e-2
WHEN "num_distinct_referrer_url_avg" <= 8.0e0 THEN -9.003184465391e-3
WHEN "num_distinct_referrer_url_avg" <= 9.0e0 THEN 4.908415233851e-2
WHEN "num_distinct_referrer_url_avg" <= 1.0e1 THEN -2.135734648518e-3
WHEN "num_distinct_referrer_url_avg" <= 1.1e1 THEN -6.736397310988e-3
WHEN "num_distinct_referrer_url_avg" <= 1.2e1 THEN 1.495044741187e-2
WHEN "num_distinct_referrer_url_avg" <= 1.3e1 THEN 2.82515967839e-2
WHEN "num_distinct_referrer_url_avg" <= 1.4e1 THEN -2.016860504367e-2
WHEN "num_distinct_referrer_url_avg" <= 1.5e1 THEN -2.965978864563e-2
WHEN "num_distinct_referrer_url_avg" <= 1.6e1 THEN  ( 1.495245809453e-2*"num_distinct_referrer_url_avg"-2.539466600611e-1 ) 
WHEN "num_distinct_referrer_url_avg" <= 1.8e1 THEN  ( 1.495245809453e-2*"num_distinct_referrer_url_avg"-2.539466600584e-1 ) 
WHEN "num_distinct_referrer_url_avg" <= 1.9e1 THEN 6.53222615213e-3
WHEN "num_distinct_referrer_url_avg" <= 2.0e1 THEN -2.525071273305e-2
WHEN "num_distinct_referrer_url_avg" <= 2.3e1 THEN  ( 6.777513070218e-4*"num_distinct_referrer_url_avg"-6.337206813463e-2 ) 
WHEN "num_distinct_referrer_url_avg" <= 2.4e1 THEN -4.654223278179e-2
WHEN "num_distinct_referrer_url_avg" <= 2.5e1 THEN -4.473265000722e-2
WHEN "num_distinct_referrer_url_avg" <= 3.1e1 THEN  ( 9.830124022886e-4*"num_distinct_referrer_url_avg"-6.930796006376e-2 ) 
WHEN "num_distinct_referrer_url_avg" <= 3.8e1 THEN  ( 9.830124022886e-4*"num_distinct_referrer_url_avg"-6.930796006309e-2 ) 
WHEN "num_distinct_referrer_url_avg" <= 4.3e1 THEN  ( 7.31800543152e-4*"num_distinct_referrer_url_avg"-5.957732688058e-2 ) 
WHEN "num_distinct_referrer_url_avg" <= 4.8e1 THEN  ( 7.31800543152e-4*"num_distinct_referrer_url_avg"-5.957732688025e-2 ) 
WHEN "num_distinct_referrer_url_avg" <= 6.3e1 THEN  ( 8.38321008441e-4*"num_distinct_referrer_url_avg"-6.469030921278e-2 ) 
WHEN "num_distinct_referrer_url_avg" <= 7.9e1 THEN  ( 8.38321008441e-4*"num_distinct_referrer_url_avg"-6.469030921144e-2 ) 
WHEN "num_distinct_referrer_url_avg" <= 8.0e1 THEN 2.422524538728e-3
WHEN "num_distinct_referrer_url_avg" <= 8.1e1 THEN 5.192105554186e-3
WHEN "num_distinct_referrer_url_avg" <= 1.29e2 THEN  ( 8.818151824454e-4*"num_distinct_referrer_url_avg"-6.499685869159e-2 ) 
ELSE 4.875729984386e-2
END) AS FLOAT)+
 CAST( (CASE 
WHEN ( "num_distinct_bids_per_auction_max" IS NULL ) THEN 2.610345438083e-2
WHEN "num_distinct_bids_per_auction_max" <= 1.0e0 THEN 5.502440675588e-2
WHEN "num_distinct_bids_per_auction_max" <= 1.95e2 THEN  ( -2.72947274066e-6*"num_distinct_bids_per_auction_max"+5.502713622857e-2 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.96e2 THEN 8.656991854625e-2
WHEN "num_distinct_bids_per_auction_max" <= 2.04e2 THEN  ( 3.630460311028e-3*"num_distinct_bids_per_auction_max"-6.250003024121e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.68e2 THEN  ( 6.627673025984e-5*"num_distinct_bids_per_auction_max"+1.050481764254e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 3.11e2 THEN  ( -1.054122053887e-4*"num_distinct_bids_per_auction_max"+1.512141919407e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 3.55e2 THEN  ( -1.054122053887e-4*"num_distinct_bids_per_auction_max"+1.512141919403e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 4.7e2 THEN  ( -4.101864620796e-5*"num_distinct_bids_per_auction_max"+1.283544784306e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 5.05e2 THEN  ( -4.305523666206e-4*"num_distinct_bids_per_auction_max"+3.116141499422e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 5.42e2 THEN  ( -3.926795829232e-4*"num_distinct_bids_per_auction_max"+2.924883941735e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 7.85e2 THEN  ( -1.228339656052e-5*"num_distinct_bids_per_auction_max"+8.597297093372e-2 ) 
WHEN "num_distinct_bids_per_auction_max" <= 9.3e2 THEN  ( -1.867082670691e-5*"num_distinct_bids_per_auction_max"+9.098710359837e-2 ) 
WHEN "num_distinct_bids_per_auction_max" <= 9.49e2 THEN  ( -9.420075663509e-4*"num_distinct_bids_per_auction_max"+9.497800767515e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.313e3 THEN  ( -5.141190376116e-5*"num_distinct_bids_per_auction_max"+1.046047929519e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.595e3 THEN  ( -8.456735108701e-5*"num_distinct_bids_per_auction_max"+1.48161407455e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.636e3 THEN  ( -5.607499043663e-4*"num_distinct_bids_per_auction_max"+9.076725799332e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.677e3 THEN  ( -5.607499043663e-4*"num_distinct_bids_per_auction_max"+9.076725799309e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.681e3 THEN  ( 5.315255423208e-3*"num_distinct_bids_per_auction_max"-8.949366447321e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.684e3 THEN  ( 2.126828915065e-2*"num_distinct_bids_per_auction_max"-3.577974612055e1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.768e3 THEN  ( 5.450114534827e-4*"num_distinct_bids_per_auction_max"-8.817464785155e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.852e3 THEN  ( 5.450114534827e-4*"num_distinct_bids_per_auction_max"-8.817464785109e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.073e3 THEN  ( -2.106328659961e-4*"num_distinct_bids_per_auction_max"+5.177875287659e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.295e3 THEN  ( -2.106328659961e-4*"num_distinct_bids_per_auction_max"+5.177875287612e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.341e3 THEN  ( -9.994303638696e-4*"num_distinct_bids_per_auction_max"+2.328077786376e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.475e3 THEN  ( -1.207463423626e-4*"num_distinct_bids_per_auction_max"+2.709098829118e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.504e3 THEN  ( 5.476402750541e-4*"num_distinct_bids_per_auction_max"-1.383634454906e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.533e3 THEN  ( 5.476402750541e-4*"num_distinct_bids_per_auction_max"-1.383634454905e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.601e3 THEN  ( 2.28774214086e-4*"num_distinct_bids_per_auction_max"-5.759467224708e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.669e3 THEN  ( 2.28774214086e-4*"num_distinct_bids_per_auction_max"-5.759467224693e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.75e3 THEN  ( -1.993641832451e-4*"num_distinct_bids_per_auction_max"+5.671249816991e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.831e3 THEN  ( -1.993641832451e-4*"num_distinct_bids_per_auction_max"+5.671249816975e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.87e3 THEN  ( -4.029343029807e-4*"num_distinct_bids_per_auction_max"+1.143431990667e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.91e3 THEN  ( -4.029343029807e-4*"num_distinct_bids_per_auction_max"+1.143431990666e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.945e3 THEN  ( 4.481035545795e-4*"num_distinct_bids_per_auction_max"-1.33323396969e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.956e3 THEN  ( 4.870241153893e-3*"num_distinct_bids_per_auction_max"-1.435780684095e1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 3.537e3 THEN  ( 8.681614892344e-5*"num_distinct_bids_per_auction_max"-2.180025262504e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 4.119e3 THEN  ( 8.681614892344e-5*"num_distinct_bids_per_auction_max"-2.180025262453e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 4.816e3 THEN  ( -7.747281734747e-5*"num_distinct_bids_per_auction_max"+4.587543902057e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 5.513e3 THEN  ( -7.747281734747e-5*"num_distinct_bids_per_auction_max"+4.587543902003e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.2025e4 THEN  ( -1.072734983342e-5*"num_distinct_bids_per_auction_max"+9.078662778836e-2 ) 
WHEN "num_distinct_bids_per_auction_max" <= 1.8537e4 THEN  ( -1.072734983342e-5*"num_distinct_bids_per_auction_max"+9.078662778137e-2 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.3221e4 THEN  ( 8.389351151951e-6*"num_distinct_bids_per_auction_max"-2.635911824497e-1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.5532e4 THEN  ( 4.299219557711e-5*"num_distinct_bids_per_auction_max"-1.067137188014e0 ) 
WHEN "num_distinct_bids_per_auction_max" <= 2.5568e4 THEN  ( 2.855460589591e-3*"num_distinct_bids_per_auction_max"-7.287508022396e1 ) 
WHEN "num_distinct_bids_per_auction_max" <= 6.2485e4 THEN  ( -2.72947274066e-6*"num_distinct_bids_per_auction_max"+2.058471498658e-1 ) 
ELSE 3.529604566571e-2
END) AS FLOAT)+
 CAST( (CASE 
WHEN ( "num_distinct_bids_per_auction_avg" IS NULL ) THEN 2.606847721006e-2
WHEN "num_distinct_bids_per_auction_avg" <= 1.0e0 THEN -3.298503601653e-2
WHEN "num_distinct_bids_per_auction_avg" <= 4.0e0 THEN  ( 6.461206652962e-5*"num_distinct_bids_per_auction_avg"-3.304964808304e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 5.0e0 THEN -5.681060563873e-3
WHEN "num_distinct_bids_per_auction_avg" <= 6.0e0 THEN  ( 2.56691785683e-2*"num_distinct_bids_per_auction_avg"-1.340269534027e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 8.0e0 THEN  ( 7.626059649503e-3*"num_distinct_bids_per_auction_avg"-2.475281848138e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 1.3e1 THEN  ( 2.886958181948e-3*"num_distinct_bids_per_auction_avg"+1.315999326057e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 1.6e1 THEN  ( 9.879390901577e-3*"num_distinct_bids_per_auction_avg"-7.919253337697e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 1.7e1 THEN 5.797063724776e-2
WHEN "num_distinct_bids_per_auction_avg" <= 1.8e1 THEN -3.869116470952e-3
WHEN "num_distinct_bids_per_auction_avg" <= 1.9e1 THEN 8.614547195105e-2
WHEN "num_distinct_bids_per_auction_avg" <= 2.0e1 THEN 1.10082837326e-1
WHEN "num_distinct_bids_per_auction_avg" <= 2.1e1 THEN  ( -3.794339106888e-2*"num_distinct_bids_per_auction_avg"+8.689506586984e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 2.4e1 THEN  ( -1.054235103866e-2*"num_distinct_bids_per_auction_avg"+2.830433793417e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 2.8e1 THEN  ( -5.795421399453e-3*"num_distinct_bids_per_auction_avg"+1.691170679979e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 3.3e1 THEN  ( -7.174306564905e-3*"num_distinct_bids_per_auction_avg"+2.087427944596e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 3.5e1 THEN  ( -1.494996580422e-2*"num_distinct_bids_per_auction_avg"+4.653395493541e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 3.7e1 THEN  ( -1.494996580422e-2*"num_distinct_bids_per_auction_avg"+4.65339549351e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 3.8e1 THEN -7.03321769234e-2
WHEN "num_distinct_bids_per_auction_avg" <= 3.9e1 THEN 4.033932516456e-2
WHEN "num_distinct_bids_per_auction_avg" <= 4.1e1 THEN  ( 5.684719474806e-2*"num_distinct_bids_per_auction_avg"-2.125742972226e0 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 4.2e1 THEN 7.058060794349e-2
WHEN "num_distinct_bids_per_auction_avg" <= 4.7e1 THEN  ( -1.213843322472e-2*"num_distinct_bids_per_auction_avg"+5.803948033748e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 6.1e1 THEN  ( -2.10514567687e-3*"num_distinct_bids_per_auction_avg"+1.024548877842e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 7.8e1 THEN  ( 6.388801293733e-7*"num_distinct_bids_per_auction_avg"-5.495787260316e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 8.6e1 THEN  ( -5.522653845255e-5*"num_distinct_bids_per_auction_avg"-5.060036995382e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 9.5e1 THEN  ( -5.522653845256e-5*"num_distinct_bids_per_auction_avg"-5.060036995386e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 1.17e2 THEN  ( 1.117321509378e-4*"num_distinct_bids_per_auction_avg"-6.654762339569e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 1.18e2 THEN 5.80766029839e-2
WHEN "num_distinct_bids_per_auction_avg" <= 1.45e2 THEN  ( 4.176780979986e-3*"num_distinct_bids_per_auction_avg"-4.347835526431e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 1.73e2 THEN  ( 3.764940857019e-3*"num_distinct_bids_per_auction_avg"-3.750245553837e-1 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 1.87e2 THEN  ( -7.672985168153e-3*"num_distinct_bids_per_auction_avg"+1.61143755796e0 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 2.01e2 THEN  ( -7.672985168153e-3*"num_distinct_bids_per_auction_avg"+1.61143755795e0 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 2.03e2 THEN  ( -3.666711733752e-2*"num_distinct_bids_per_auction_avg"+7.439258123982e0 ) 
WHEN "num_distinct_bids_per_auction_avg" < 2.57e2 THEN  ( -4.321815718894e-5*"num_distinct_bids_per_auction_avg"-2.755683528875e-2 ) 
WHEN "num_distinct_bids_per_auction_avg" <= 2.57e2 THEN -4.439203633115e-2
WHEN "num_distinct_bids_per_auction_avg" <= 1.023e3 THEN  ( 6.461206652962e-5*"num_distinct_bids_per_auction_avg"-5.776047752215e-2 ) 
ELSE 8.337666537651e-3
END) AS FLOAT)+
 CAST( (CASE 
WHEN ( "num_distinct_countries" IS NULL ) THEN 2.615436249736e-2
WHEN "num_distinct_countries" <= 1.0e0 THEN 1.130255946357e-1
WHEN "num_distinct_countries" <= 2.6e1 THEN  ( -6.580143613149e-4*"num_distinct_countries"+1.136836089953e-1 ) 
WHEN "num_distinct_countries" <= 2.7e1 THEN 1.170126487789e-1
WHEN "num_distinct_countries" <= 3.1e1 THEN  ( 4.610348259483e-3*"num_distinct_countries"-7.466754225299e-3 ) 
WHEN "num_distinct_countries" <= 3.5e1 THEN  ( 4.610348259483e-3*"num_distinct_countries"-7.466754223453e-3 ) 
WHEN "num_distinct_countries" <= 4.1e1 THEN  ( -4.033675678706e-3*"num_distinct_countries"+2.951462009618e-1 ) 
WHEN "num_distinct_countries" <= 4.4e1 THEN  ( -1.818717510103e-2*"num_distinct_countries"+8.790858389338e-1 ) 
WHEN "num_distinct_countries" <= 4.5e1 THEN  ( -3.294123132297e-2*"num_distinct_countries"+1.528264312694e0 ) 
WHEN "num_distinct_countries" < 4.8e1 THEN  ( -1.201152017939e-2*"num_distinct_countries"+5.761913938721e-1 ) 
WHEN "num_distinct_countries" <= 4.8e1 THEN -2.886952883956e-2
WHEN "num_distinct_countries" <= 5.0e1 THEN  ( 2.437681355877e-2*"num_distinct_countries"-1.137662724119e0 ) 
WHEN "num_distinct_countries" <= 5.2e1 THEN  ( 2.437681355877e-2*"num_distinct_countries"-1.137662724113e0 ) 
WHEN "num_distinct_countries" <= 5.3e1 THEN 1.457005468025e-1
WHEN "num_distinct_countries" <= 5.5e1 THEN  ( -5.894116031525e-2*"num_distinct_countries"+3.269582043505e0 ) 
WHEN "num_distinct_countries" <= 5.6e1 THEN -4.231881968933e-2
WHEN "num_distinct_countries" <= 5.7e1 THEN -9.709953975495e-3
WHEN "num_distinct_countries" <= 6.1e1 THEN  ( 4.50697925303e-3*"num_distinct_countries"-2.66607771396e-1 ) 
WHEN "num_distinct_countries" <= 6.3e1 THEN  ( 9.242384048047e-2*"num_distinct_countries"-5.70480156729e0 ) 
WHEN "num_distinct_countries" <= 6.4e1 THEN 2.091108839277e-1
WHEN "num_distinct_countries" <= 6.5e1 THEN 1.294690714786e-1
WHEN "num_distinct_countries" <= 6.9e1 THEN  ( -1.597912523468e-2*"num_distinct_countries"+1.168112211726e0 ) 
WHEN "num_distinct_countries" < 7.6e1 THEN  ( -6.510750693806e-3*"num_distinct_countries"+5.128840516737e-1 ) 
WHEN "num_distinct_countries" <= 7.6e1 THEN -2.172132123359e-2
WHEN "num_distinct_countries" <= 7.8e1 THEN  ( 8.179143660431e-3*"num_distinct_countries"-6.171289812769e-1 ) 
WHEN "num_distinct_countries" <= 8.1e1 THEN  ( 8.179143660431e-3*"num_distinct_countries"-6.171289812745e-1 ) 
WHEN "num_distinct_countries" <= 8.3e1 THEN  ( -1.557252822157e-2*"num_distinct_countries"+1.328872827876e0 ) 
WHEN "num_distinct_countries" <= 8.5e1 THEN  ( -2.742351018862e-2*"num_distinct_countries"+2.320661545629e0 ) 
WHEN "num_distinct_countries" <= 9.1e1 THEN  ( -6.118319720322e-3*"num_distinct_countries"+5.097203558193e-1 ) 
WHEN "num_distinct_countries" <= 9.7e1 THEN  ( -6.118319720322e-3*"num_distinct_countries"+5.097203558153e-1 ) 
WHEN "num_distinct_countries" <= 1.0e2 THEN  ( 1.083991356148e-2*"num_distinct_countries"-1.149800692678e0 ) 
WHEN "num_distinct_countries" <= 1.02e2 THEN  ( 9.002141328768e-2*"num_distinct_countries"-9.140221380836e0 ) 
WHEN "num_distinct_countries" <= 1.04e2 THEN  ( 4.407931132574e-2*"num_distinct_countries"-4.454126980709e0 ) 
WHEN "num_distinct_countries" <= 1.06e2 THEN  ( 4.407931132574e-2*"num_distinct_countries"-4.454126980699e0 ) 
WHEN "num_distinct_countries" <= 1.07e2 THEN 3.478702590333e-2
WHEN "num_distinct_countries" <= 1.18e2 THEN  ( -9.973474481347e-3*"num_distinct_countries"+1.101948795396e0 ) 
WHEN "num_distinct_countries" <= 1.29e2 THEN  ( -9.973474481347e-3*"num_distinct_countries"+1.101948795385e0 ) 
WHEN "num_distinct_countries" <= 1.42e2 THEN  ( 7.142141716001e-3*"num_distinct_countries"-1.106000018168e0 ) 
WHEN "num_distinct_countries" <= 1.54e2 THEN  ( 8.914142919372e-3*"num_distinct_countries"-1.357872494979e0 ) 
WHEN "num_distinct_countries" <= 1.79e2 THEN  ( -6.580143613149e-4*"num_distinct_countries"+2.297642919956e-1 ) 
ELSE 1.119797213203e-1
END) AS FLOAT)+
 CAST( (CASE 
WHEN ( "num_distinct_ip" IS NULL ) THEN 2.610085975975e-2
WHEN "num_distinct_ip" <= 1.0e0 THEN 4.854491914925e-2
WHEN "num_distinct_ip" <= 4.13e2 THEN  ( 2.312870169638e-7*"num_distinct_ip"+4.854468786224e-2 ) 
WHEN "num_distinct_ip" <= 4.14e2 THEN 3.495993052314e-2
WHEN "num_distinct_ip" <= 9.51e2 THEN  ( -2.520382685112e-5*"num_distinct_ip"+4.539431483815e-2 ) 
WHEN "num_distinct_ip" <= 1.489e3 THEN  ( -2.520382685112e-5*"num_distinct_ip"+4.53943148368e-2 ) 
WHEN "num_distinct_ip" <= 2.513e3 THEN  ( 1.358802109474e-5*"num_distinct_ip"-1.239461532236e-2 ) 
WHEN "num_distinct_ip" <= 2.893e3 THEN  ( 9.775991207622e-5*"num_distinct_ip"-2.239993045695e-1 ) 
WHEN "num_distinct_ip" <= 3.174e3 THEN  ( 1.317449424937e-4*"num_distinct_ip"-3.223179975636e-1 ) 
WHEN "num_distinct_ip" <= 3.483e3 THEN  ( 1.091253211286e-4*"num_distinct_ip"-2.505212548977e-1 ) 
WHEN "num_distinct_ip" <= 3.888e3 THEN  ( -8.282643389108e-5*"num_distinct_ip"+4.180467830929e-1 ) 
WHEN "num_distinct_ip" <= 4.293e3 THEN  ( -8.282643389108e-5*"num_distinct_ip"+4.180467830895e-1 ) 
WHEN "num_distinct_ip" <= 4.659e3 THEN  ( -9.143207719348e-5*"num_distinct_ip"+4.549908097833e-1 ) 
WHEN "num_distinct_ip" <= 5.128e3 THEN  ( -5.612465974881e-5*"num_distinct_ip"+2.904590510598e-1 ) 
WHEN "num_distinct_ip" <= 5.449e3 THEN  ( -8.172834818548e-5*"num_distinct_ip"+4.217547653604e-1 ) 
WHEN "num_distinct_ip" <= 5.771e3 THEN  ( -8.172834818548e-5*"num_distinct_ip"+4.217547653578e-1 ) 
WHEN "num_distinct_ip" <= 5.997e3 THEN  ( 1.167857884632e-4*"num_distinct_ip"-7.239955288571e-1 ) 
WHEN "num_distinct_ip" <= 6.11e3 THEN  ( 4.754396783588e-4*"num_distinct_ip"-2.875175450127e0 ) 
WHEN "num_distinct_ip" <= 6.438e3 THEN  ( 1.621371108953e-4*"num_distinct_ip"-9.608967629197e-1 ) 
WHEN "num_distinct_ip" <= 6.767e3 THEN  ( 1.621371108953e-4*"num_distinct_ip"-9.608967629144e-1 ) 
WHEN "num_distinct_ip" <= 7.176e3 THEN  ( -1.301401861033e-4*"num_distinct_ip"+1.017203197885e0 ) 
WHEN "num_distinct_ip" <= 7.486e3 THEN  ( -2.267424495591e-4*"num_distinct_ip"+1.710459386277e0 ) 
WHEN "num_distinct_ip" <= 7.722e3 THEN  ( -2.9673449465e-4*"num_distinct_ip"+2.23441983582e0 ) 
WHEN "num_distinct_ip" <= 8.036e3 THEN  ( -1.690128486842e-4*"num_distinct_ip"+1.248072498806e0 ) 
WHEN "num_distinct_ip" <= 8.127e3 THEN  ( 5.802788633411e-4*"num_distinct_ip"-4.773298911829e0 ) 
WHEN "num_distinct_ip" <= 8.219e3 THEN  ( 5.802788633411e-4*"num_distinct_ip"-4.773298911824e0 ) 
WHEN "num_distinct_ip" <= 8.439e3 THEN  ( 2.402846280475e-4*"num_distinct_ip"-1.978886291941e0 ) 
WHEN "num_distinct_ip" <= 9.45e3 THEN  ( 1.172370966021e-5*"num_distinct_ip"-4.983395219821e-2 ) 
WHEN "num_distinct_ip" <= 9.845e3 THEN  ( 2.958710529823e-5*"num_distinct_ip"-2.186430409764e-1 ) 
WHEN "num_distinct_ip" <= 1.024e4 THEN  ( 2.958710529823e-5*"num_distinct_ip"-2.186430409752e-1 ) 
WHEN "num_distinct_ip" <= 1.0716e4 THEN  ( -2.416550214751e-5*"num_distinct_ip"+3.318272011681e-1 ) 
WHEN "num_distinct_ip" <= 1.0802e4 THEN  ( -7.567678444894e-4*"num_distinct_ip"+8.182824174469e0 ) 
WHEN "num_distinct_ip" <= 1.2499e4 THEN  ( -3.786850874035e-5*"num_distinct_ip"+4.172735497018e-1 ) 
WHEN "num_distinct_ip" <= 1.4196e4 THEN  ( -3.786850874035e-5*"num_distinct_ip"+4.172735496954e-1 ) 
WHEN "num_distinct_ip" <= 1.7924e4 THEN  ( 1.75708560158e-5*"num_distinct_ip"-3.697494066404e-1 ) 
WHEN "num_distinct_ip" <= 2.0492e4 THEN  ( 3.681963236642e-5*"num_distinct_ip"-7.14783572272e-1 ) 
WHEN "num_distinct_ip" <= 2.0744e4 THEN  ( 3.726779613659e-4*"num_distinct_ip"-7.59719245012e0 ) 
WHEN "num_distinct_ip" <= 2.0996e4 THEN  ( 3.726779613659e-4*"num_distinct_ip"-7.59719245011e0 ) 
WHEN "num_distinct_ip" <= 2.1249e4 THEN  ( -3.712643907712e-4*"num_distinct_ip"+8.022884864439e0 ) 
WHEN "num_distinct_ip" <= 2.1502e4 THEN  ( -3.712643907712e-4*"num_distinct_ip"+8.02288486443e0 ) 
WHEN "num_distinct_ip" <= 4.8523e4 THEN  ( -3.244512731586e-6*"num_distinct_ip"+1.097214468137e-1 ) 
WHEN "num_distinct_ip" <= 7.5545e4 THEN  ( -3.244512731586e-6*"num_distinct_ip"+1.097214468049e-1 ) 
WHEN "num_distinct_ip" <= 9.4814e4 THEN  ( 5.105738739266e-6*"num_distinct_ip"-5.211042852705e-1 ) 
WHEN "num_distinct_ip" <= 1.09159e5 THEN  ( 9.025888621547e-6*"num_distinct_ip"-8.927895787122e-1 ) 
WHEN "num_distinct_ip" <= 1.09161e5 THEN  ( 4.572625509718e-2*"num_distinct_ip"-4.991339812756e3 ) 
WHEN "num_distinct_ip" <= 1.11918e5 THEN  ( 2.312870169638e-7*"num_distinct_ip"+1.933784435412e-1 ) 
ELSE 2.192636239057e-1
END) AS FLOAT)+
 CAST( (CASE 
WHEN ( "multiple_bids_at_same_moment" IS NULL ) THEN 2.610105023598e-2
WHEN "multiple_bids_at_same_moment" <= 0.0e0 THEN 8.649678992639e-3
WHEN "multiple_bids_at_same_moment" <= 1.0e0 THEN 4.189798167563e-2
WHEN "multiple_bids_at_same_moment" <= 2.0e0 THEN  ( 2.509108009387e-2*"multiple_bids_at_same_moment"+1.680690158508e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 4.0e0 THEN  ( 1.009144010812e-2*"multiple_bids_at_same_moment"+5.168260567168e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 6.0e0 THEN  ( -9.196953711797e-3*"multiple_bids_at_same_moment"+1.368321400521e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 9.0e0 THEN  ( -9.196953711797e-3*"multiple_bids_at_same_moment"+1.3683214005e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.2e1 THEN  ( -6.641213460798e-3*"multiple_bids_at_same_moment"+1.138304777889e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.5e1 THEN  ( -6.641213460798e-3*"multiple_bids_at_same_moment"+1.138304777868e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.8e1 THEN  ( 7.009583803927e-3*"multiple_bids_at_same_moment"-9.571074809805e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 2.1e1 THEN  ( 9.088016279911e-3*"multiple_bids_at_same_moment"-1.33867003257e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 3.5e1 THEN  ( 1.709386256232e-3*"multiple_bids_at_same_moment"+2.108422724263e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 4.9e1 THEN  ( 1.709386256232e-3*"multiple_bids_at_same_moment"+2.108422724503e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 7.5e1 THEN  ( -8.938026605048e-4*"multiple_bids_at_same_moment"+1.488716236377e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 9.1e1 THEN  ( -2.849669817199e-3*"multiple_bids_at_same_moment"+2.974288454817e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.26e2 THEN  ( -1.2117583144e-3*"multiple_bids_at_same_moment"+1.483788987227e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.61e2 THEN  ( -1.2117583144e-3*"multiple_bids_at_same_moment"+1.483788987184e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.91e2 THEN  ( 1.462292050427e-3*"multiple_bids_at_same_moment"-2.841974437903e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 2.14e2 THEN  ( 2.393194133867e-3*"multiple_bids_at_same_moment"-4.620779754945e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 2.62e2 THEN  ( 1.138296843484e-3*"multiple_bids_at_same_moment"-1.93529955347e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 2.94e2 THEN  ( 2.608859795843e-3*"multiple_bids_at_same_moment"-5.790767358054e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 3.27e2 THEN  ( 2.486815262379e-3*"multiple_bids_at_same_moment"-5.431956429589e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 3.6e2 THEN  ( 2.486815262379e-3*"multiple_bids_at_same_moment"-5.431956429506e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 3.86e2 THEN  ( -3.22955516167e-3*"multiple_bids_at_same_moment"+1.519103853001e0 ) 
WHEN "multiple_bids_at_same_moment" <= 4.0e2 THEN  ( -1.167918527839e-2*"multiple_bids_at_same_moment"+4.784721980903e0 ) 
WHEN "multiple_bids_at_same_moment" <= 4.11e2 THEN  ( -1.391715632926e-2*"multiple_bids_at_same_moment"+5.679910401233e0 ) 
WHEN "multiple_bids_at_same_moment" <= 4.84e2 THEN  ( -3.39491239148e-4*"multiple_bids_at_same_moment"+9.480074734266e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 6.04e2 THEN  ( -2.043314160674e-4*"multiple_bids_at_same_moment"+2.938339296919e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 7.25e2 THEN  ( -2.043314160674e-4*"multiple_bids_at_same_moment"+2.938339296673e-2 ) 
WHEN "multiple_bids_at_same_moment" <= 9.3e2 THEN  ( 1.200026399015e-4*"multiple_bids_at_same_moment"-2.059179257312e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 9.79e2 THEN  ( 2.170920369105e-3*"multiple_bids_at_same_moment"-2.114752714012e0 ) 
WHEN "multiple_bids_at_same_moment" <= 1.231e3 THEN  ( 4.143157420441e-4*"multiple_bids_at_same_moment"-3.950367841088e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.767e3 THEN  ( 9.244014774134e-5*"multiple_bids_at_same_moment"+1.48116036386e-3 ) 
WHEN "multiple_bids_at_same_moment" <= 1.795e3 THEN  ( 1.751137596522e-3*"multiple_bids_at_same_moment"-2.929437231626e0 ) 
WHEN "multiple_bids_at_same_moment" <= 1.823e3 THEN  ( 1.751137596522e-3*"multiple_bids_at_same_moment"-2.929437231621e0 ) 
WHEN "multiple_bids_at_same_moment" <= 1.866e3 THEN  ( -1.159754644645e-3*"multiple_bids_at_same_moment"+2.378785009605e0 ) 
WHEN "multiple_bids_at_same_moment" <= 1.88e3 THEN  ( -1.125854436765e-2*"multiple_bids_at_same_moment"+2.122605755564e1 ) 
WHEN "multiple_bids_at_same_moment" <= 3.872e3 THEN  ( -7.759258531247e-5*"multiple_bids_at_same_moment"+2.058682048373e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 6.12e3 THEN  ( -6.098533856413e-5*"multiple_bids_at_same_moment"+1.415535760165e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 9.158e3 THEN  ( 4.490441002798e-5*"multiple_bids_at_same_moment"-5.065872386715e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.2196e4 THEN  ( 4.490441002798e-5*"multiple_bids_at_same_moment"-5.065872386579e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 2.2316e4 THEN  ( 1.338337514845e-5*"multiple_bids_at_same_moment"-1.221566972536e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 3.2437e4 THEN  ( 1.338337514845e-5*"multiple_bids_at_same_moment"-1.221566972401e-1 ) 
WHEN "multiple_bids_at_same_moment" <= 3.8218e4 THEN  ( -2.37998892439e-5*"multiple_bids_at_same_moment"+1.083972503435e0 ) 
WHEN "multiple_bids_at_same_moment" <= 4.3999e4 THEN  ( -2.37998892439e-5*"multiple_bids_at_same_moment"+1.083972503422e0 ) 
WHEN "multiple_bids_at_same_moment" <= 4.4086e4 THEN  ( -1.565787143343e-3*"multiple_bids_at_same_moment"+6.892986969653e1 ) 
WHEN "multiple_bids_at_same_moment" <= 1.31379e5 THEN  ( -1.341310399511e-7*"multiple_bids_at_same_moment"-9.41039585217e-2 ) 
ELSE -1.117259604194e-1
END) AS FLOAT)
) AS "rr_outcome" FROM WRK_BAR_TEST_20150503
SELECT bidder_id, "rr_outcome", CAST( (CASE 
WHEN "rr_outcome" < -1.943293888693e0 THEN 0.0e0
WHEN "rr_outcome" <= -4.442938758176e-1 THEN 0.0e0
WHEN "rr_outcome" <= -4.432938886922e-1 THEN  ( 1.98490830696e-2*"rr_outcome"+8.818826048439e-3 ) 
WHEN "rr_outcome" <= 6.911377328021e-2 THEN  ( 3.873639875745e-5*"rr_outcome"+3.702043635969e-5 ) 
WHEN "rr_outcome" <= 6.962669386276e-2 THEN  ( 3.865896469633e1*"rr_outcome"-2.671827223576e0 ) 
WHEN "rr_outcome" <= 1.408704990162e-1 THEN  ( 2.783256544243e-1*"rr_outcome"+4.897812135809e-4 ) 
WHEN "rr_outcome" <= 1.992601569902e-1 THEN  ( 4.143578688266e-1*"rr_outcome"-1.867314471142e-2 ) 
WHEN "rr_outcome" <= 3.362825312057e-1 THEN  ( 1.765712671241e-1*"rr_outcome"+2.870825087373e-2 ) 
WHEN "rr_outcome" <= 3.587450161324e-1 THEN  ( 6.570333481121e0*"rr_outcome"-2.12140229037e0 ) 
WHEN "rr_outcome" <= 4.380243994016e-1 THEN  ( 1.861593906224e0*"rr_outcome"-4.321654356151e-1 ) 
WHEN "rr_outcome" <= 4.924438728387e-1 THEN  ( 3.950906975003e0*"rr_outcome"-1.347335537727e0 ) 
WHEN "rr_outcome" <= 5.503240448437e-1 THEN  ( 3.714679306069e0*"rr_outcome"-1.231006669565e0 ) 
WHEN "rr_outcome" <= 6.871160279697e-1 THEN  ( 6.650582130134e-1*"rr_outcome"+4.472731456025e-1 ) 
WHEN "rr_outcome" <= 6.873051394047e-1 THEN  ( 4.810636218285e2*"rr_outcome"-3.296422797277e2 ) 
WHEN "rr_outcome" <= 8.762274539917e-1 THEN  ( 4.820272171077e-4*"rr_outcome"+9.94888635365e-1 ) 
WHEN "rr_outcome" <= 8.772274540392e-1 THEN  ( 9.106569322452e-2*"rr_outcome"+9.155167403261e-1 ) 
WHEN "rr_outcome" > 8.772274540382e-1 THEN 9.954020665437e-1
ELSE 9.954020665437e-1
END)AS FLOAT)
AS PROBA0
into SCORING_BAR_20150505
FROM ( SELECT * FROM @t ) TMPTABLE0
order by PROBA0 desc

-- select top 1000 * from SCORING_BAR_20150505
-- select top 10 bidder_id, PROBA0 from SCORING_BAR_20150505

-- SII output
-- select count(*) from SCORING_BAR_20150505_1_or_0 where decision_rr_outcome = '1.0'
-- 406
-- select count(*) from SCORING_BAR_20150505_1_or_0 where decision_rr_outcome = '0.0'
-- 4294


-- Export SII decision
--select 
--bidder_id
--,decision_rr_outcome as prediction
--from SCORING_BAR_20150505_1_or_0 

--select 406.0/4294.0 -- 9.5%

--select 
--bidder_id
--,decision_rr_outcome as prediction
--from SCORING_BAR_20150505_Decision

--select count(*) from train where outcome = '0.0' # composition in train (5.3926%)

