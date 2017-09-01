Received: by 10.223.188.70 with SMTP id a6csp1499800wrh;
        Fri, 1 Sep 2017 14:04:53 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7JraQwpd0zwDL1bTf05HBHSFagkIJJbKQAFf2F1WyH4oywl6RWbSTBpKIIvo/NqIq5ZG4i
X-Received: by 10.237.53.93 with SMTP id b29mr4442555qte.329.1504299892905;
        Fri, 01 Sep 2017 14:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504299892; cv=none;
        d=google.com; s=arc-20160816;
        b=RoWQnfPlrawyfs1VGvJB5ZT3HQyuuPLp+HYRPppFxg7wP7plRXuGSUMUXQ+r4pfKWu
         r0PSfLoKkYD9Y8rA/WP80QrOwBHh8yWZVUnyYWaYP6StE2AM6t8dKJmaehV1bMWCkhOn
         6wAnjXlhDthP0MiMFokTMEr7yBymbLihGKGeVNFQD7r1I9ObYJyqbjOxSZ/GYawuS01O
         dGbHuymLmoGYecA9pHJ4Yvxh20CP6soGXMPnP8wqT0zjgSGf11BpPYMBmIQo/s6Ccois
         nNxynbmI//ClXJRWhZgRvHNj+vMnp0SCuntI4nyft+9kTRlbQ/KFeFRxyE5GWEd1tXfn
         JR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=FNAzIUiukrqNoMRKfQ1Q6SiXhV7sOE9PEpQnRfqV1lc=;
        b=NNMGtf5tsmXoeB9Rrp5YwQTf/y+mBBRO99Pdx3krxgEJnpS/Op/BzjzSS6Wpl7sJlJ
         bUrS/GYugcx80EzLjblpMP22Dd3VXpyaboWyQuz1vA45a+N+CigdKcLeZJrlQ1hL6Cb1
         qA4pfU885x1/54lljZ/o2qT0TYqeP49yhACBiACaDx+Kxlq2HlS5D59iAfLUKjVL19Jh
         S495BdypbYAvyQf4ZDm4g35f1HKs7VvYMmrBALLskRH/9mFuEw5Ti3d951ITGRQgeGGh
         mRfA1Ld1bgmqZI7tcQkc2j4YGb55esSSuPjElpok/DwgaWg6YC70DOzaVdnCompODyyn
         5FcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=W/YCeZrW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t42si997179qtt.255.2017.09.01.14.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 14:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=W/YCeZrW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnt7S-0000bo-ES
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 17:04:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt74-0000MH-D9
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt6z-0006jy-F1
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:26 -0400
Received: from mail-by2nam03on0059.outbound.protection.outlook.com
	([104.47.42.59]:61310
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnt6z-0006hs-4w; Fri, 01 Sep 2017 17:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FNAzIUiukrqNoMRKfQ1Q6SiXhV7sOE9PEpQnRfqV1lc=;
	b=W/YCeZrW58wm4lxpwueEmf4m24iAM3gbVFEkEZN/ze4qWBjLYQUnNRiY05nGQTo9cYSC51S6wg+onvQ9PDtIDO8kscDCsUwWpMo8RHAkWNL/8JOF2/1VIwsev3Auwfr/ATCLFpahiyVNJ4f4O7QwCuw2pNmVToR+smu6vy+JKeY=
Received: from MWHPR0201CA0036.namprd02.prod.outlook.com (10.167.160.177) by
	CY4PR02MB2696.namprd02.prod.outlook.com (10.175.59.18) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1385.9; Fri, 1 Sep 2017 21:04:18 +0000
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by MWHPR0201CA0036.outlook.office365.com
	(2603:10b6:301:74::49) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Fri, 1 Sep 2017 21:04:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Fri, 1 Sep 2017 21:04:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6u-0004gE-LB; Fri, 01 Sep 2017 14:04:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6u-0007fC-Hf; Fri, 01 Sep 2017 14:04:16 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v81L4BaA021007; Fri, 1 Sep 2017 14:04:11 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6o-0007eP-Ub; Fri, 01 Sep 2017 14:04:10 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Fri, 1 Sep 2017 14:00:35 -0700
Message-ID: <15b2a02d1aae37b49a13a32c5af466e2b63c11ac.1504293917.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504293917.git.alistair.francis@xilinx.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23296.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(2906002)(63266004)(9786002)(5660300001)(305945005)(77096006)(33646002)(81156014)(76176999)(50986999)(106466001)(81166006)(5003940100001)(8676002)(8936002)(47776003)(189998001)(2201001)(36756003)(478600001)(626005)(36386004)(39060400002)(118296001)(48376002)(50466002)(50226002)(2950100002)(356003)(6666003)(54906002)(230783001)(4326008)(2004002)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2696; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT027;
	1:6l5TA89FYD+s3xGgT2uFw2PpebnSNPML5hOY7VQkEmyGVa+JsbfpeopenJEAA/QLzamk28lVMRXZIR7owySulnkPn/DyJJhmbGjNMUQYXb2jfqcOPF23wpk20huwnY4Q
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25bd4ad4-bab5-45d1-fd45-08d4f17d0222
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR02MB2696; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2696;
	3:26w2OZN4AWOowXALJeilsNhrUwTWgK5R3NsVXbItYoMflqyct5pvVKcekRdIGeLSl7MONbaF8WgqI8oEeZFaLNRYvsE+qK3XCu/CIFHvEuj9VfpxBaz/5lbkAbEGo75D7vaSdjVAiHTiqG6jQbLIsz1Y8blSqvOaqJSipG9HRWslUiFrQcf2Fb94b9pHr8xEi+sqJjj1N3LbG+Bf09GDv8AF8f+gmymCouxP+puvogHcqysgTQwT00vy9HXNJXx+e14yMdW6FdOAPG7tsJ90NQB0EklhvSC1xmzZJyaBUCxLk4h/G07WEDN5OwL3D7mqObTFyl6SNIFCJRYFGVOfERq14c8sx5oi2YJuLMuAVZg=;
	25:UA1wQPi0zCpn3gIBrt2bk6SiBfNyOJXCboxcu5Horg7nSmgcBkt2LUW8As0CFbF9VDZyFv+cIYou2hLw5RYoUq3/AncmUlNFf5UCG4qSV6ukSgVpkuo5b5VPUiLa4wKAKkt5I/YThpAsQD3pP2gCmOeFpi2GG8FrjmZ/fxYRjbl2A+6i2F9cET2l+HkxalK1/k9zUqUHiG6ULeqvIYa0qPkswhvGEnKLtdGH76p+KD1YtJBiaJSZ86quppGtUC6+Q0emL95vBGb7oI1htjy1uXKw38JPW5PqXmSXhqNTjjrz6/2cL02xuur753aMIh4cIavBzRexMCLda3yhp4YgAA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2696:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2696;
	31:wPdx6Ix1jOsXZhJ3BvwNoPzGf3mq01Mfq9zbjgLmodYnWmzvdsXb2AAfkFmKS2lZ/KVlSrTA5nTg3kT4TBMeP5gaL/pAgMw7l8jfqpdzK0MSa/Q/Yrcp42H6vnzQY0tWSjaC4xGTEysbo3/C+THWbRX08SlpJ6iAq19jb9+nnthaKRird9teLw5QmA5i+kcS3NnyezjlS1wwBEwhz7I24ZA+b8s7nUHH5Eul1LaZ0qk=;
	20:FSZaZu1Dd5YhoeFYUvEzeSoy43q4Ftoj7GvFFH9mzbA0SqUDhQt79ExXUG/D7dswtx/4r+wx72UyXQ5CdxBQVKiiQV8lbE7HCe77Ax2Wj1RqSSuJFfLjFY/MhwOpJKMMIQkhWUf39MnOLKfLMc8Abo9H8HV+GtnKcbM3OasKSs2VKfCBNhlExNdYXd7wQkOU8mjqvz1EuAOGR/yI7Dmdfj4/CdnrDA1oa3WqfV+1WEZpYwZtP4EG8N6NKir941kW3RWJRsehw/ZuvlDBd9KGhdujiJmX3dfHeTPYkbQ2NI7/cc3IpUlmO0oVuig07rewoL5r3cZ3c0nkbKHcUzt41iXd1pKUGHVKMz2AVOlXQRdpovCgmtuHn1dvtSHsbSc8Dp+/+4uoi6PImiob53Rx8auYAN4s8f37C+kdbcSCfltZ5n4OYSs0GXE7Hjjss5m1TNEjhSrl5athWFAv03zXckawSlHsB7/HCpoqvz4rVlXSEpOtNn3twS/zBtH9q3yi
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <CY4PR02MB2696EDB9387691D9FFF4D8AEDC920@CY4PR02MB2696.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13016025)(13018025)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123560025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB2696; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB2696; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2696;
	4:ELF7DAnt1j6lR88WTH/OqT47ZI+fkWBplTV5dANZ6DxbJHHBxtfvc3rSb1hrAd6l58kTJWg7YNJ+y6WulzdsX9IhZfjm082lvf5lv1UvDxWr1z8zZ3onuwybTEFNYT67L+zF97vmmGpxqzBcFMVcQiSw+rsgL8tur9OIkmQatHIN3u8ZDMSVDYvtE5yvBJIM5t8J4zSf0UyuQXojs8pTz1XigNvTZ3X3TyxqtMcr4uItKSkHOFHJP4gxhwZuWVFjTbqKe98f9F2cKD91d8LN6rwebO3rdvGTmh5ci9P7yrL+kSxEsDNp8y7tx5ZmjGZpOPnsvHxprASLEseleDOqJw==
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2696;
	23:UDPdGnIBheo+3ZDLbirVegFzoDDU14Vvcc2uKNSH9?=
	=?us-ascii?Q?1iGrPqGhd1wKr0A24x1lv/TJTUiOzOJx6wi40pTqo8KQRcai3RsxXAy5Qlnf?=
	=?us-ascii?Q?blssSR9OP2FOp1g3tt2XfzSmHavdTHTZMrqGbktSUKqpVhqusOFYGi+aPc54?=
	=?us-ascii?Q?gEhoegf0Z1oY6J21lTQn0SVwFa8QccEjVA0J2FTXrwwVeE8CQ763AisTkrZC?=
	=?us-ascii?Q?Ma+6aW3yvnzerqM9QAcXpQ5tl2HkIOsIrkZdoL9gMUKqX7iIKthKLKfKKsH8?=
	=?us-ascii?Q?wjFSQhNLWFzfHQsduMDg88lJI7C9WqHlcJ/YPAvmRm6k06BsQvpg5QsOvCe0?=
	=?us-ascii?Q?sSBH5nnTgTbOeaPeH7SN1sHN2Pf9YAQw37vm58dYmArR2nXPAh1f8PpwuE2D?=
	=?us-ascii?Q?69DqtifF20/j5uHo3277QaSN7Ls6DHP99qw75ZS9Tq9P5z2fHmPJmqW42JSi?=
	=?us-ascii?Q?fQ0RA/swG6j7yIMxMdmZEOthnfv+bRzBwuajudlnquyHZJl7oOyEPTH1K3Hb?=
	=?us-ascii?Q?sEKnkdoQ3a+LPwwMebqEqFHwGDHRFKQkEV0jfTXmtyXCJLfUsCMFkEz9iMIn?=
	=?us-ascii?Q?9GlApeoGUuXazOdTYMsTSC+Bgk7I35I+mvIs5OVjNy8ZUP8r7hWLN8S560Sf?=
	=?us-ascii?Q?/+c3lji7zroBmuCP7Tp57d95ultsoq5NgF+0Z8orEd19NFkh3zMulfYa5h9x?=
	=?us-ascii?Q?kEsnyVDUWgyavS/It6N/GTI5DEd4I9cB40pi0c5E73QPhJcnw1iNqRCRtGRO?=
	=?us-ascii?Q?d+w/8Qd1MB9jIknXyXMvlZ+SNqNJQKdA3XPhKm4hsIZGJcizoyXBHLM8xb1v?=
	=?us-ascii?Q?GtzVReIrsirv20iUP5byMwKHTD9rMn0ZvY1pl0ZZl5Pk7sfjwrqMBOwrqwur?=
	=?us-ascii?Q?Igvkh4lKQFQuQLcwTwu3/7mYYk5U0p/Vuv0S2JJ5ungmoWJytLkesNwaOsRL?=
	=?us-ascii?Q?6RoqpwPxC7FlaxWVhv7uZ6pUnKx/Z3lyI3PnHH0i2dU6OFUEM/RmqezKNQnI?=
	=?us-ascii?Q?LijZ6Aj703aZ4YPv8bZdeRfR9GG0W46/48JuQ1WQGtk0w=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2696;
	6:20EdJNWwgG5OZ0xX36rst/9HZ7/Cq7hAFhL8jEcgAY73xRyW0czeayjBYWGH/inf0Jp+EQP5HbNs7ot9CMHXkOOAFwV/Hpb4y9BFRhkBkVZXV884rxDBW57kA7VrkYRt2zHz1yODfQZEQtNVLx0dpCmYozoY6iIUGxQeHMpTFxOiojpuoA8cUV/r6E5LuabDHBqJHDx1D0Rh8WMjOFh9kiVfEKZrRKrGtX8IeOd9LYo64Hr9wxyiYBifQ31YwI7yB1NIKBK20XiwEJwPIrA1UA2TIncwSZ21yLYGgJcE58BRtvnjutdGe5Rdz6jPmT0cyDsIM6+XYFL+nbNoQRD1wg==;
	5:l+F39Um2ppU+DzveAeDjJ/rv8iN3OR2x2QEu+nDKu9fIuAOqtPmC7fPWr0UKeLnoI3h2tPC4rdABODkHLZXHkkk7FsRVM5bMeZ/7x2i/E7g5VFRzUNPJyce/SdQrdvc+rmpf6ng13ptBO1cLJGPJgQ==;
	24:dnVGAaAwNxNpthNw0Ff8tpD0p6To2fYyPLu7BVlCLMFbNvoNyc8t0SD9ywPncoZIdjfsXNfRZ3l56zbFzW1+ZJhgeiJtoKaSd9dnoxh9Joo=;
	7:18wPGo00L1udMMn/TXkXUF3iEq2sRy/uG7IyKFKiPF13ymZElrzBT7+JOUbrDmuvFGwNtIocl6x71K3+ljxC4olSJLJxcLQufeJelz1c+1qxSQq0L9hDHQOCllr+4JQD1MlwAO+JaJnTKIrM1lBfNY/Ckpx0SWAsqlJN/QUTJYfKFsTifeqnbmYtQf9uk1atdBsZV3SspEI5LSvddMzpzpQogyJrxPYvrYWsxkoNMgw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2017 21:04:17.1073 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2696
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.59
Subject: [Qemu-arm] [PATCH v2 1/6] xlnx-zynqmp-pmu: Initial commit of the
 ZynqMP PMU
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OrZSKltAauzE

