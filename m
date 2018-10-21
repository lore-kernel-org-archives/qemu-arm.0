Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2110214wrt;
        Sun, 21 Oct 2018 12:31:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61NGY60zHXkMgCN4XROlYJVf5xNgbUiwjEBoDPM7StInxMyVu3RfRDcRiZt5w8U5Liyp8cf
X-Received: by 2002:ac8:734b:: with SMTP id q11-v6mr38882778qtp.204.1540150261864;
        Sun, 21 Oct 2018 12:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540150261; cv=none;
        d=google.com; s=arc-20160816;
        b=gFvGW/t2ZWayll1DQ37/S86jQ+5dmUDamN76p9qIlEdhiaSRKMLEFlDfCxAfrtE3zp
         Gp0JAM9TODvQJQJzgtPXO8CksyqqSf9qpJzhGXOGh9p5dxTpkoCU3R7J+eONrPbpr5mS
         F4aLtOfJpSTRSm7NTz9Dt4xCjx+Zkt9sAwrcjL+ZfaAOKkGUCtu59TqEeHaCVg6JFGj6
         jXAWLqJRvbYN4B96zOzchgFYES6HXnmjHZ2xelN2yfQktCp3IIkPuxxi0T0aUHUjWTjm
         epQOdITtLTN6uBpEEW6G3qihZCeTIzPLxI0ndrjvAaeghgIV37E4lnJ4HDiafSIE+l0e
         hJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=petO7fE+DEVPOjUlPt8UcRzvUpWI8M20mpOiTZCRAm0=;
        b=YuNoOw81nRCdp2ul9cS+QQO2NJJkR36tRK+ln4sTlsWLGUMnaFOfI/VcRg8ZUOWk/L
         ZtLRTjJtPI4gdc5/S7Qq/bXEysPgBwtHrADZzXwqFbus/L9W0mWJV783QwD+6qsAdemU
         /WXgXO+ar3xr6jDajg3TqgwTDeifvckA4Sp7MZeUwsOH9wyU4Us3dS2ZVjOvSFIHZgBl
         PUmNae3TB7/EsA0FWAGgLUAFbolWj2TRlAovX7aD8DiMsLGRWmVHOjizbjqho5zt3+n2
         b9fBv4h7Ppk/UQuyF/SlpSiN/BQwLnERD5Wgu9HpL6abblzY9MCEOWJwLCKm6BoHcIyw
         kd8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=juiXpSWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3-v6si6204892qta.188.2018.10.21.12.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Oct 2018 12:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=juiXpSWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEJRF-0001rz-7M
	for alex.bennee@linaro.org; Sun, 21 Oct 2018 15:31:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gEJQy-0001iB-W9
	for qemu-arm@nongnu.org; Sun, 21 Oct 2018 15:30:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gEJLe-0001SQ-2a
	for qemu-arm@nongnu.org; Sun, 21 Oct 2018 15:25:18 -0400
