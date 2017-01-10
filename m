Received: by 10.25.205.13 with SMTP id d13csp318002lfg;
        Tue, 10 Jan 2017 08:45:37 -0800 (PST)
X-Received: by 10.55.43.158 with SMTP id r30mr4323115qkr.28.1484066737431;
        Tue, 10 Jan 2017 08:45:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h129si1713872qkf.78.2017.01.10.08.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 08:45:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQzYG-0005Bl-Tw
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 11:45:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzY7-00059s-VW
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 11:45:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzY3-0000qc-1B
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 11:45:28 -0500
Received: from mail-sn1nam01on0053.outbound.protection.outlook.com
	([104.47.32.53]:31968
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1cQzY2-0000pe-MF; Tue, 10 Jan 2017 11:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YUcUl5ig4Tqr4W3G84XuEYhcGjlH+htDdVgu1eTt4ZI=;
	b=TNebiL0ryCJthobyJhyZssWf+/mCH3t7ifcKq++q9ZRZmSftfFqjDlwm8KlvxpBp1tLu0r1GcSE+sXeuhm3MaPFVWpcICyaD5bJokVn9w/bBQthBJlC64O6/gcc3MIlmuaPb8+YPb7EyQbM8qdZu4NT1tjElnQaF4x1QSzkRntw=
Received: from BN6PR02CA0054.namprd02.prod.outlook.com (10.175.94.144) by
	BY2PR0201MB0757.namprd02.prod.outlook.com (10.160.124.27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Tue, 10 Jan 2017 16:45:17 +0000
Received: from CY1NAM02FT013.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by BN6PR02CA0054.outlook.office365.com
	(2603:10b6:404:f9::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.829.7 via
	Frontend Transport; Tue, 10 Jan 2017 16:45:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT013.mail.protection.outlook.com (10.152.75.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Tue, 10 Jan 2017 16:45:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:57255
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzXv-0007Gu-4J; Tue, 10 Jan 2017 08:45:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzXv-0005Xk-0x; Tue, 10 Jan 2017 08:45:15 -0800
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzXt-0005X3-L8; Tue, 10 Jan 2017 08:45:14 -0800
Date: Tue, 10 Jan 2017 17:45:12 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170110164512.GU14990@toto>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-19-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1483977924-14522-19-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22814.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39860400002)(39450400003)(39410400002)(39850400002)(39840400002)(2980300002)(438002)(199003)(189002)(24454002)(189998001)(4001350100001)(2906002)(8676002)(97756001)(47776003)(107886002)(46406003)(83506001)(33656002)(356003)(110136003)(33716001)(92566002)(2950100002)(54356999)(6916009)(305945005)(4326007)(76506005)(50466002)(626004)(57986006)(63266004)(50986999)(76176999)(106466001)(5660300001)(81166006)(8936002)(36386004)(54906002)(229853002)(38730400001)(23726003)(77096006)(4001430100002)(81156014)(9786002)(1076002)(9686003)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB0757;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT013;
	1:AckdofdU7D32FVX3ygNI8LqLTXRYGn6+/o8YPjZUgobQmtZd02HDdtqH4Jh5tTOQDlYUxFR0dzOZCGIj13fCgNEZVOZdlGzFEmnj5SBQ1NyZl+UzsgqN76oHCpeuQGejo7USwJkioW9idi/bkZvQVYrseBlCzr6IaCILq1iMlcKTAZEi2W4GkPxbP1thH1N4NY3yyNXMETjtwesxy6NAX0AtcWvlHkmDyWcxk7AioEgdv5Z39qc705sE1LOASWNuhW0SmdllgVcLjlRgABBuFzajRzSQtgm1fqYp8fcfMq6LuOoY164LPcYEMSrYJl/hUDmkLMI5T0EstY8aKLeGuxO4caxTAkMU/vd2VYcUFrn9PUGxYPc+yKyHr2w6h9d+Y7Rum6MdDucJhPz9W8hYxFvG3dnXs2/OeFL86u7jWKqVIn7kl534BOC1kmtua259TIoAZfrOhrt4FsNn0gFRKZHgiQi1Su6sitdIz5ShGBdHMzwqn02UyY0wtwAk4fusFkQJSsbDiR8scBi9xXV0LjRfeBcwpqR9+ptCuhj1MZU=
X-MS-Office365-Filtering-Correlation-Id: 503ace31-e67d-40a0-166e-08d439780e6f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BY2PR0201MB0757; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0757;
	3:awUX6Z/AMQHuG3ZpkdBtTicvAngfjvXNzm9jf5Qt+YY6vH8T2e7w457qt8JaEuISBj0nnyAPUuIQtrBHhO4sAvuZr9fppN3LhRGy3i2hybwQCvvdiHbo6Wnt6gXSAx4gekC6I5TTJ1d5gPQFb1zbRh8tzowVlLzvQgSVxWmAQ1tdj570/V8CVgIN5i3RRWk6O9pr3klBlbIpb0X+Cl/VcfS1C01DxPJgsxix4gz/sNRdm5zLzhp8YEROeGRT+O/f1obey+0AiCWaTE6LXqtOR4RjCEnX5fUyL4+PHUR2G7Xyw+bO82Td+qd2W/XZgRW+Yh+qqMgChDuDxzBIzBKcPw53IoQjU6m4QvXrd3ZbgrF/hUUo9Y001mRLdTS7cMwT3bMy8EFawT9GJBoTFusmNQ==;
	25:nT1vHSIC62O9ByoRTvlKz7sZmhb0qHpX9aLzq/VNjU1tC2lIXaBmT7A42GIovr70c7+DgdgmG18TklVvsMHktYEUaZq3CvqETFcgKGENRmVSy1wYLf3qfRUqo9i3OShSu91o0wsQkrcYt/h/C/U6TqbHMkwDzRBTNEDX59uIbK53tRSml6GVIsdO9L67aFjJqXv0ogjaRnPHzKr5yGDfu6e2ro7ENDNaRhZ6GW3EROu4oOFJtUlYgZRkz+lQmEAd8WN14OtxIfzrZONw7VIR0oqfVf1X71rz/HCOT0af+iBjejJS0mJuoA6umuKLsfqUENhU7oS49ZsTLjCZuVDWEQooWQ42W725pZvNPKU1w1iCfG3aSxqn5DjQxg+HEzYcZqHRBTb6Z+ZTZ/fZEinEvbzSGMbiUN8997oG4ViA5mxFZfRQtxNFgjGf58d5ITCNfFraL15x4OnzIibBP4idPw==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0757;
	31:vzp8HOI3LycDA98lOp4BqgPQEzgERzOSWAUStpP0JxSFuCZxS3nyboC8t2zc5//GEbbR9EQ+aDkjvLxTHSE0o+Y7uU8ynnjn86vQg5s5unWBJzr18OaeGsZm9idu/vLJeHHlpC2KyRW3XXmkvxLlYvyx5ZtNtZA8se0WwQXQB1q/TGmpBd1Zqn8IK4VYTs+KztiHpLV2LBefzxLxqdf/e6PZ3h5WyOdUpWJpYX9OAypdbSZL8iDdrPeuPA3pBQW15PWYBbFdAlfFcnyZU2fo9BucKGONrNIVxW6U8hvHRDU=;
	20:QfMz2vpyM0E9t4AOORys3GjKCyjBOxes0DF3kM7t8N+8AsnxXuxz0jcmTkroHiKJa986PNFDhLbZjht5MF5dTt+11+dQBNq5sphZkAMRtVcymiBohB01QDppZ7MghLOUgidmFHGOelyiO2O96FiA1NeHyOf0Lw+VmvBHbWv+02RS59hpD5hp6Tlxi+1FlApk5dK2tuw56VpYyxdVbwI4MGxZUfjy6Dz65ppHbhrpO9wj/ARx/RUpOiqNBZ3kJaPvs2QVGWzU0JrLInjyNlf/b6rHNCXhyTtDkM+JAuFJ153aRSEb6jT4AmAvkvk53FbUqezSk/cObZPTVfHvo96mCrT9lnQsFlxuS2z9zgeSfUZYWpGQ8RUqHm5oA2rMXDBDFIk75iZRWxRfu/ux8vC/pNYZ9JdkjDZoZsGccs2aunRGCfdVMsSpzViZ7RNaywQgbNF6YhQM/rkyO9UkuHNvoCggGzhQYFTLNHnPkLX5S/n09w0Fb5Kc/n1Fjv9qfeS9
X-Microsoft-Antispam-PRVS: <BY2PR0201MB0757CE788E9B4766F21B3B4FAB670@BY2PR0201MB0757.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123558021)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:BY2PR0201MB0757; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0201MB0757; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0757;
	4:ipN2/Q6+AdhtYKWULgI2oQoTsrp1AS8uzMRvqT2pUt9szRla7E7h1VtH+4Q+TLSA2FsTqukfzM7v6UYkQ/K/GbV7aIwcIu5yGyETYfROWGf8eOzSLqWBelIQBLD++cZkqXk9hF1RdfmPt7IQBV9umahvU9Y12/Ntgqa+EK7x/x6KOv4gK3jOouCwDZOZ9f7n/24rYPoDwPt2+TWPE/KTDla9p1v8C4AhqSR8BKdWQpVNBwHPFbjL6/S8iBTLVcxAPclqpwpG5Ug3MAXfj5oZjadYkevTBcHwXw97JT7hsWEY9SlokyyaIGTDJ636dMuWbx2U9jBZXtGInI+X5bOUViNIiOZF+yCE8FRRlt/wAikS4a3XCb9r1QMjfwb/4SydwAyVK0dXyBU2QgTfSAsQZjFCHUE9x+U7MmkUjgz9EvsiIsV9DVo8VIouSDRQh506g/fjHPchMCnoVKdcQjWuM7ppHSbHcYdToNZEkSOaV6fhJBVtge4dQcHcSeW+uO+X5adg3h6cnrIvKc1WBIMuR8TB1ZE4y67DdAgBCrAARhFXJFgxCMtcLgTb04BGuYYehYHV/Y0qSOHKJ75BJj4dGl63hKuTmA0ogit8ztP8FSiRYpTi2Je1EtIERVlw1wLxPuya0v4zJbNlUV9D1rZY1h9AEgLAn+tUEgQMkFNOSRxPS0s18VEYSHOHjODoX0mZbMJqSUgqE90sA07y1aTy5h/gRa/xG0IdNIsG+B8445IPyJraQCfagEh5ALOI4tPzHY4BtRE8Tpjb/2YkcUlFIlWXHimVe1AOGEeLGX94yUk=
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB0757;
	23:0fjmmbxE6jLLzmk/gYmDDR3JhvnPp5nFAyKne9T?=
	=?us-ascii?Q?g9ZTmNyTlSa9kWyFhMbjHGK8AW9S7cccrDZq5uCpwArcO7YxnfxVpMOzoxZH?=
	=?us-ascii?Q?AIEJxZkipU1i3Z49KePy9NJTo+qVqkq8KGyA8+KVcBTzQbvI+Mgl/Mb28qxN?=
	=?us-ascii?Q?BF5tnmr7caqjnxqijBrmVxO3fMgx3fZyk3pYgVH86RhfOjG2QGqsHe+2du9l?=
	=?us-ascii?Q?my8GHlEe8swaAL2ANS/RrlRCsEgj52ahW3uVBt2t3JXNFwZWoW+bBi/bvOzG?=
	=?us-ascii?Q?f4Dqo8/kSp9raxwKfVqym2e5BP6FXlb2i2HTlN+FSsw3fHcniFF264f1tqRI?=
	=?us-ascii?Q?CbKCOEjHq5c3gcfOFwkxtm5+wrAbIKGAWVG5rYAV1EtDXMsht05iS/SC9mvv?=
	=?us-ascii?Q?WT0zp+Pb2Z1dk0hWBVdpmV8wyeCOVxKIHT4AnuMda+xWN0DPZa0aLmNKv/eA?=
	=?us-ascii?Q?IOcnQFwei8rshKDXoKfY/nNS5JWwzeCUz6CELiObeCiYx0R6/xT6qMMWdXln?=
	=?us-ascii?Q?i8oPQByNAQGF+RA4eTxsvpINKCKdBPFjSBEJybQOIUGUldfDZ9tLNyIskY9a?=
	=?us-ascii?Q?ldW5eL8xOMzl7menKw215KPrU1u/+GkbCGRc4aCDsY327nUBzcCR3CWb7OcN?=
	=?us-ascii?Q?2yMH2JXA5C6Vt/V9yBlQdTRPoC/FvMWZV5VARF46nZQC9fwG/HPY9R/Mp3Va?=
	=?us-ascii?Q?X/5XxPZDNGZqcdJ730OI57cubGV7Ou7sjrCEPF8mNinfu/xtRGU3oAH+i1y5?=
	=?us-ascii?Q?r3ZG1++ZEf7cjuJcs+1U7g3C4Bj7PxhugVlrSeOSxNqo10M0aJQ+1w0aMMSn?=
	=?us-ascii?Q?4z/VtFLb7oqpaCFb/JZnTR0sRkbWs8ahvsLx+YVCpdv9bfO2ZcZlmMzRlSXY?=
	=?us-ascii?Q?oA5BiYJm43waPtyJhNEMl0jaWvfkAS2c/xIC7r4oL+RuvF/rGxHjbQS6RZ0Z?=
	=?us-ascii?Q?ciHnjUChhXEM2AaOEi+xtEkYRyRO5j6YucWXbgmMpVsMVCEPry43zvz+j0qe?=
	=?us-ascii?Q?5kzAFJ20j0j4kxDmt1hUvmgYljehNYqOm9xEiLwJs/slveKkowkUPvQvNoNs?=
	=?us-ascii?Q?X8XipfuY+VXn0M35B9fwQdK8NN/lFX/8HWr0OURCdcrbzawKCFV2XtHXoQJN?=
	=?us-ascii?Q?sC3kWtVQORS3ROophLZJ4NusmapxuYj4RZP8o3cLp3JrhM7VgFkJxpDZzacO?=
	=?us-ascii?Q?hsrLtCbDR5KLWBo2OWGZcTTnsY6G0fB6iUXK6SW0sFvjhmo5RIYy+mmTfmcv?=
	=?us-ascii?Q?jVKz7+B9sa+TdH4TXI+pn//6ORH8OtIHKtybTLXAUavFScp6Ebpy4lIdB+Xj?=
	=?us-ascii?Q?fauOSXJ6LNkcbL3uxsyO9VmYkDrdFTTPGxEwJ+fN0VKR72GpuKkKyezA93kJ?=
	=?us-ascii?Q?CJtrNs2F59+Yj1p/yiAo8WKrCh+I=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0757;
	6:y05lZVbuaGVX93E9LIInYamTzRBxJSMI1y5SM9nL28BKtdKl0xZCBVMeD+89ySSdsK/YcJI8feHSUBTV/AHeOeqKqUTJ9pSqBsdbSkPnEP/vbeuxDPSqnWvttCLTVum3CACskeQVaNDX4kOQpYO1lGNl0i8EnXGOXHkXqELukdMUVXjQAR5V9W5DpHGLqevkkaTZGydQQ9knHCiorTO5fxb54yy+c+hNKthM/9hlTinPQd4FTsKiWHeFGEfxuODGQe2w3+GY1YwtmR0j2yKiMVKJtgitttERDyzqAmSQGMmTxojUdkKVaxeVmYsODqw6gkejptAbgWAbJsECt2WhfrGDHRck1rHkR2THKmaKQhg3DTjnEWvqune9OlyOAciFclZFV/76AE2/wjAYb1wehwmZ6sZ8cOo0pP2lOy4/B41t0uKQZcHkxwbY8iRFOosyuHaJK1GtA+FZZmXSPlv3xQ==;
	5:fpCRkfum7IJFzysIMOAanHdOcyu2y16BVx45a/5DvatImGSw8oUUQCidByQ82AqA2inFiTc67MUDt2CclhxtniXYh8AlcGXxO48FZQLp9snO+fzabmPIPTX48cpsOmZhEwiILhmF6EHp1TkU88UPULIk/TDlW6OR1fO6cU/tqKY=;
	24:3vebQfjMRepf5OXhsBjqT/mCRPqpUy60gTDN2U1nWSoP9qdWLeAOF0q4zxrGxSu2Dwwk5n8Q8c79qilc1pByZ9M05j1XepYc/NfGsjTGTH0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0757;
	7:B8FmwUNrGAZqM+n4kxiGp3baFdPo9Ya2z3bOFESDe8OilXRUs+inZVoBV11IZF7GxJatNJC+0mRehYJEpSgMgLWeiEZZfYPQjURLUDL8xjnuR7iDYuzDU8XVzWCk1JuP94Dkmv5E92LYYfRu/OYDtHnwNAAO36WKEYBfNv4tIqId4nQuaXiC5bgwDt+SkbI1mwOWzCZafVm5jUcKmTgvbgKd6rCfjfqSsOgfB1M1QFiK6vrM7Y5V86JapUEXw3BMnOSJ+s3gvQXosjGdxoC7PBvQRYJ1PzUMJk3IfdBkjL4kv8Alms4AMsFTULw/paNyVnMRShXpiRnCXZaKyP4xrTcfr+E6iuT1dQMOHnsypDUo6E0fZemkKNEWrMfC2NDG7MQS/h8gv+MAJcrSRGyfXWcyoPrXtJ7V1i0+lhuImmJsAUx0y4X/VNGhnnT4CF+F56BvjdS/pCEYSWpWzoKDWg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2017 16:45:15.8508 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB0757
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.53
Subject: Re: [Qemu-arm] [PATCH v2 18/18] hw/arm/virt: Add board property to
 enable EL2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7JbZMn3Rmbu9

On Mon, Jan 09, 2017 at 04:05:24PM +0000, Peter Maydell wrote:
> Add a board level property to the virt board which will
> enable EL2 on the CPU if the user asks for it. The
> default is not to provide EL2. If EL2 is enabled then
> we will use SMC as our PSCI conduit, and report the
> virtualization support in the GICv3 device tree node
> and the ACPI tables.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt-acpi-build.c |  3 +++
>  hw/arm/virt.c            | 44 ++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 53507e6..58ce74e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -93,6 +93,7 @@ typedef struct {
>      FWCfgState *fw_cfg;
>      bool secure;
>      bool highmem;
> +    bool virt;
>      int32_t gic_version;
>      struct arm_boot_info bootinfo;
>      const MemMapEntry *memmap;
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ec7f83b..32b660d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -607,6 +607,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>          }
> +        if (vms->virt && vms->gic_version == 3) {
> +            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
> +        }
>      }
>  
>      if (vms->gic_version == 3) {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46f19cd..709da40 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -444,6 +444,11 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>                                       2, vms->memmap[VIRT_GIC_DIST].size,
>                                       2, vms->memmap[VIRT_GIC_REDIST].base,
>                                       2, vms->memmap[VIRT_GIC_REDIST].size);
> +        if (vms->virt) {
> +            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
> +                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
> +                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        }
>      } else {
>          /* 'cortex-a15-gic' means 'GIC v2' */
>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
> @@ -1240,10 +1245,15 @@ static void machvirt_init(MachineState *machine)
>       * so it doesn't get in the way. Instead of starting secondary
>       * CPUs in PSCI powerdown state we will start them all running and
>       * let the boot ROM sort them out.
> -     * The usual case is that we do use QEMU's PSCI implementation.
> +     * The usual case is that we do use QEMU's PSCI implementation;
> +     * if the guest has EL2 then we will use SMC as the conduit,
> +     * and otherwise we will use HVC (for backwards compatibility and
> +     * because if we're using KVM then we must use HVC).
>       */
>      if (vms->secure && firmware_loaded) {
>          vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
> +    } else if (vms->virt) {
> +        vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
>      } else {
>          vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
>      }
> @@ -1273,6 +1283,12 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>  
> +    if (vms->virt && kvm_enabled()) {
> +        error_report("mach-virt: KVM does not support providing "
> +                     "Virtualization extensions to the guest CPU");
> +        exit(1);
> +    }
> +
>      if (vms->secure) {
>          if (kvm_enabled()) {
>              error_report("mach-virt: KVM does not support Security extensions");
> @@ -1329,7 +1345,7 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
>  
> -        if (object_property_find(cpuobj, "has_el2", NULL)) {
> +        if (!vms->virt && object_property_find(cpuobj, "has_el2", NULL)) {
>              object_property_set_bool(cpuobj, false, "has_el2", NULL);
>          }
>  
> @@ -1435,6 +1451,20 @@ static void virt_set_secure(Object *obj, bool value, Error **errp)
>      vms->secure = value;
>  }
>  
> +static bool virt_get_virt(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->virt;
> +}
> +
> +static void virt_set_virt(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->virt = value;
> +}
> +
>  static bool virt_get_highmem(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -1522,6 +1552,16 @@ static void virt_2_9_instance_init(Object *obj)
>                                      "Security Extensions (TrustZone)",
>                                      NULL);
>  
> +    /* EL2 is also disabled by default, for similar reasons */
> +    vms->virt = false;
> +    object_property_add_bool(obj, "virtualization", virt_get_virt,
> +                             virt_set_virt, NULL);
> +    object_property_set_description(obj, "virtualization",
> +                                    "Set on/off to enable/disable emulating a "
> +                                    "guest CPU which implements the ARM "
> +                                    "Virtualization Extensions",
> +                                    NULL);
> +
>      /* High memory is enabled by default */
>      vms->highmem = true;
>      object_property_add_bool(obj, "highmem", virt_get_highmem,
> -- 
> 2.7.4
> 
