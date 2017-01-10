Received: by 10.25.205.13 with SMTP id d13csp317505lfg;
        Tue, 10 Jan 2017 08:44:21 -0800 (PST)
X-Received: by 10.55.4.19 with SMTP id 19mr4184257qke.320.1484066661061;
        Tue, 10 Jan 2017 08:44:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si1689362qtc.296.2017.01.10.08.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 08:44:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQzX2-0004Ke-Iy
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 11:44:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzVe-0003F5-A2
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 11:42:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzVZ-0008TD-Cg
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 11:42:54 -0500
Received: from mail-sn1nam01on0085.outbound.protection.outlook.com
	([104.47.32.85]:35877
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1cQzVZ-0008Sz-4Y; Tue, 10 Jan 2017 11:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RDA6c7iYSPaN5KQZwRI1gF8jq9egpqNAuBRZimbuOfQ=;
	b=xQylZwmG5sa7nnyku82mzJ7ug7pnLbNaETrLuToB+o0KkFloII9DH7YpJ3BXl5tX/cRWOCdRQHd1PHHxcUAKqGtyDau6FuDJ7MOr7haFHowxJ64NQEnCygJ88BD6a6y5XAMsK9uqrgebfxZAsS6fghwJzhcvLRfSUU+LxgQUvgY=
Received: from DM5PR02CA0063.namprd02.prod.outlook.com (10.168.192.25) by
	DM2PR0201MB0767.namprd02.prod.outlook.com (10.160.95.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Tue, 10 Jan 2017 16:42:46 +0000
Received: from CY1NAM02FT045.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by DM5PR02CA0063.outlook.office365.com
	(2603:10b6:3:39::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.829.7 via
	Frontend Transport; Tue, 10 Jan 2017 16:42:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT045.mail.protection.outlook.com (10.152.75.111) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Tue, 10 Jan 2017 16:42:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzVU-0007s2-EJ; Tue, 10 Jan 2017 08:42:44 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzVU-0004gW-AN; Tue, 10 Jan 2017 08:42:44 -0800
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzVM-0004eM-Me; Tue, 10 Jan 2017 08:42:37 -0800
Date: Tue, 10 Jan 2017 17:42:36 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170110164235.GT14990@toto>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1483977924-14522-5-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22814.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39850400002)(39410400002)(39840400002)(39450400003)(39860400002)(2980300002)(438002)(199003)(52314003)(189002)(24454002)(6916009)(2950100002)(38730400001)(229853002)(305945005)(50986999)(76176999)(54356999)(33656002)(626004)(54906002)(110136003)(77096006)(5660300001)(106466001)(97756001)(4326007)(2906002)(8676002)(33716001)(47776003)(76506005)(23726003)(1076002)(57986006)(63266004)(189998001)(4001350100001)(36386004)(107886002)(50466002)(83506001)(81166006)(8936002)(81156014)(46406003)(356003)(92566002)(4001430100002)(9686003)(9786002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB0767;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT045;
	1:cn4sm0DLn9DjYqZVeiYqgrC4gMw7DlkwfKXMR4UvGmQiE/391vq+OTFQbr/Aj3iDyYhWGHj5XR7UU6PDSASnp5Jw+gkh8H7v4MEWsketAvLysDceyH3kgu8kp+P/8QPTdW80yG4KPcsS4A2+yT4AfqlVyR45Vde7N6yAGwxuIyqWSonsWZxzRaOx/3kpwpR0bbYlks5sA+4JVK7CKJZ8TU408+ORBZIXiSU068DJgQnz/nGj7LjWrC4kIDapZ8wFy5yMgv5px7DK0x23G3Y1+WzhTQNvLKsg5myTGaTO7ji1BAHHCIBHYIRE9W2k2/ve/E0wzuvwm7xWVbUxKfIlMvb/hM5LapYsq86uPtcRflFLlN+wsRpvMHt9WgDJ/PpYa66bYtNvCdnUp53KoU1zFwwcVo6SgZ5WLHnNkkzo18I56AS+7XQ9GsI5D1GmJhjcQSXf1gJOVsSv913SBHTbKhHAcDioF2qM17AwDL8Q2qqRMqI9qNdfcvI4Z5MIGDfqr3F30PkWXuKSxqCWm2s1ZizkrvnzBr0TIoeY/ZFZL7o=
X-MS-Office365-Filtering-Correlation-Id: dcfb29e5-8067-4cb5-5cac-08d43977b44f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:DM2PR0201MB0767; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0767;
	3:uNMbSkv0GEobyPkXoD8gPNaQCWdI21/YkgppkJ2AeZ+vk8eiw4CUWGiYzA2+su2zbNSfc6OlrIKVZyeYAy6JwIYgQ9x+O64Zc+VJPI3mvR8D1PEr7sB/LW/8vgENOqSadlX7IQEguE9kDMO6kYkQV1KncGyFLAYT3zEz4kbLn+9z3xYE6pxQOtpEJJGTghx9ZBa7zTHFeoJWAH0p2rKG7q/9rpu1fn2MxtURweEIhnvEl729QeFd3/KUU9FzPO1ALD1EzBcFRPhHlxVMOsrzHE98t0dLGbXMOWufYsO7shGWzO2b/yeYQj0afbMNRQo5xLtSAxo4YCQWZIhlZVcK/lfgw941hdMniOOKfUQNHrk2tX8C5ytjgGudHqx7yAXJgRDPFvy6P7mpn7LMtZv4ww==;
	25:yCcmPHCcfDueKS4QX23N1APQ1RTHdWKVI1iYHp+N/XSRfO5pcV4yx/yrd7RVNCIjXz9ayC/bgO0tTa+2ERTEApIXwdoWqyC1eU18q1BM9fZ4trpxnS05hI19HARN4ZvjcioSDRu3csYqGQjdo5MaFTmFgLL+M+jYeJbLXZqPOtmc6aBSHWzyXbYDvRnIo1y8eRoVPdWhbIlAL6tDaZSYXtyex9CUBW+iaBJIAmixU/QCSougPl0JbaTcDYIPywuiLeJnjwSELRSO1JkjrMvbe230Wj1SMOcZV3DZPwfFpV/oGNSLHPuSyl2cYiqREzJEsiRXkUOW1TdH3B6ZcX6w6SMpqEFBLQJ1n3xpWuFdJFnricxBbhZxHX7UVuGeLuWB72fuULTnioL0p14qln5QLjozLO9HHUaDnqJwIUK+8RgioNjyFbpiOkqoVDGAKL5NKXXbQecAPrN+/3Zr2J6xIQ==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0767;
	31:cFusyVC7ZgQfQpyeT8OHMQWpl5IStfJCEHh1JupIEPF3kyxqcvHRDLl6M9O1O8UUaVX6QGA5tah1OeNGVuQ22xaIq7FkeRRWZ1HphZj8hZzzYlgkrptz2XS013VvUmYYyAubf922tUEJ6kEVOg1wyECNyc75o4ayC00p+0JUFC+h3Lz7EgYw66YJ1yTaDEfwDGyPDvM80IP6PT0Rxw//APNALLNNk0kpqw8KOeiQXjB299WporJVMCHkoAtfE6WMLKzsPvQiujDCCSDKMfS88+tz5qSxAg2b2Z5E695Txo0=;
	20:vwCtd5lmmluyA37Sgf0LDGRwXEByWQAj7gTIhyTFfvljo0L6Ut2aO79WETUSIXW2YkzyQSXKulgemXAc5kTt79fRhmakRGUjzXwUcyPGI/DFh/n9U80BciE5p08+33bLDNzB6yfDgR+/mRwED3BW7F2IFencAAopjHH7mT6XNPM1rfuiz0gen/LUAoCu/JVvKXUVPya7+tpQ+fTRoBCXpxIl0NPwnoiyEAbCND3BIAnckcBBxPtZqV+zWPvgKsBiZI1hODEgAi/vL/nWPXbd0z8g77kulpMnjCkDWQ46yGqJSV22hJ30lkuHqNtnA2PWvI+hJV+RjENVGLe5bEunIf6/8OyvdXYvUTyKlotwr2mpq9kwPUChyGVBhRhrJxJOVFtWEGmATOfjT8NzKZyG3UY8t2LzRHdVmsowbCrtfR8sGW4v82iKzCsGmVzR9mIwVkP+WN1ym7U1Jj1L+MHtso9ZudptdY5QO0dIbIpfwwGvVUx5KrHQv6rM7j+EutMY
X-Microsoft-Antispam-PRVS: <DM2PR0201MB076779A7C8A7D1E0D109C6C7AB670@DM2PR0201MB0767.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13023025)(13017025)(13015025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(6072148);
	SRVR:DM2PR0201MB0767; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0201MB0767; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0767;
	4:H2wYhkgrs4qXmTOrmHT5A32dhRQvjkQo83QFLJnEn7ZYbj6lCVzJrhueEZezY5rOolPH12NXRrtfOR3+Th9QzeOVWgGMLcC1TKV++3JExgeGJWvoK4YaiubR4jVEVWoJNKNXieHq6Zp/vbUTuU6EJyZQp6bMqBjEwaaekR2bB+ghdfkRwjPWO0RKDjO6BejuazKTrAwRSlwBLsfYyNPtZKxE4Um+V8F7NMT6+62DTmkEKhK09iB/Xzrjn0BnYoi+Z+QnGeYoRyJAeYYS8KrRxaTVE33c6s+az32Iaq9a3I3RYsMJQa5SLf4MbK6p3AX88a0lP7D/SrLpegL0DfARX4KG7dFKpyAOPnPlaV1vcsPt+5xqGDH9UpnJnSH31zxd76HPijNeXMku5JW1tU57N6x8H/h3N5121HE/pCNg/Oit3ahONOaNaxcwLbDWFn51FCLzHWvEigzXUPeyNId8AmUfu/DY2FesraZiB9DY4V9dn5jTi1y/7iktdd32l+7TUEx40bfSwJ6lSrS2cMiLdepfkXlak4GXz96TUR08ORWq+gF+tNjmMHUqjb/HGqojy3NXp2EPFGxDOXzlI4c9/gSyEO21RJEA0uVwc+EW19AN+x2tzqVIXBFYFFnFAbifxryGLXuhYuBnOZcqSHQKWHv//ka+EhC2ZE+2AYdbmg5Z9bSIYN5kUUlDsx9TPAMXmOfbAAGlqGcHsK3DPNen0enpA3UKICMyYKoPpwne8e0=
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0201MB0767;
	23:ZaKW1rFlB2DCQlB/C198RNujr62W+ZC09HJstHt?=
	=?us-ascii?Q?gAaEvDSW5xrHxtPVrcH47mKkMalDhgtOvyIyoD6Cnx7FT2XKiTfhiYD/sIPJ?=
	=?us-ascii?Q?5P04zPCw/174ZYYBpN4ana7BZGqMO6YCrmmDWorDhpEvsPafs5H8B19yYAki?=
	=?us-ascii?Q?4y2pLbMEvnO0L0vjoPYscII+6x773IUtFRZDQ88e9KDEJ+aPcUhcdDPjnlNB?=
	=?us-ascii?Q?X+SdQ+HgMwJceg0xy4H96nbZuoFVgkVroREdsBd2k53IbQPEgv5gbB2NTCZb?=
	=?us-ascii?Q?xTzzcG9pmKgBTwGrR3OSWXM47BgaX/toq8U8wAPGUpsg9yWhd8+oYvmruz5a?=
	=?us-ascii?Q?gEr3aJVR/QD91I2cy9Xtsy5E1yohf/1gGbWnHVf66sBUYqruhw4giXCy7HB+?=
	=?us-ascii?Q?rDcdJs/FYuFFh1KO04Vmv0Ju5zOcYY1wHvdxyiehqxfh2k7Gi4cbp3A5hYjU?=
	=?us-ascii?Q?tU+fEbllYYlokJpnGQughxKlqwhuGwOASR1JaUjiGad7sxMOtgWAHRE6rQ3F?=
	=?us-ascii?Q?IQLWiuUVx39tqR87R7r5a9EAuZMgOvMIsmd1/maiH7LsSIvow/P0ve1As5qL?=
	=?us-ascii?Q?DpXV5iXEZ9CyRY2hBEKd4KiQACBS4zAvcFAM/fVYbP4cnoXpjbiNfT15skgo?=
	=?us-ascii?Q?743cAQ9eteR7bDlQL37kvUjh84v7soJIetv0WEmn2MNUX752EVoKYwUAKA6q?=
	=?us-ascii?Q?wmJ74JCB6dYPBQFN0ZBrbOgecRZ2H5BqzSL5NaK0+KgMfDKVmoBICkrEhQI4?=
	=?us-ascii?Q?y9b9Gleva5+9X6rhT4E/fbXl67YFx0acS4emdF5evk1O46X+VOmGZAcO/tTq?=
	=?us-ascii?Q?c5SBQVXC0RvWJiWYxtB+rLVZ+gDKxLObYnv7Ijo8gzTVO8dgp8B/cwXud++Q?=
	=?us-ascii?Q?oztBgjDs4Rjc0U5Pe8djPoCdpDzqpVCUdpker+kmUn4ZlZBqSeVSFRYlmOBv?=
	=?us-ascii?Q?P7XlYwknHiNurstVeXQPZm25s0Z/U7NQqmD3jV4/nRibS2/gCrecQ64cRzkC?=
	=?us-ascii?Q?W5vz2WnV30NSVXLohAquUxNi2N9kgsao9FHlHGz3l+AYtweXf8XGDSvepmCs?=
	=?us-ascii?Q?X3EtUZSSgJcksLvceIbAR4ly5FJBtxMLoF02/76uWnU0yzwAKh/gJJh53gxY?=
	=?us-ascii?Q?MQrK5oEqkKdEvJbFVzLZOk0f1MCh2MDGjBXY/pdGs4vXjNL9sJHB4TAaDOAN?=
	=?us-ascii?Q?l1YjxtHr4kKGgnxNW4JhkwPFN2FUtSDcVVzoXFu8z3Al0xofngjdotE76u9j?=
	=?us-ascii?Q?PCI8WrBXMlGmiVycyXryKozVnHsMYNPXSfPqkuBVom2XxwpaphL3s36vO/Q/?=
	=?us-ascii?Q?G+r3nXwdgVF0ws48AhVa0wujgXPFaYudEtmE+iTKxegtDaxCKs2bYnlDuDol?=
	=?us-ascii?Q?4xliazQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0767;
	6:AlMl6RNsveYdCDTSLIEH3yAOaC0HD04nO4QvgnKeqW7k4c0R3sHCFo75lVpE59w8L9dg40MiWoQ+YM9FREfFo3pSMGRnSgkiZKrByjV6g3M5BBGbjlsPVJZzUOEf6HXPenQ0LDl4KrH/FEVjt5QlceHTnsFFsc3DW3PVTlRB/nYys2ipjAZYQ6OGi/jU8HxhxMHp1JDtLk8JF2s51Lff7wtPrcU9D6/qp8SNw6tvdnfXY83b/PUabfL7Ocik2zBI8Zec6N9KMgn6rorKHB3+VdZJPWfgImQ4wsbBaIzjfDYcrbUtntbiPvnqrGmiayfV3Vu0xBBIt4SaFRd5KolWKpgZatL4uK0j0rs60TeeO76n0B3rXS9k9AF/ReuOCQ9uzhL07O/ny+kkzgRJCqfbwnOm7yevgTEdzo/ek4epHWWbIDr77jRpLSX0B7On6Xyi483L5kqbBv/vVjagCDnobQ==;
	5:XYnJ4ImsjKcdof8xNC8nWEF/z6EnNmMX6/ekTMo5giFNX5ueBv1qBW1l6gJvZdbk92zQUp3nF+yMzeNitupDhEt0RSC55QNaHmOX+BoApi/EJ4wENiyz0SwOo/PR5AwcP7oCn/2/hl0vGOXtO9MSx59OFcYWnwdZ7EvMkqR12wY=;
	24:Rcg1Ul//Y5JNr33JQEXw96ub2OfZ8xPiagyazK2esEVrr2PX1ftyPk36LtT3FeeorXOCCXbmWLKifOPjgnkbFtYM0wFV5zE5EI4k7zoth68=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0767;
	7:drb/dzHh7xEZUFE11inpUNoFHRrogzUXIPzAaEn80Cz0gD8LeW4TZFzTG364zL+Ov2Ag6vLenaAD6ySp4ciuygvwHfxxl/kDFTemczlqRhh8fE0zTrlMWpOjzHFJtG9/Rdqe31k93tmNAY50zatn+7rX3DArrCvJqp6EhmwVrNn32CC51PzPqQYSam9SAhNY9B2XH9k0UXS2K2iDtdSsRPheb2KYd8WOiMJdQP4s4UdQcz8yR+ncaJuuHyLgO9D8O50jFDYAWJxf5Q64RENfq/BNqlCMXISFJMGUFXfGyvRH40dEe9rvr7952DpMCtNso0mfCNfI/Pwo+upEd0JPltS0+7DJWZNMTzabO3xfViRCpDekmUdkmeQnFpf2v0eqElz589Kaq24zqquuYg+35R0Xah1zboLlE4KZZqsTQKYqkjw5CNbIUD1oIXvGKTxDcfSrS7FifzJHxdIbIA7rMA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2017 16:42:44.7573 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB0767
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.85
Subject: Re: [Qemu-arm] [PATCH v2 04/18] hw/arm/virt: Wire VIRQ, VFIQ,
 maintenance irq lines from GIC to CPU
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
X-TUID: oKUmgf4Sw8xE

On Mon, Jan 09, 2017 at 04:05:10PM +0000, Peter Maydell wrote:
> Wire the new VIRQ, VFIQ and maintenance interrupt lines from the
> GIC to each CPU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/virt.h |  2 ++
>  hw/arm/virt.c         | 14 +++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index eb1c63d..b8a19ec 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -39,6 +39,8 @@
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
>  
> +#define ARCH_GICV3_MAINT_IRQ  9
> +
>  #define ARCH_TIMER_VIRT_IRQ   11
>  #define ARCH_TIMER_S_EL1_IRQ  13
>  #define ARCH_TIMER_NS_EL1_IRQ 14
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7a03f84..b31d302 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -547,9 +547,9 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>      }
>  
> -    /* Wire the outputs from each CPU's generic timer to the
> -     * appropriate GIC PPI inputs, and the GIC's IRQ output to
> -     * the CPU's IRQ input.
> +    /* Wire the outputs from each CPU's generic timer and the GICv3
> +     * maintenance interrupt signal to the appropriate GIC PPI inputs,
> +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
>       */
>      for (i = 0; i < smp_cpus; i++) {
>          DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
> @@ -571,9 +571,17 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>                                                     ppibase + timer_irq[irq]));
>          }
>  
> +        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
> +                                    qdev_get_gpio_in(gicdev, ppibase
> +                                                     + ARCH_GICV3_MAINT_IRQ));
> +
>          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
>          sysbus_connect_irq(gicbusdev, i + smp_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,

I thought there was an error here first (i.e i * smp_cpus + 3).
The code is correct but could have perhaps been more readable with named irqs.

Anyway, it looks correct:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
>      }
>  
>      for (i = 0; i < NUM_IRQS; i++) {
> -- 
> 2.7.4
> 
