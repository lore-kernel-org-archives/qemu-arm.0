Received: by 10.223.197.9 with SMTP id q9csp5134307wrf;
        Tue, 17 Oct 2017 17:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RG1PylbwwdK3N23LxsqcI28iG7Tnd66L0UPD+JpoHFaCxH01M1PWa4pM+iAR9L3cJweZUe
X-Received: by 10.200.42.118 with SMTP id l51mr736660qtl.37.1508285818225;
        Tue, 17 Oct 2017 17:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508285818; cv=none;
        d=google.com; s=arc-20160816;
        b=gaBhvZSBDQizytELbwgXhfsZC3a4wL6jsL8otZyEHzbmJ/93RcvfcerqcSsNH1xv+3
         538U9Hzo+ELzUdCgVMg8NNlw3tEN6TsMc2qkztCXmQI6tyfimggs5d/Ao6VTixImcd0h
         GOF/i8l0w1RMXRBMDOyeEK16iH8qvyoMfnW0NfZxAMdHKLSoy3RStFuPAMhZ93Be43sO
         RFUc70m6g55h1N53AjC6ja+aBuWFn4kNF3sl5pdyjIEwEpjiRrCYYO7kmN/GzrErRcqU
         JIb6+ot6y7DEgrHRYWP2dhWAdNYgy8GtEJkkhjCXsshSMceqYs5uJlPFfyTyjQlt3XS1
         aMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :spamdiagnosticmetadata:spamdiagnosticoutput:mime-version:message-id
         :date:to:dkim-signature:arc-authentication-results;
        bh=j7WKkavp/OCuDUQjAxj7kUm1OmdCdNdtccaMIMVVGXg=;
        b=EpIEv03acR823KaDOyLCmGN4C19V2CsQNdmFpf15qsZ0tFCtjh1dsrQXV5ntFlNTtY
         1xHMsCWUU9VwLGNzNbck0tZJBWIlnOR6Goc7qHTGiVxEkebJR0qVR9vA+wCYrZZI09Vy
         SROhulmnM+x6E3GIE6dL598uMuzfc0BATPXkkr0tj1LLX19DX1spWl84ZVUW04KI6NWF
         8IRWNQlh5+i5v0HPh/1P6oC5CmTc6cPOn0RXi8HKYh8I+4LDsM0O0kZsN4zprTrB+PcL
         JqrfoHNdqdhwMab5oR0rZnfH51O2iZZMa4O2nonMBykmqvsJKNYOm/030xDI7Yqx2tUl
         7pKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=XX32ldKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x40si2677853qtj.258.2017.10.17.17.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 17:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=XX32ldKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4c2Y-0001py-OU
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 20:16:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e4c2M-0001oU-26
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 20:16:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e4c2K-0007nz-SP
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 20:16:42 -0400
Received: from mail-dm3nam03on0106.outbound.protection.outlook.com
	([104.47.41.106]:13290
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e4c2E-0007ih-V4; Tue, 17 Oct 2017 20:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=j7WKkavp/OCuDUQjAxj7kUm1OmdCdNdtccaMIMVVGXg=;
	b=XX32ldKdR6OcK/WpMXunQ4MnFkmmGCSo84iTZQKxy1rkpnB2J9VLU74nL4k246v5NnI3s2qB1KzllNKfbTNsAyr6YJPYOy+/2DGqt0mLmDF8uUo2/0+noKaNswwSFP1aAxGRfsk4BqdZY20YgXnJtJ7bwtHpqBKF/u/NbFm4ffQ=
Received: from localhost.localdomain (2001:4898:80e8:5::568) by
	MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.178.1; Wed, 18 Oct 2017 00:16:31 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 17:16:08 -0700
Message-Id: <20171018001608.8388-1-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::568]
X-ClientProxiedBy: CY4PR1001CA0002.namprd10.prod.outlook.com (10.171.218.143)
	To MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e0cb76c-b9f4-408e-0137-08d515bd7c27
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(48565401081)(2017052603224)(201703131423075)(201703031133081)(201702281549075);
	SRVR:MWHPR21MB0159; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0159;
	3:sMNWc9hc1pZz7zTPWujbNdHOuWVUcaHp0SmjSna/klK08c276dPqB4TyiZs8d1l1ytq7cjnHmTHTcVs7VHFoQh0P3thMS9RucB0a7Z+MuFOn03h3rDsSyg/pTMdN1BdJN+IU7+KgP51Auq+EKCKwOtvUSq7LM+su17i+nf+LHsondBwT6vPO4p/MsgjionIwb9plUpY0YmPbgzcsyzd7QMCDxcqtNiIh7jSqSbUiodXb3A41/0i2fD6C1N2GFryQ;
	25:Q0jjUr5xHQUFPSqYspspSSketw6OLlLi+J8SpjmY98WZnXeXEGcc+ikJCMUTiLihleOF/DocAQLRSf5sSFO0yixlNyK/YIzGHTYUeYhWeDFcuOFd5P0lwQtMUy1wMk1+Q6WrvgKwhfwpgqYBJyXCmZZ5tib2H4wSC96qz8ircRZAmRmtqr40MF7XfUiO427FZup6lR9wsd4th8Nc7eL/hfDNi1zv976joexOGzBZNH6pExFIqIqCNesLJnkn6IO8NHZ8bOR/3EoFlaBNgcZaSWQuo8YOQK0iHOWScCQ9OLQRGSt+OrkN3U2FsF11mPB+//s8ZKJxjqVLiSsv2qL05Q==;
	31:PFOpI0MmJU06Hl1M18gZ3C32wiZaV1NvQWHoKqXk/UjC21c4ykoqPcNItqeWbeP0cLr8wWTTn/grTdiVATLwxwU1zGV/ANgN4L3NatZsr0i4AvoCVGidvYhtQIQBHB7KY6CW/UdUyZBUPu8miYeknS55P8P1YVbKocDeIJE2wLz/E7EMjGLVqUmW4D4k1FuI5FSJO8ggzAiELkiR35DVtuvpRmIL8+EiltXtUmtFhWY=