Received: from mail-by2nam03on0062.outbound.protection.outlook.com
	([104.47.42.62]:42784
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gEJLd-0001Rt-NE; Sun, 21 Oct 2018 15:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=petO7fE+DEVPOjUlPt8UcRzvUpWI8M20mpOiTZCRAm0=;
	b=juiXpSWm5HSiCH+VYgOoGbQk26r1HvNB/U26OJZm8NAGprMI7HtEh5XmPoDU9nz9KotLSTxmVW825c10oFK1r8VO3ydrH9jmJpb/FeXr/zwjdAOx0fTpmPVfGZn7IU1UQjm7CKWBOAK/YzZVKG2ZsdUMw/L2ASZSdKBHz+LUsW8=
Received: from BYAPR02CA0014.namprd02.prod.outlook.com (2603:10b6:a02:ee::27)
	by BYAPR02MB4453.namprd02.prod.outlook.com (2603:10b6:a03:57::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1250.29;
	Sun, 21 Oct 2018 19:25:10 +0000
Received: from CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BYAPR02CA0014.outlook.office365.com
	(2603:10b6:a02:ee::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1250.29 via
	Frontend Transport; Sun, 21 Oct 2018 19:25:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT016.mail.protection.outlook.com (10.152.75.164) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1273.13
	via Frontend Transport; Sun, 21 Oct 2018 19:25:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:52567
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gEJLZ-0000np-3w; Sun, 21 Oct 2018 12:25:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gEJLT-0005z8-VT; Sun, 21 Oct 2018 12:25:04 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w9LJOwdd025463; Sun, 21 Oct 2018 12:24:58 -0700
Received: from [10.23.117.126] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gEJLO-0005wF-Fv; Sun, 21 Oct 2018 12:24:58 -0700
Date: Sun, 21 Oct 2018 21:24:57 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181021192457.GG4229@toto>
References: <20181017213932.19973-1-edgar.iglesias@gmail.com>
	<20181017213932.19973-4-edgar.iglesias@gmail.com>
	<CAFEAcA9Dd3=52zReFVMgitYFeQsRA=guYsVMxy=0zHsLJ_+z_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Dd3=52zReFVMgitYFeQsRA=guYsVMxy=0zHsLJ_+z_g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(396003)(376002)(39850400004)(346002)(2980300002)(438002)(189003)(199004)(81156014)(23726003)(1076002)(5660300001)(9686003)(2906002)(14444005)(7416002)(478600001)(336012)(426003)(446003)(53546011)(356004)(26005)(36386004)(305945005)(126002)(46406003)(486006)(186003)(33716001)(16586007)(106466001)(97756001)(54906003)(76176011)(9786002)(316002)(47776003)(33656002)(50466002)(58126008)(106002)(8676002)(77096007)(11346002)(476003)(6916009)(4326008)(63266004)(8936002)(81166006)(107886003)(39060400002)(6246003)(229853002)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4453; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT016;
	1:4L8U7F7TLuqlh9B+Nm0tMyq6h5z0FWSnoNGZ7OXkigOiQoHBRfPzyshA9euP2E/2UOASRd0sUaoPfZDZifj04w8gxzk36iQTpFY0LlVJFuHkY8yTb1PYWWPkfFrM99ME
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afa90395-09e5-43cd-1310-08d6378aeaa9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	3:t8ju05ATpMSK+VziFSg38wx1uwquo5dgeYuD1rzkbew92PbMWNH8XwYXGhZKB+VZPxs/2qZN3Y4lVJ4GiUCErebPQJRbjhXtO3LtA8lI1VdgHgw5uBKw01D36Ygf7vd02q8Qm7sTmBeXFBXAQCHJ6FesdOB2PX/nVOI01AraAE8Xho/J1pk0FG/wypEA/n0aYh+BDRJBvRI30N6KfjWuF33Jv0Cag7FDIIId8X2oTytJuwgOeUkLbqQqj3KzSYDav6VeukJXA6TLjTuIpHh+ijX2xqPsxgXEdF+L0PgApRn0g6iZK7Ca2QPqlRi13dV4weDhUpe8RnKv77azfEqBLAjf/vF6oiWXy+WleKeWTnA=;
	25:jhVNsXkL0oEHL5YF3IZT05sT0s6p8AVOlR8+jfjwsFXAeKzsRIVTxdT7SB9NQA2qp97bR/SFuoG2oJaYlXsqvZcmpcQGn6lecf2vIceqvMBt5DwuiWhfdVziQ/P3N7paLMr1KOF9OLXWeMe8aoe7AYmyX5NCwZAz7WXWurdHyEss8lZhtgtgBcW2IUghjO7rV4oM2H1IEIVabY04hUq0+11zfZcEUVRtYyrJkItHwT21HnRPZg8izDhWJPyIwbJ0mByn46jqzXZNqYJITmgqcnXcqAXLeeIGVCt9DNewyI3DI/Egb/Jp/u+74mdFmzT6OBwcBBLJXgXRZkf+G+mX3A==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4453:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	31:8v6H/FPTpCFYLpnQoNmM+EUPmuYcC+y18xBHC6iuZJbEcmRi+7xMu59e9mRLhAyzSHT8EdgFRUGOinc6xmCYDaKxzyGBtQO0ChQOFMa/uQrBYeNvkica8ST8fpe+mXeDuFtpxtKO7EqOtCFLKQhhgDBw1p1rCIcOCl0eRxuBjUbm1LQnzO7tFzbjMBFElwJNEzs4la6AuOUFFUW+t4VkaBILpMW7Bqwa0kvDfXs9W2c=;
	20:dpFwo+smVgYyPaLLLL/G7XbHoxvMk7C5FSpWYITmeI1pHx1M0z0MUxvyA1Tp2GKrAOptW3w8/ra1dNCj37HXE3Ldhwe4fUBFt8LmZeyKwtlFaV3ex+x+TMsqftFQmU/TR7PAn07X92GYA/YYmchoQZVs08kMWX5ALRYTIyBOGCGiRey/O/BjDUIwOyaIfZv1I97zy5LsiKJTtxRSgoZ5bXCpMPlPNnjp2j3DzX0hA8Fb5V7uV6JDBP4l96VSajRB7bAxDjOypPdM5uqBZWt3H3bnXwONC1LFvJIcp3SNuLDsTrin7N07m6AWnggi+Kke/Dfi/WeYozGAuSyeIdxfyiy0vVxcy64Tmll1mUE2tjsVzS1g0aVosN2+4y5OCjTHbmmqGSiijdmtTdmhuTcTrGb1IqoCgq3Fk66uKBh7P7bknDWW2W/Mm4p20LjX9E5sd63wHh+HGmwTZhHxclJ+t/wYlwjDSUG0nk9Bf+/sX7szZ+LEC8dbgSoUNblfFaKY
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4453CC321E7B80DD60409121ABFB0@BYAPR02MB4453.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4453; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	4:JTnMwDkbKJrpwNS6DFtsfN98wjOqK1UCvPcrS2LwxCqPB2YDqPBFrUWLQ/sApVE5aUYVtZ63egLyZOywGbQf9pRNyZAG4yH9faxbR8jIVv7bbYpZGOMTm49N1O7hAqjNwypF+Nk1c9mdP6lTyIU91nGWO2VKVVvYAMqCDfieC76ydTHywy67iMtBUjQCuGF/z6SfJyB/99JLIG/CyUnltE37060zLe4brF1aVtx+7osqVqFGanhbUHC90CxtGTPnH8jmoBT8ZBa+GrNm1usakWiVMUyZYAkJjVp8GJEWKHXceKa9gnym7gVCHYzYCXRjvYXS0FRpV6gCKLJhbEU0DVD/PWImyD157/J9YeXNkZw=
X-Forefront-PRVS: 083289FD26
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4453;
	23:HKXsVe2muyLKBtuCl9hK23tq8Cn8Dcaq8My+zIQmA?=
	=?us-ascii?Q?U88eQ6cY1eb7pFa/WyJZkVBXeCUnweRurNZqcXD8a6Xy87M4gQIwMEHCCKEr?=
	=?us-ascii?Q?o4tUcUJn0oBbw6JVLyzhOJafUJEoXJeesKBhhA2o20vjFhr9MHIydmzHyMnG?=
	=?us-ascii?Q?p419osZ/DYvZNOT6bP57Ksm4YfAhmGhX9hQVxX3JW6lkhZidXKlzGLS+4dPQ?=
	=?us-ascii?Q?kGQvXE2ysaP0M6OOt07c97ezFK0oFi44kMTvIQ4UOe4qc9ZOZ81QrBtEhyKx?=
	=?us-ascii?Q?ZvQFj0AwCD+j0MD3n5eaS1se0YKGGFQyfazjAZTguL9uDNtf5Krde/7Ko73L?=
	=?us-ascii?Q?uzkwYWKnD1fvWY73TbjMw1h0+TqzR0VeIbn1b7ovYPgqpIWDBWAP4SKcbl/Q?=
	=?us-ascii?Q?q/Ej+IZxUfI8+ziJZ0Bjt8BF9OjCBNrP9Z5o/Nv9kti7AE+7wfDNfVFIhMrx?=
	=?us-ascii?Q?vyjzkHdHaafggCZnZwc1lEBQniu/H+ZKXC+iC0rAF5RlshDiZhH/gBAw1hTp?=
	=?us-ascii?Q?T3+jkqnW+jPic+5Rum1pSvYJkcPCZX77J9SnmJmt+ilF1Y2QH7VxLmpAKF6P?=
	=?us-ascii?Q?JY+uHjuXSuIo6Ib6ZAL3iqg1N7Eh8nPwhRCM2GaHB/H8sbog88IO8r/A0pDw?=
	=?us-ascii?Q?lWOZJ+zgyOEFB37KT8vN68tP543xqj5dv3y7eKkPfKZ6rtFXPIBq6Pp+9B+S?=
	=?us-ascii?Q?Yk/TQVK9pqmw2+ZFQa8sPvWpXbj+UR3xEeILMbzcRA9/cc6Cq8OLnYwIfEtu?=
	=?us-ascii?Q?ShsONvtcqoe+qpDNVWWg+WUrffUpJvfN2Wk4SAm2lUEPIRsssR2llF8JRkio?=
	=?us-ascii?Q?zWA2nBzAINN3L1V6GONoiumUFD1fzSTq5Aie43AGFGUpQiz0c2goY+bLd54S?=
	=?us-ascii?Q?b+OKJS+l5r8G/Q+Lj4J7BgJ20F+M9afXRTTVcw6HTuSDqFfS/rFNEEeXmon/?=
	=?us-ascii?Q?Ai9Ps1yBObLoa7DyPBHO+wqlegVMRuWroorwDRT3aFhLF+AgYbILAYeUtXzf?=
	=?us-ascii?Q?e3hA4mNDDC4Rnq5UTQsDtzvDCFzSXI92T7z3yqhXqDZURGalXQSq5t5XujyF?=
	=?us-ascii?Q?2lHWWf1ZH5hgS6XVMvjcG//bW6QbZtPLYMWTI24fya05XbDlMIr7PkxsdfrS?=
	=?us-ascii?Q?gU9jC2mY53sii8gDGtgnsFNDh0FBtxH9KeNNNzRAgMXwn5ISnC7gIq7VgXxC?=
	=?us-ascii?Q?1k7gywYKs6bBNwzHMA7Hn3rI63d0EPZYM9J1PCLGdPQ5uusKniBTBzv+ceaK?=
	=?us-ascii?Q?YVDgi1UsNiMjdq2uR+hypIyQMeb5VZE4CHeeeWQhuh5XDKj1GlzB5rMRM0I1?=
	=?us-ascii?Q?pcIpRHUmIV4tEv7Tn+QDb294Zk91eL5SDfSUtuOJBD0?=
X-Microsoft-Antispam-Message-Info: YlrTRcAMiKyUGrTU2RKYuSeJsfprCjNQaYJG3cwrn+SnJ1DCHyObGlsJgb2Awh9U53lUdfiIjGlWHhiAXr0dA1PY9uzGSxpbvxYK9VXpSVl/s2ToDmt3/q40vijlnkmu38bRXdGT5/nJ1rII03c0zhSFpk8vJe95xJeaKk0LZ8QBx1I9wkOs0kDcLqe6iPlAfrUNHkqD5o55IMJtYfp9BnoMBtD/rq6Pi4MrBaovx36oMgZwF1JUHmsXXreP+0g1CAYstdldgCBPJUa+mSr3cvqwe16JXLQYIWH0gTDeroMLWYN+8yqwRiDXe4WvrQI52NYpL4mSNmvOWhwqE/M5l60yzRl/1KgC1BD3k+uEMSU=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	6:WzaPF4PvIDt9g1Ba18M6WEenY5H8rkq5R6vic3eqeGX1araUit188sO8pBGIDF+8oRsBO514+ioLTranPZrC15nHBPNYnhcg5ZFbluQDnZLhVe68b+84oVdRjmiSVmIhxZR41BlUBtU7fYeqDggJncw6IxwkM7FtfwPdVNL+M5ejHme8yuAhcV9Ezq5rA3sig5ub+3CTUoC/AUT+knQMtX9pchB2VUTjm8cuY1itGzM48W4x3kq9msfPiCmcyGUTEqVlmYXF56iH7tTAEOb2X/02ghnMuMOwmd6eO+o+XNU++fBH+p8GrQ3yblVWJAg5U9zDfdHbrT6xpXT1qRONwYoOc2ivqs0n3I0wkx2gaoSvTq72aqC/OD8yx6mYPGuhi3XDODvNihfd76xXISl3diVP3SMMQdiMFHQfze0Axw6ajHXcpPyYX0vd++GUet4wy4QVCSqLxw4XC3SzrIY6Uw==;
	5:OiPmtiLBhQcBkKe3d79cRjA0SITn1ufuiEIzGcRpEC4hFNojXw3lbEm6xZ251zs+pbmLHjWQfn0+PmMukRDZQOvncsYQbIPKZEHcg/wb1wem7oTDFI0uxRool+ohB8hikYPMg1B6EvQ3uHO8Yfc17Yc+ogAJ09arm7z/fwfZJ84=;
	7:J4+tmCpD1RLG8g3Kcl0+jdzcYlnnYCrDWgU3lzgU5z6fCaT0wh9EZLCmwTlqxs7Ni/enQb11vjXqsZeu8jvLqydmE1BjXsnKisrHkipd7a2ymtnNmWAJ1TlAO9tm26QmCURTeaCPVwmkeodVmN+YcUM2x3yHH6XDzYm5J2fgAe+DIPTJBxs120Ds5cLi79DFWTzlY0P9tbDhHZn2DOFKfD7oLNtSSVnPzNtZktAc+CzrWpvcYK/iKkYpZ2wNwNhX
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2018 19:25:09.5529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa90395-09e5-43cd-1310-08d6378aeaa9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4453
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.62
Subject: Re: [Qemu-arm] [PATCH v3 3/4] hw/arm: versal: Add a model of Xilinx
 Versal SoC
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DuOd7vRoVPDe

On Fri, Oct 19, 2018 at 03:18:24PM +0100, Peter Maydell wrote:
> On 17 October 2018 at 22:39, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add a model of Xilinx Versal SoC.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  default-configs/aarch64-softmmu.mak |   1 +
> >  hw/arm/Makefile.objs                |   1 +
> >  hw/arm/xlnx-versal.c                | 324 ++++++++++++++++++++++++++++
> >  include/hw/arm/xlnx-versal.h        | 122 +++++++++++
> >  4 files changed, 448 insertions(+)
> >  create mode 100644 hw/arm/xlnx-versal.c
> >  create mode 100644 include/hw/arm/xlnx-versal.h
> 
> > +    if (!kvm_irqchip_in_kernel()) {
> > +        qdev_prop_set_bit(gicdev, "has-security-extensions", true);
> > +    }
> 
> Do you really support KVM for this board/SoC ?
>


I haven't tried yet, so probably not, but KVM is something we'd like to support further down the road...
If you prefer, we can remove this kvm specific check for now though.

Cheers,
Edgar
