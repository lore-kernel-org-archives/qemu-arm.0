Received: by 10.25.21.156 with SMTP id 28csp1863359lfv;
        Tue, 26 Jul 2016 11:31:11 -0700 (PDT)
X-Received: by 10.13.221.197 with SMTP id g188mr23107436ywe.238.1469557871785;
        Tue, 26 Jul 2016 11:31:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64si1259215qkb.96.2016.07.26.11.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 11:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS78I-0005TK-Q8
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 14:31:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73m-0001Cm-07
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73h-0006Kp-TX
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:29 -0400
Received: from mail-cys01nam02on0066.outbound.protection.outlook.com
	([104.47.37.66]:7682
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73h-0006Kc-Ht; Tue, 26 Jul 2016 14:26:25 -0400
Received: from CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
	(10.152.74.52) by CY1NAM02HT173.eop-nam02.prod.protection.outlook.com
	(10.152.74.141) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 18:26:23 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT064.mail.protection.outlook.com (10.152.74.64) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 18:26:22 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52064
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73e-0003ql-7R; Tue, 26 Jul 2016 11:26:22 -0700
Received: from [127.0.0.1] (port=57352 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73e-0006Nq-5M; Tue, 26 Jul 2016 11:26:22 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6QIJbZ5016352; Tue, 26 Jul 2016 11:19:37 -0700
Received: from [172.19.74.182] (port=41258 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73d-0006Nn-Aa; Tue, 26 Jul 2016 11:26:21 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Tue, 26 Jul 2016 11:25:51 -0700
Message-ID: <3cbb2e8ed62fffd9925435ee356288a31420743c.1469556788.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469556788.git.alistair.francis@xilinx.com>
References: <cover.1469556788.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22474.005
X-TM-AS-Result: No--7.473-7.0-31-10
X-imss-scan-details: No--7.473-7.0-31-10
X-TMASE-MatchedRID: SXW45AgdkCvgk9PeQ8a1PH6DQ2TEDqZsIR1rLBJm/M4cVJCT3tVgas+c
	wCLpvDnEC96AWDFf8+uARNfvLyvPS3i25HfozijkXP5rFAucBUEk9Lf/qe8xx1vo8FSqar5SMXw
	w+T4dG2eSEcf4eD2yrr51pkQVwz+7XsXCkRP5gegCg1rav4R3DfQ7szeVKdNb0SxMhOhuA0TAdu
	QncIjXRjuB1oJO8M/5u2zvfeWYl2UdppKJuaP/f47Su3QulAZ5tjHGWON8yeNtw+n+iKWyyLYNA
	3mHUdu3lZoS4NDC00mX7nDC+4gKehlFrvoa/gAROI8QpSH7EH6wqLgRdvwAinDwxJWw/hfysxmB
	Cv9mGmjan9ppH+fHToDH47fLJDa0oTjn55bHlofxgYoa5xcgTwrefVId6fzV82HMiBe0UlXDcDW
	4tUEEBomTR3l2no8mgDLqnrRlXrZ8nn9tnqel2LI7zVffJqTzrOrmO9rKpS2CcdoQvAcHi6I3JD
	89QgeLQvxXKrtMpxHXsFmKy5QHMX7cGd19dSFd
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(85426001)(2950100001)(19580395003)(47776003)(5003940100001)(189998001)(86362001)(19580405001)(50466002)(77096005)(36756003)(87936001)(48376002)(5001770100001)(71366001)(64026002)(76176999)(50226002)(229853001)(7696003)(8676002)(356003)(11100500001)(81156014)(81166006)(7846002)(305945005)(2906002)(9786002)(92566002)(230783001)(586003)(50986999)(33646002)(4326007)(8936002)(5003600100003)(105606002)(106466001)(118296001)(461764006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT173; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT064;
	1:QAZslI7FROGJY6ycetKRWsXa5kZSEgAVXsxsD8qnaH0qP7zoZQtmDolOSGCFAXsJnOdGG4Kspyi2mDbBRblERDa3c0dWn70p/0p5wMtG5DnF8+Ga1ed5HHd8ECUogiJpSVQrcd5opT6GZV20NjW4ipHo7eXotzLT/f5fGcTO6txHDcfw4qKemCGPjO+QbCnWLRYFFo0QHkkKp81MX0n+yF/IEBmq6KDvpF8mBpFy1QhfrY5HJPjTVLS89kvdt2ho0Q73D0++IlcczBtFGPlBBrvXSkYYj2xpdKvuFO6a6x+UOb61GGeGszQdP3mAcrtnWeCEDtQ7ym7zBBJYUlBHUAV4jOMhU2AovUC9v62z5EN9vmw4qfyQhZBHCB69UETsmhkUYm64mpyx4ltBQvWxc89fXG619rLrFNl8jAA+TAHY9HFHITZ9H9sgxg/u5rMYM8tTWBOglGOyHV2t9MWpqym8aSu5be4Kn7kRXX2P45PJDieZcXPot/2M4m0iaNwDRrtrcaWlRX3hBk6b9twHSjmEMgWAXtSGfJ+813KTCnFhlMowZB0tCY2f2f9WZNcSHwwfIrYEUkz/d31nQSL58htM896zGwUzp4hwKTS25gw=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3427d038-5251-4a6e-f0cc-08d3b5825909
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT173;
	2:PQpuM5kn5YSZM0lbLGRISAJkVwB3itvYaqjRjeBPU43J2sPFlpo5FIgqV7PNvQY6DvQ+QNWwZkSX2NPTkUZTuXdvOUsN3c3PVhhMWm5U7GwxIg8HVcREeqhti+01l6KXXOVwRQh0XxJcqIR7wzextpr6aa6psrd/s+bw9CL3srZc9gcLrI6hVPrwesDHwIdP;
	3:MQ41mGJCOQ8ZCUZegzt2XtTa68qZL4Z6sQzhtLFS8CKdY51y6CZw/xBwoy2VhSv6hIgRu7amw5yQR60R6ratPFTeJrGLelt8L0qV6pjk0yTHma8GmsfVKt0wT/BxWV//sFKWTUXEZYhZev/lGuCdnWnyhtpYEVbaBMgVYW4M8KNanckUafIH0IoZOGhj8CIC13S+tjuuqGHW+fCnffDBNVC8y4xSARcTKAH2pWrclKk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT173;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT173;
	25:MIG6nrZnHxsQDzSXvwnHL6fz5rZ8/5AQsbpBTQoHkT40mzY7bFSNdTlAmRvmJBMkf6BLVYxI4a5tVf/A94plqwASdSYKShPbi4pmf4nXZvwW8jkWgBPdy3JYh970dMbj8nMru5pJWSTzYHHTdap2esnpzKtzPjnHGIHE0NfHlAKqOLzVt8IyzDTI0q11ra3kOIsbcvcqM8nWu5lD3fXPrvX7oA5JlwRno8MH+s2Y1oIyW5nj91G5M/whVZD+bRvuVnoTChbdeYbL1pnUNywhkEMA4InOb/+Ug/uAfRvoo788gnG1E+hUI5FNh3bCGZI5S+ICByo4KR2mJx5ixOLpEwTRuiGZzi9AWwkbJNqg2yeTue4sZSjRF+9VWCYJNTvMfRg2xluyLxGZvx9sW8sHWafhXsplJtN/Hb1gnoizN9hKGZoTbkx0PoeBttvwf6d+TFDRyx3ru9xuBq0IHMp+c/9PvsbUcE0sIU+kuNeDRnrwLw+e1c62L/POjh4ElrYaBS4HQWTEirE5tyzmJJF4cy80iArR0uB/NtV/zbocnp7kqIViSCacUuPth2bqEiw+kfnqP/NwSWRP+z3JiL99ODi6RABGHBs3sfb5vHcNtdapV0HhuYvb1Sb5q2JtBgTuK8F+D/AzQ9VMuaVXXAaJufxabJdxPRFAIV+qGJ99+16iXE4R5pqf7P3KHiB56jqvOSMzftAhiK/35Tj+PknqVt0MTmYSlXi2ii63tlHTqBWYuwGVhaTpR3HiyIB2ltrk1Z2fEw0Odd70g5yVNQBxqg==
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT173;
	31:EEciq5j333a77h/dygAnCHXBv0Mwv/6mu9kz+ep/Kb2RpCtzIbPtDAIbIuxFOGUEnY76prnKhy4AwkFDyF69Iedk/sWNWs7pExPUM67KxeY7hcKTNglZJoHP3j7rHVOuopPA1YSQ9372k6dFSyGt0IUbEm4b/rNgM9rHIeN6Rn34KMHa+qCNnpfKOAC5zr9TC06OWEQKz75TrA+raL7Z9g==;
	20:ZmbfJgEk+QHoBiP9weTtOm/BYxcRDvmz2arFND1g4W4zgaRDbBwnpylLxmcYUgcGenD4kUhpHxUh2T2FoXnFAe2xBr7kVbmkqC3Th5vOc8To5nrS2gJB/Iq7dWMVFTkncIe2Wjrp4WdJ0NQpJzy3SiUuOe4ebPp/fKxysgX/FopPG1vr0s+7GWmASWoztYG1Ep4pO082LsBC4c5wD46QWQLrxnOajLQPLt5w4FD0Ds4Fle9dCTYAJRN9o1QSCEcTXqegVfJWSqTCqHPi5YyOpIw+/5cpHPaSNq/w/fW9hho5f2/3I8GWGGIRQ4Lu732srDa+rqhsehn0ItK1fcp1gGpcCCMaRCyEDglBE83re9hVQDBZtA4UkWdVT21LtJbA0UkEo9MuqF/r5h2MeWunzQYDQ/kVFalF4L37SlGZf2YkPE0+6TaE3CKS5BOhrZxdO+A2rvkUe87OZ/6DU8pxDYlFI+SDRKoyz+I5eCxgh7SxzuLpAvMLRSRdKKf+gPE6
X-Microsoft-Antispam-PRVS: <a984474f0c2c4068a2f74d637e3edfd8@CY1NAM02HT173.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13024025)(13015025)(13023025)(13017025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT173; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT173; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT173;
	4:b7vYlEraoFZRbh9R9YbO/5WqZcl9GU0Bpl5FOtQIhZXlaTxPRPoIlBIfDfFmyCVCiIO0sA7QRy2c7wAEdOHuJqCaq3Yi2tQpY1dB7g/yr0tj6H/IfB6R2ZZr20Fh4Ka8JPttaPEjxa5j0YPIGmjv8cqlvgP1fkd9q+PhhEMriZWJsR/50U2xs4Z/xHNMW0NQjN/DpVKRRUsFdc3ytoVfoGGS+TtIjCf+xnB8xTKUuriPg3IlXJCGYN9UgY05skLZ0ZGXMPKO//PkVng+WZqbU3c2NHiOmenOf95Q665nFbVjCs2UKLjdhZ4DndKeTNFmJxbwSguF3AvMSu4JXwPfqSNqZzH1yszXOHn3914vgXzxJMeCBniLD5o9SwBCUkXSJK0OqOOMBrEH8VSvqBzJC0HWzXF7Hs/66sva5pV//klT6jn/mWFzwdEGZPOD3ISuWjR4CmCjQfFD0w9Q3ltLmU/NZGZhZiC3c4xZWDr91Ez8Vn7Wk2/M9yDp6YLtRoOrxGZnR/LNKRKPoK8CYfk7BfzMMIf+klNT3bLcq51p9UA=
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT173;
	23:2OEv8HxGlmuNfIFSazx4iTsq7bslfG7YHSxzqCU/A?=
	=?us-ascii?Q?XcLcaO/5BITgAb11p54NtHTe7QmG5JZT4QKE9G6Iw+abfCf7p99xetwG1xos?=
	=?us-ascii?Q?qrx+Ls9dZwXJ4D6WD4f75bLgk1X5pPGeagY9bl8oCrQy4UKSY4foe469aYHV?=
	=?us-ascii?Q?YSYtXszMTzyOWBIK/1QbhZax3bnisH9S0nZppWGQ0jktVuc14sYdTWbqbZVM?=
	=?us-ascii?Q?gG9/zCSALpCDV3vgDpu0Jy1vRcOZnbIpPVEZRpQYlOs2bx1APwe5p+aW5U6G?=
	=?us-ascii?Q?ycLhpLZFa0D6G7Ozxw/cYXXSOmORlJxw71nnFn+2EDgELs/8veJbluUvF5gS?=
	=?us-ascii?Q?lch9l4nLl7sFRWa901sYWN/Bl9jjBk33BHn8c5kyxqOEmsKCHwaZr7Sp4GD5?=
	=?us-ascii?Q?3hbp0zZdPZ5BsZHVcyDCo+h9uDfHwtIqUhOGpsZjm/oR3AX3CwIr9qrYd90y?=
	=?us-ascii?Q?HuBQ1MNhs+oX++CDhVQa+/tUwYwLkFCxuWaWSeyWqe/vV0HqZN0v9TSHMkWD?=
	=?us-ascii?Q?V9us9ryZdciKu7Ytgy43lG2ZcSZjoeMQkfHSOq6Qtnmav4wgKFxrdKqKKnku?=
	=?us-ascii?Q?jvpvzfF3DEBXk/5k7OVHT8nkM125x2nFxvAyjUKVoHXJ2hnR7G3OSraV2xy1?=
	=?us-ascii?Q?dGMpWVF4WzZzG8VUKgomlnLsExZre/Emjn5aqE87RiYKtUnJaeDQIP6D/f8E?=
	=?us-ascii?Q?w2D5xxEet++a4iAnPL3uoxVyfdCmEI+be+aMDGhcDqt6kq67Ge1Ve3H4KL0G?=
	=?us-ascii?Q?Glzr5mvgjDSE287y/wChnnL2mhTEF0Tp8zhtn03D/DbmqUwSOFwQ+VytWO8h?=
	=?us-ascii?Q?KAX/qlwBFBMa2p4ddKUV8iwp9BIZrosTP+ueSeSH+DV9dKwy7DY3KVIxXXqL?=
	=?us-ascii?Q?VHokAUKB/4VWrPwNxNkAXU9etURQioQedXOThEUivxeaFLsdPwgczJgdI90L?=
	=?us-ascii?Q?SIrqz4XpZGQ/L8dTOFmGBRjB8FoMWGIAK1jtaBQwpRNyXZ+8GV5UwJX/GpbX?=
	=?us-ascii?Q?DJJ96wzXc3C2UzZU+Bif6Bo/Qp4xYW45NfVbB57KY+2nUevi71Rik4ktsuMx?=
	=?us-ascii?Q?iWMn+lry7ywXrRyyykYVs1dawyblBYeqbpJcc3IdTlNKcEC78NAidy74oZEX?=
	=?us-ascii?Q?8hEV0rJRFd/na2kuIVn4CG9J+0Q1GlfpKhUbFZJ8EZSO4wc63u5SPZAt9TsK?=
	=?us-ascii?Q?PRczKBP9Adyvr8GFH0jIP2fM2RVXcYDP2WyLTSFcyTifBTkxeGYjwblOAE14?=
	=?us-ascii?Q?wpTd9efGn74S9MhQpnC990jVhQjv+KoerKvDLHK?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT173;
	6:pWVLrG8GcyyWivMJkISfbNt5N4V2F9SGy4IdjYlHlNhgsEUInr8D9a6nKfmzQ2PNQnfmAwiSOwrhRaCsWjbdWjm25C+htdrbP8TRuFlEdOjqIi2wv78f6Ncp0VWXoqv11FJjZynBSd/PI5HzuUSa486opvCrOVbzZUWiU1kHSxgMvd5PkQyWrDI3ol7+ahTYBFjjE+QDzK+KV9kKCiPUWCeJmzYvljQFvcGK9lAkN4BC8Xu34kNHu8PjSodw8L1RAwe/6M39N23V0OCpleKvrrhCV2+qwplByPep7kOB2juMlYVrJKpEnGOuKJf+5rVOe0lbzo/z2ocguGi1XYVp9A==;
	5:N7hQ/2zUv+FrDSGDjb8mjAk0Q7ZbGHtzbh35uRjnMT7L9vAJ3Eg1qC1mAijSAkZturOH3iU31l9dSwTFRED5abnWRVb2qbPzql/s5Pjf/aS3JNcK3+lpqTRDd7ooCm/uaM+IBIo6ru67wZ0U53ewIg==;
	24:U447o4gQP3JhJ49IYODLOHrVZxhheepQoO2pnnkFff67/zErMRCVWOKT59a+4K1ThWCKymPE1sLh+q34Y1+eIcoDTKMP8zsbVIQDx5HZsLU=;
	7:C9DnveU/go52SnJMBVkgOWogDNW9AXK/AVxZvYkSZ7o4Lw/daUdKBWPufZOMOeDtcE+kn3KZXaWpDEBOdYk3OINrTVU0uAe4V1k5/bf3pIpAEi1tLwc81vaRqfhXX2W4m4gCWEZ5r/3kBJMkU3PhEkpZ9ImR7nkCvjj/u02vwv4sH6t1gi0tiHT5S7ReNYXyopnK7EIrB9Iz664WsBiLo3F5XiuB/GKvzbz+fj3KFq7OLytI/Dd2CqV48aoY61cF
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 18:26:22.9665 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT173
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.66
Subject: [Qemu-arm] [PATCH v3 2/6] cadence_gem: Add the num-priority-queues
 property
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tSZ47P4oTw/O

The Cadence GEM hardware supports N number priority queues, this patch is a
step towards that by adding the property to set the queues. At the moment
behaviour doesn't change as we only use queue 0.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
V3:
 - Add error checking
V2:
 - Fixup commit message
 - Add the property in this patch
 - Increase vmstate version

 hw/net/cadence_gem.c         | 94 ++++++++++++++++++++++++++------------------
 include/hw/net/cadence_gem.h | 13 ++++--
 2 files changed, 64 insertions(+), 43 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7adc2a8..08b3747 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -26,6 +26,7 @@
 #include <zlib.h> /* For crc32 */
 
 #include "hw/net/cadence_gem.h"
+#include "qapi/error.h"
 #include "net/checksum.h"
 
 #ifdef CADENCE_GEM_ERR_DEBUG
@@ -428,18 +429,18 @@ static int gem_can_receive(NetClientState *nc)
         return 0;
     }
 
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         if (s->can_rx_state != 2) {
             s->can_rx_state = 2;
             DB_PRINT("can't receive - busy buffer descriptor 0x%x\n",
-                     s->rx_desc_addr);
+                     s->rx_desc_addr[0]);
         }
         return 0;
     }
 
     if (s->can_rx_state != 0) {
         s->can_rx_state = 0;
-        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr);
+        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr[0]);
     }
     return 1;
 }