The Xilinx ZynqMP SoC has two main processing systems in it. The ARM
processing system (which is already modeled in QEMU) and the MicroBlaze
Power Management Unit (PMU). This is the inital work for adding support
for the PMU.

The PMU susbsystem runs along side the ARM system on hardware, but due
to architecture limitations in QEMU the two instances are seperate for
the time being.

Let's follow the same setup we do with the ARM system, where there is an
SoC device and a ZCU102 board. Although the PMU is less board specific
we are still going to follow the same split as maybe in future we can
connect the PMU device to the ARM ZCU102 board. As the machine will be
fairly small let's keep them both together in one file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/microblaze/Makefile.objs     |  1 +
 hw/microblaze/xlnx-zynqmp-pmu.c | 83 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c

diff --git a/hw/microblaze/Makefile.objs b/hw/microblaze/Makefile.objs
index b2517d87fe..ae9fd40de7 100644
--- a/hw/microblaze/Makefile.objs
+++ b/hw/microblaze/Makefile.objs
@@ -1,3 +1,4 @@
 obj-y += petalogix_s3adsp1800_mmu.o
 obj-y += petalogix_ml605_mmu.o
+obj-y += xlnx-zynqmp-pmu.o
 obj-y += boot.o
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
new file mode 100644
index 0000000000..fc3c8b236f
--- /dev/null
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -0,0 +1,83 @@
+/*
+ * Xilinx Zynq MPSoC PMU (Power Management Unit) emulation
+ *
+ * Copyright (C) 2017 Xilinx Inc
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/boards.h"
+#include "cpu.h"
+
+/* Define the PMU device */
+
+#define TYPE_XLNX_ZYNQMP_PMU "xlnx,zynqmp-pmu"
+#define XLNX_ZYNQMP_PMU(obj) OBJECT_CHECK(XlnxZynqMPPMUState, (obj), \
+                                          TYPE_XLNX_ZYNQMP_PMU)
+
+typedef struct XlnxZynqMPPMUState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+}  XlnxZynqMPPMUState;
+
+static void xlnx_zynqmp_pmu_init(Object *obj)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = xlnx_zynqmp_pmu_realize;
+}
+
+static const TypeInfo xlnx_zynqmp_pmu_type_info = {
+    .name = TYPE_XLNX_ZYNQMP_PMU,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPPMUState),
+    .instance_init = xlnx_zynqmp_pmu_init,
+    .class_init = xlnx_zynqmp_pmu_class_init,
+};
+
+static void xlnx_zynqmp_pmu_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_pmu_type_info);
+}
+
+type_init(xlnx_zynqmp_pmu_register_types)
+
+/* Define the PMU Machine */
+
+static void xlnx_zcu102_pmu_init(MachineState *machine)
+{
+
+}
+
+static void xlnx_zcu102_pmu_machine_init(MachineClass *mc)
+{
+    mc->desc = "Xilinx ZynqMP ZCU102 PMU machine";
+    mc->init = xlnx_zcu102_pmu_init;
+}
+
+DEFINE_MACHINE("xlnx-zcu102-pmu", xlnx_zcu102_pmu_machine_init)
+
-- 
2.11.0