X-MS-TrafficTypeDiagnostic: MWHPR21MB0159:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0159;
	20:gnWMXGxeV8u6JhhcdgzpPrJsos3T7VC4s9qZtMgOL7BSwziyW62VAQSZwIrbYrEqdTIpQ0IRebQYpDkCcreVyX+R1Fyi5LqfF29NIS1GXm40LSlcNaXvaUxOmIXYUzTL5PPkPMAI2OtTBn01M/1fX73ZnBKiNgCi+1PcJgEmXsB5Be47Yd5YuEKzV/2ODqjla91ctZtfugOkxGtIqg0/XQdzq/UgpXbAkmF/M8goiZI7vXOSs86kV5THcdVH118zcEfgd2DFbY1FD5hwICwW+uRGnopMwPOOjFqctDoRoKxWZJLZ87EWElalwAQRTfJIB5jh8Cyf3LJZqC0gYYOCgxObCgD8y3Q4tazdMhqwZ2hcjaFd+WbRwpqEuMbDck7jmQoyVphQUpwmsYdutD+9e124sxfATrR/bb9NOvVBEF+DZxtilccMRwJerXBCge4j6BCYVE/6GkghICj2wGytwOXx1nW1Sfwdb+h+oH4jdz3ZK03m6OSfZ0K6H51rmbh1;
	4:T1MaDZc3kcW6EBPnan1nBqCZcDGICIrJTOziadLfcKmHenELjhrp2V6eG+kIP8LtIleE/VwVmYTmG37Ejy2SDhQ4L1hq+I9QSVtLzGiiWDn8PJEG2n4cQzrD6tsB2MWuzHXAXvr+tBrIaGfj3dYQ7xuTCQ+u/tZET/71Ha++rm25mwHlDrHhcVBO1JX9mDif/rWMyR+VoTardmB7S23rrnh0wL53h27iPtbxmeSGgHN/KxrGlmODzsdrz6pX6/XCZtiPxTVlkPdgO3lT7a9StQ==
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR21MB0159E0D04C5718C7ED6751B99E4D0@MWHPR21MB0159.namprd21.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(6055026)(61426038)(61427038)(6041248)(20161123564025)(20161123558100)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0159; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0159; 
X-Forefront-PRVS: 0464DBBBC4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(6009001)(39860400002)(346002)(376002)(47760400005)(199003)(189002)(36756003)(10090500001)(47776003)(316002)(6506006)(7736002)(22452003)(5003940100001)(6116002)(16586007)(6486002)(10290500003)(101416001)(6512007)(478600001)(2906002)(189998001)(305945005)(105586002)(106356001)(97736004)(25786009)(53936002)(575784001)(86362001)(50226002)(6916009)(72206003)(50986999)(107886003)(4326008)(1076002)(48376002)(81156014)(86612001)(8676002)(81166006)(68736007)(5660300001)(8936002)(50466002)(6666003)(22906009)(21314002)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0159;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR21MB0159;
	23:ZTE4T7XLObnQ6Ruhf3gSI6+DLk3KLKZZ3mmshIiPM?=
	=?us-ascii?Q?rbH6iHBtQtSy9/a8grB4vpCbFC6IQ96tHgyMBdlthh9lQ5Gj2LD4BrIwp4Qk?=
	=?us-ascii?Q?K18rsEeiAvDzUqVuRovbqOA2C/YcEdFrr19SzHB1zhDRXDr/G5X58gEvZJjE?=
	=?us-ascii?Q?lximw01J9D+tG9PMk5YsXNQI60fKR7OfjZ+gY19cA2ajtyCEC9Kp4AZY/vZV?=
	=?us-ascii?Q?vtI7W0W90sUGZABV8+WB4pU6Vt2ooM2mL6cVB5XV4hy3Dw8lYSXBwWoGx+uj?=
	=?us-ascii?Q?8bLUX1x6NHVIYgWnjB7brjBteGR8EbAlvi/5hQliJSdLCWQhA2TQQev7+414?=
	=?us-ascii?Q?5HlHj5rSt+YKHpb3WgExOxBsUMvR0xOXi89K1ThVGOGwgMcoh04qrEbaL0DI?=
	=?us-ascii?Q?d4u3ob3hjsgDlPduQqq+Yy/H8o7c2pXZx8vOCGMgrAbG5Q2AFXNH7fcWtTqx?=
	=?us-ascii?Q?hcoxsGrNwfdh9Pa27IohqZin0J34FBXOKnL6C/CFCv34MZxxJJc0QV7oe9YA?=
	=?us-ascii?Q?wcO7jqc6r0BXeg3ufTv1wP6ABdRYYhTmKupJ/vnJyBskOoTnPOQ6ENoHjQBG?=
	=?us-ascii?Q?JqFvQ4sbCt9Q8WxuhMVxGGgNqk/5SgXRHZdlI5lsdyng3hJquLwWQRe29DyQ?=
	=?us-ascii?Q?pei1Pi1wjSEIJjcFa6oFPC8l5fHcyJqajQYE2/wIPgNBh1MGCcyBO6F2IAOj?=
	=?us-ascii?Q?vou2w91Rj3mtaSiJ6gvzU0m5z4/gtQ6ybd+0VIC9vP8Z1SznYSSb80ZVNR0m?=
	=?us-ascii?Q?qJFO9bB9rIcnoqBxPoj+hr871uX7LfzIqOhLn/311vMuwmfkrMtTAX6Olgdk?=
	=?us-ascii?Q?dy9ryG/HbMHL0vxGUXOERRhDh2eRv45nqdbIQJJGkYxZnPC3EfC66biXGxfl?=
	=?us-ascii?Q?MdEno+bDhh8znPbDqyONp8iaIUs6t5+AsC9Sol6tG0r64+MXV0UiRsT8lM/o?=
	=?us-ascii?Q?VRcvPM2ypVEFH/n98dw+TfIphyqkgl+dBKEH5/EC38wZb/m1LppzSNY4FGjQ?=
	=?us-ascii?Q?CS+R2IDe5dmzdVsLnXiHZ/Klghl1w5mr+5g+mE+8+I8KgLjX6zDslJSdPRPN?=
	=?us-ascii?Q?roSuvWIGpSOeuSbUbxUrkEVcAKOOLW27+yGc17s0WrV7PrDRQTxJCVpbq97e?=
	=?us-ascii?Q?DU5NX9DBCSPQoQ2dYGMZIFBlzT9NAtxw/PTUTYbpAt8Jq9lwFmaknCVghLeE?=
	=?us-ascii?Q?v3vbct8Bxn4aKs32wRxG12nir4rzcT8QDWAuVgl367sbOGhByithiW7bQMbC?=
	=?us-ascii?Q?Ayk9aEA/DJQaepVztMIYanQNX06wOUadxdjnoje?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0159;
	6:8D5Ck6FPjm+DSGJhjU7+iLG4Bc5xN9BIS1uEZvjd7HJla2EmvnlGkI/Zj9enbvcwhJzwQdUKTCT7J1SIbs9YqY6MZ91dOhUBe/oK7phaad1WoW2dwbd4rt2IGgIDYS9TpSGL4aU+AZUPozWcK3dMYDglpf8bpYGw0aDsFoykrWyvv+9bvUxXCJaUqTNQPODlkDBP/JoxVK1HKwVERKjsaA4xTOCqYGG6GYwIj8o/s43cpkshU6YvZ3yLLl1ZqGGPRwLIoD/PdHQ6v4zstYr7mjOl+Bee7VhkonR3Jr+fCJmydPrVAygWEvbUXr3g+B1SoZscA2yWJbV5anaapZz3BfkgYmDauStZNlV0KNhFU3Q=;
	5:yafx2GpYGDr3+piVBhAhFGuFnNO6vXCp1sDy0V62x9edyLv3EZ4WaLZkZcg6RQvAR3rroeM4LuHSS661PQPPSc0TDJm40xxg2wm3nuvceRYeVC2xV+1TTQZDrvPGKomMm7uD1CxdCEuRwzR5KgzIhkON5ylHNRJ1tL/GQWx2tnI=;
	24:FJglPa9rSo/SojbcFTYJ5+opaVX4CchLv08bVJ3MVskNlgqLDnq9UlHkVFLl7uXfDH45xHhy/7TV5wAmWsKfoxRvCDIQgq9PgFkP3jFW3/c=;
	7:Zo21duj7+2kPYRC5mu7Mt+q1FJ1U56U5i+qWa8JWW4WYff5cRJ4ukT1AhzmM3d/+VWyclVdb/z3IS4Hmo5ab6LKdgPuhnO9FrYU2OwbuTm2SQptDY6QsjUb6sqUnQ9w6liFP/CHz+qkq7RlA5yFRiDO0BP/N6lU9yEipjfkmTteAcExXkdeKy5xzr3hm5/y6UmfzOuUUSTIK6NpPw8lq/uiRg1ttiQl3rT5iXjFN3o+YSB/soOO5rb1P2G8axnW9
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2017 00:16:31.5833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0cb76c-b9f4-408e-0137-08d515bd7c27
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0159
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.106
Subject: [Qemu-arm] [RFC PATCH] arm: implement cache/shareability attribute
 bits for PAR registers
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
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: skJcvSyN//pc