@@ -452,7 +453,7 @@ static void gem_update_int_status(CadenceGEMState *s)
 {
     if (s->regs[GEM_ISR]) {
         DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
-        qemu_set_irq(s->irq, 1);
+        qemu_set_irq(s->irq[0], 1);
     }
 }
 
@@ -603,15 +604,15 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
 
 static void gem_get_rx_desc(CadenceGEMState *s)
 {
-    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr);
+    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
     /* read current descriptor */
-    cpu_physical_memory_read(s->rx_desc_addr,
-                             (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+    cpu_physical_memory_read(s->rx_desc_addr[0],
+                             (uint8_t *)s->rx_desc[0], sizeof(s->rx_desc[0]));
 
     /* Descriptor owned by software ? */
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         DB_PRINT("descriptor 0x%x owned by sw.\n",
-                 (unsigned)s->rx_desc_addr);
+                 (unsigned)s->rx_desc_addr[0]);
         s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
         s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
         /* Handle interrupt consequences */
@@ -632,6 +633,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     uint8_t   *rxbuf_ptr;
     bool first_desc = true;
     int maf;
+    int q = 0;
 
     s = qemu_get_nic_opaque(nc);
 
@@ -718,54 +720,56 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc));
+                rx_desc_get_buffer(s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc) + rxbuf_offset,
+        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[q]) +
+                                                                 rxbuf_offset,
                                   rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
         /* Update the descriptor.  */
         if (first_desc) {
-            rx_desc_set_sof(s->rx_desc);
+            rx_desc_set_sof(s->rx_desc[q]);
             first_desc = false;
         }
         if (bytes_to_copy == 0) {
-            rx_desc_set_eof(s->rx_desc);
-            rx_desc_set_length(s->rx_desc, size);
+            rx_desc_set_eof(s->rx_desc[q]);
+            rx_desc_set_length(s->rx_desc[q], size);
         }
-        rx_desc_set_ownership(s->rx_desc);
+        rx_desc_set_ownership(s->rx_desc[q]);
 
         switch (maf) {
         case GEM_RX_PROMISCUOUS_ACCEPT:
             break;
         case GEM_RX_BROADCAST_ACCEPT:
-            rx_desc_set_broadcast(s->rx_desc);
+            rx_desc_set_broadcast(s->rx_desc[q]);
             break;
         case GEM_RX_UNICAST_HASH_ACCEPT:
-            rx_desc_set_unicast_hash(s->rx_desc);
+            rx_desc_set_unicast_hash(s->rx_desc[q]);
             break;
         case GEM_RX_MULTICAST_HASH_ACCEPT:
-            rx_desc_set_multicast_hash(s->rx_desc);
+            rx_desc_set_multicast_hash(s->rx_desc[q]);
             break;
         case GEM_RX_REJECT:
             abort();
         default: /* SAR */
-            rx_desc_set_sar(s->rx_desc, maf);
+            rx_desc_set_sar(s->rx_desc[q], maf);
         }
 
         /* Descriptor write-back.  */
-        cpu_physical_memory_write(s->rx_desc_addr,
-                                  (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+        cpu_physical_memory_write(s->rx_desc_addr[q],
+                                  (uint8_t *)s->rx_desc[q],
+                                  sizeof(s->rx_desc[q]));
 
         /* Next descriptor */
-        if (rx_desc_get_wrap(s->rx_desc)) {
+        if (rx_desc_get_wrap(s->rx_desc[q])) {
             DB_PRINT("wrapping RX descriptor list\n");
-            s->rx_desc_addr = s->regs[GEM_RXQBASE];
+            s->rx_desc_addr[q] = s->regs[GEM_RXQBASE];
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
-            s->rx_desc_addr += 8;
+            s->rx_desc_addr[q] += 8;
         }
         gem_get_rx_desc(s);
     }
@@ -839,6 +843,7 @@ static void gem_transmit(CadenceGEMState *s)
     uint8_t     tx_packet[2048];
     uint8_t     *p;
     unsigned    total_bytes;
+    int q = 0;
 
     /* Do nothing if transmit is not enabled. */
     if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
@@ -855,7 +860,7 @@ static void gem_transmit(CadenceGEMState *s)
     total_bytes = 0;
 
     /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr;
+    packet_desc_addr = s->tx_desc_addr[q];
 
     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
@@ -902,18 +907,18 @@ static void gem_transmit(CadenceGEMState *s)
             /* Modify the 1st descriptor of this packet to be owned by
              * the processor.
              */
-            cpu_physical_memory_read(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
                                      sizeof(desc_first));
             tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
                                       sizeof(desc_first));
             /* Advance the hardware current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr = s->regs[GEM_TXQBASE];
+                s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
             } else {
-                s->tx_desc_addr = packet_desc_addr + 8;
+                s->tx_desc_addr[q] = packet_desc_addr + 8;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr);
+            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
 
             s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
             s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
@@ -1076,7 +1081,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
     switch (offset) {
     case GEM_ISR:
         DB_PRINT("lowering irq on ISR read\n");
-        qemu_set_irq(s->irq, 0);
+        qemu_set_irq(s->irq[0], 0);
         break;
     case GEM_PHYMNTNC:
         if (retval & GEM_PHYMNTNC_OP_R) {
@@ -1139,7 +1144,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         }
         if (!(val & GEM_NWCTRL_TXENA)) {
             /* Reset to start of Q when transmit disabled. */
-            s->tx_desc_addr = s->regs[GEM_TXQBASE];
+            s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
         }
         if (gem_can_receive(qemu_get_queue(s->nic))) {
             qemu_flush_queued_packets(qemu_get_queue(s->nic));
@@ -1150,10 +1155,10 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         gem_update_int_status(s);
         break;
     case GEM_RXQBASE:
-        s->rx_desc_addr = val;
+        s->rx_desc_addr[0] = val;
         break;
     case GEM_TXQBASE:
-        s->tx_desc_addr = val;
+        s->tx_desc_addr[0] = val;
         break;
     case GEM_RXSTATUS:
         gem_update_int_status(s);
@@ -1218,7 +1223,14 @@ static void gem_realize(DeviceState *dev, Error **errp)
 {
     CadenceGEMState *s = CADENCE_GEM(dev);
 
-    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+    if (s->num_priority_queues == 0 ||
+        s->num_priority_queues > MAX_PRIORITY_QUEUES) {
+        error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
+                   s->num_priority_queues);
+        return;
+    }
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
@@ -1242,14 +1254,16 @@ static void gem_init(Object *obj)
 
 static const VMStateDescription vmstate_cadence_gem = {
     .name = "cadence_gem",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
         VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
         VMSTATE_UINT8(phy_loop, CadenceGEMState),
-        VMSTATE_UINT32(rx_desc_addr, CadenceGEMState),
-        VMSTATE_UINT32(tx_desc_addr, CadenceGEMState),
+        VMSTATE_UINT32_ARRAY(rx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
+        VMSTATE_UINT32_ARRAY(tx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
         VMSTATE_BOOL_ARRAY(sar_active, CadenceGEMState, 4),
         VMSTATE_END_OF_LIST(),
     }
@@ -1257,6 +1271,8 @@ static const VMStateDescription vmstate_cadence_gem = {
 
 static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
+    DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
+                      num_priority_queues, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index f2e08e3..77e0582 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -32,6 +32,8 @@
 
 #define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
 
+#define MAX_PRIORITY_QUEUES             8
+
 typedef struct CadenceGEMState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -40,7 +42,10 @@ typedef struct CadenceGEMState {
     MemoryRegion iomem;
     NICState *nic;
     NICConf conf;
-    qemu_irq irq;
+    qemu_irq irq[MAX_PRIORITY_QUEUES];
+
+    /* Static properties */
+    uint8_t num_priority_queues;
 
     /* GEM registers backing store */
     uint32_t regs[CADENCE_GEM_MAXREG];
@@ -59,12 +64,12 @@ typedef struct CadenceGEMState {
     uint8_t phy_loop; /* Are we in phy loopback? */
 
     /* The current DMA descriptor pointers */
-    uint32_t rx_desc_addr;
-    uint32_t tx_desc_addr;
+    uint32_t rx_desc_addr[MAX_PRIORITY_QUEUES];
+    uint32_t tx_desc_addr[MAX_PRIORITY_QUEUES];
 
     uint8_t can_rx_state; /* Debug only */
 
-    unsigned rx_desc[2];
+    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.7.4