On a successful address translation instruction, PAR is supposed to
contain cacheability and shareability attributes determined by the
translation. Previous versions of QEMU returned 0 for these bits (in
line with the general strategy of ignoring caches and memory
attributes), but some guests may depend on them.

This patch collects the attribute bits in the page-table work, and
updates PAR with the correct attributes after translation by the MAIR
registers, but only in the restricted case of an LPAE descriptor with
no second-stage translation. Other cases log an unimplemented message,
and return 0 in these bits as in the prior implementation.
---
This is my second attempt at implementing enough of the PAR attribute
bits to be able to boot Windows on aarch64. I'd appreciate some
feedback/guidance on the following:

1. Is adding these entirely ARM-specific fields to the generic
   MemTxAttrs bitfield the right approach, or would you prefer a new
   return field from get_phys_addr() and friends?

2. Is it acceptable to implement this piecemeal for the special LPAE
   case we care about, and defer the messy special cases for later? (I
   hope so!)

3. Is my implementation of mair0 and mair1 (with the XXX comments)
   sane? I suspect it's not. I had a hard time mapping what the ARM
   ARM describes (e.g. in the pseudocode for AArch32.S1AttrDecode and
   AArch64.S1AttrDecode) to the union interpreting mair_el[0] and
   mair_el[1].

Thanks,
Andrew


 include/exec/memattrs.h |  3 +++
 target/arm/helper.c     | 57 ++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index d4a1642098..3f4e1d7f0d 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -37,6 +37,9 @@ typedef struct MemTxAttrs {
     unsigned int user:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+    /* ARM: memory cacheability and shareability attributes */
+    unsigned int arm_attrindx:3;
+    unsigned int arm_shareability:2;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96113fe989..1dc1834929 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -19,6 +19,9 @@
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 #ifndef CONFIG_USER_ONLY
+static inline bool regime_using_lpae_format(CPUARMState *env,
+                                            ARMMMUIdx mmu_idx);
+
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
@@ -2148,6 +2151,54 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static uint8_t get_memattrs(CPUARMState *env, ARMMMUIdx mmu_idx,
+                            uint8_t attrindx)
+{
+    uint64_t mair;
+
+    if (!regime_using_lpae_format(env, mmu_idx)) {
+        qemu_log_mask(LOG_UNIMP,
+                      "arm: short PTE memory attributes not implemented");
+        return 0; /* keep consistency with the prior implementation */
+    }
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_S1E2:
+        mair = env->cp15.mair_el[2];
+        break;
+
+    case ARMMMUIdx_S1E3:
+        mair = env->cp15.mair_el[3];
+        break;
+
+    case ARMMMUIdx_S1SE0:
+    case ARMMMUIdx_S1SE1:
+        /* XXX: is this correct? */
+        mair = (uint64_t)env->cp15.mair1_s << 32 | env->cp15.mair0_s;
+        break;
+
+    case ARMMMUIdx_S1NSE0:
+    case ARMMMUIdx_S1NSE1:
+        /* XXX: is this correct? */
+        mair = (uint64_t)env->cp15.mair1_ns << 32 | env->cp15.mair0_ns;
+        break;
+
+    case ARMMMUIdx_S12NSE0:
+    case ARMMMUIdx_S12NSE1:
+    case ARMMMUIdx_S2NS:
+        /* these cases (involving stage 2 attribute combining) are also NYI */
+        qemu_log_mask(LOG_UNIMP,
+                      "arm: stage 2 memory attributes not implemented");
+        return 0;
+
+    default:
+        abort(); /* M-profile code shouldn't reach here */
+    }
+
+    assert(attrindx <= 7);
+    return extract64(mair, attrindx * 8, 8);
+}
+
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx)
 {
@@ -2173,7 +2224,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
             if (!attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
-            /* We don't set the ATTR or SH fields in the PAR. */
+            par64 |= (uint64_t)get_memattrs(env, mmu_idx,
+                                            attrs.arm_attrindx) << 56; /*ATTR*/
+            par64 |= attrs.arm_shareability << 7; /* SH */
         } else {
             par64 |= 1; /* F */
             par64 |= (fsr & 0x3f) << 1; /* FS */
@@ -8929,6 +8982,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          */
         txattrs->secure = false;
     }
+    txattrs->arm_attrindx = extract32(attrs, 0, 3);
+    txattrs->arm_shareability = extract32(attrs, 6, 2);
     *phys_ptr = descaddr;
     *page_size_ptr = page_size;
     return false;
-- 
2.14.2

