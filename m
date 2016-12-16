Received: by 10.25.205.13 with SMTP id d13csp733743lfg;
        Fri, 16 Dec 2016 07:02:43 -0800 (PST)
X-Received: by 10.200.49.165 with SMTP id h34mr2846785qte.43.1481900563048;
        Fri, 16 Dec 2016 07:02:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127si3368225qkk.40.2016.12.16.07.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 07:02:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:60984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHu1w-0000SX-Ct
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 10:02:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHu1I-0000FB-BW
	for qemu-devel@nongnu.org; Fri, 16 Dec 2016 10:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHu1F-0005Pq-7y
	for qemu-devel@nongnu.org; Fri, 16 Dec 2016 10:02:00 -0500
Received: from mail-db5eur01on0106.outbound.protection.outlook.com
	([104.47.2.106]:3543
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cHu1E-0005OI-Qq; Fri, 16 Dec 2016 10:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DzmzeRVqJAhkiRiWiXsCBdOgruSXdUYuuiImH4dEw6w=;
	b=J70kkSSrvbBHISZ9JkOvbzMuSNgt5VMIbOWCmEhVwZeA1+hE7cdGVi+FDk4hSXfoBR+pyfrfTf+iuHZhdho73ZV/YvexAzc2erfm5xYc28RAltgAgFbK6YUFdh3AEtUI4SDVUIzdTzUyoGbMqLsKiIxe+0felJ3J5nTtzPX9AfQ=
Received: from VI1PR0701CA0070.eurprd07.prod.outlook.com (10.168.131.160) by
	VI1PR0701MB2719.eurprd07.prod.outlook.com (10.173.80.143) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.5; Fri, 16 Dec 2016 13:28:07 +0000
Received: from DB3FFO11FD043.protection.gbl (2a01:111:f400:7e04::196) by
	VI1PR0701CA0070.outlook.office365.com (2603:10a6:800:5f::32) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.789.13 via
	Frontend Transport; Fri, 16 Dec 2016 13:28:07 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.38)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.38 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.38; helo=hybrid2.ext.net.nokia.com;
Received: from hybrid2.ext.net.nokia.com (131.228.2.38) by
	DB3FFO11FD043.mail.protection.outlook.com (10.47.217.74) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.7 via Frontend Transport; Fri, 16 Dec 2016 13:28:06 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1511; Count:17
Received: from fihe3nok1347.nsn-intra.net (10.158.36.135) by
	fihe3nok1349.nsn-intra.net (10.158.36.137) with Microsoft SMTP Server
	(TLS) id 15.1.466.34; Fri, 16 Dec 2016 15:28:04 +0200
Received: from mailrelay.int.nokia.com (10.130.128.21) by
	fihe3nok1347.nsn-intra.net (10.158.36.135) with Microsoft SMTP Server
	(TLS)
	id 15.1.466.34 via Frontend Transport; Fri, 16 Dec 2016 15:28:03 +0200
Received: from fihe3nok0734.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDRiga011467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Dec 2016 15:27:44 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDRhR6011449; Fri, 16 Dec 2016 15:27:44 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 16 Dec 2016 14:27:41 +0100
Message-ID: <1481894862-14102-2-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.38; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39860400002)(39450400003)(39410400002)(39850400002)(39840400002)(2980300002)(438002)(189002)(199003)(86362001)(97736004)(2906002)(5003940100001)(6916009)(2950100002)(50466002)(305945005)(77096006)(86152002)(33646002)(81156014)(53416004)(47776003)(8676002)(4326007)(81166006)(2876002)(2351001)(38730400001)(36756003)(106466001)(92566002)(22756006)(8936002)(50226002)(5660300001)(50986999)(48376002)(76176999)(356003)(6666003)(110136003)(68736007)(189998001)(626004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2719;
	H:hybrid2.ext.net.nokia.com; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB3FFO11FD043;
	1:o4vX/jnwH/i4kUR51E5cc36H1h492zPA6Q9mmSiVLBrX7zH+fgEFlteGPrS8zQSzh2/H2JeDfYuZTEPXDqzYIrqvTOrZLpPwgTm5WAQEM2PGE5IhpHs49psY7ToSMXnfHHV3TLLjkiBrGtd/txVTsDGiIUtDDallQKuU0JxMstZPQ4upTMzlshRX/yuqCIKYUvIsIHztjNuRfdHq6PWq+U4If3E0xbwe42FgMATf8sOksipJuTmJNZ5Yah22uQBT0/Q92fz4/I4LDsoVQHl8RYslrbUu4cpkxxI4ILxnd7wlvy+xV31NEnX1yyTiU6HtPdm5oBpimdrGrLqm097WZKVx2oa646IlQVlhddt71lRqnph9KhBAEWB0aoFoM7/sJoRU4YSNtNwvovAhGsAD/yd49GgUqxZAh8tilK1XzTK8xASBTHb4Uyz1l4zPxuqkEV2EhKviHLnKauLQvsVL+PeDTuXeMe/5gXSU1d+MAvqC/benkMVTGu8xlULsynZbCXxUCRew2jLdVvxSQyZguw==
X-MS-Office365-Filtering-Correlation-Id: 99a2d4e3-cc28-4e0f-5abb-08d425b75f13
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:VI1PR0701MB2719; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	3:SmXFJu63N7PPSVKMrMCJa6UrVK/Wn4QplahR5AErvgAlKbplYEi9w9sz6nGXzYvgAJZ86SnmHo8GfKbQlwaJGh7y0uoIk0IrQdmYCDWt5spLKCyjPahoL61cWF3d9vEawEZp/v1saCFg/64RF1qoAWSPj+jzcHlfqUlrGQ8DP/FAFvK+CtL0WEsHzSzBErMHr1VKFRa6rY+nMUfuurUqNjF2d5jaEgOqjwNBYJnJne1V+opqITCrQNLeLZoVGIPtZ019NeJEo6dOvWXnHPHHFuw3ZWW7l9izgasQn8OgmVFv51nka3EW75O2y2Jy/7vRtn5n21k0TQrchpOwaCfMeSMAC94YSFLstLJhwwiDErQiDZTMxSLkZQ6zeA3oNMP13zciWM21xkvwFM/97zwmOA==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	25:D8BKvTIw8Q/TSAScBzHoct2wHRhRZHnrxi4R8pcgV3PMaZ2U60WL4Hp9sQ1jvpb4T+pLjd+m+dUVbmPhyllgIXRLOplo0bGT7/7Y3sgHJJ15oWtGEjZiwJQp0RVF0/sL/MYCXghvk19dELF3fOAUuFQZnpcSLeDVE7q+M+sneMhDts+GD0popHC87lVaMJ4lY0vaMn01nzzDXI8JMF5VUMcSCREfXC4L6ZmpEbPHqATMMWWUU/2H759uyXZRA+gPmNQDu6513Gl+K1zg5YpQdY6xssZrg3nj1nIrvXaZbXdMAPAGxkMcIlkHEo96iqP/t+KFk6KchVYTZz3YR40AvGkO13U/R1U6+C7jcsgI+ky3sJq6tOb5BUCe8JB9Si8R8OLTqF8MNBnUsOQtkvZYDVH+mclo52TSBhGaZjwyfny/rdWYyuv4oANd+TQSg5LSniRkJ+1w9Y7LzKatm546uVJLfEbH2usBc+wU/07F5IAGAour7/n26yyuToXbQKNky70F817paasHGIrXAmu8JJel3plBc49HrSELZ+t6/sw5ImYfEZgWnoHUpnwPImdRwqGBXEjBefS+7LittYFiajhWt5EOihv16vpJKIMxo/5MrbVXnQnAYqVaBAUnxle30miuXN+S4W5DCgaqXy60qajqOdvEHHW4kuPb9RgrwMUgfHmqtK71aFgExzAlmA5Tjn4mTKL+6DNrMNJfZBxTjg0O2GCF3SBUgREaqN6Ag4sjuaNfRoxE1285uWtpngwyvgox51Rx8ZRnqzbigaJ5YQ==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	31:/qAvNAZYP6EKZS7/4sJKM0hVGNf9nvF6kvy0I+zbkKoAIVP5A+uHgbOTK/APrE6IIfN27hoKgK/ltatOMVl9jgbc9d+TtRTwVbCnbLO7T4NjCmjqL7RLbWNgQUbiPCkgUtCGekuH6AsWZTBGQBWxPTz83IZTvyZgm+/92KCe7FQaRfXot8hXiXfb7b4YVzxLFqj4GIDJQH6IycQjMbJYy/M6lkpjvfwvD7xt7kdzn2rXd6xuGmeZk+DVDUmOEEyXOLVls4ViRLZqsTMqdnPIsMlKfrBGnIqtYbDuS4wMBN0=;
	20:8VM/SWuw2LlwugPKsa7VZMgHqT7k/gyBxuYP2hX+93SqMTJNriNDAkhVNmd4sMrpnk8vsoYbsGOJd6qqk4xF+cO3nWWoYsibULehjgJ0ECDE3u4RwIwX+T3yyNF+hbjRuBL3Tc+fOGe4IS++W7KJKsCcq6AWMJuD+or+KWlrKABqdhnZOPaxwGA597oafQA8/GSyrli7xUA0o6ljsNXHig7zRJp3Gv9gH5NrURJeAK5OSS5OFIZ+UYGli3BwTO7iOwVTl2O7ow6aHCJtgoSOtSk8RTdTR0+2A7Ron6z0LV9Prq14y790xTwPcnifLjPfVmR0tlWC+pX5U4UoGc3aX3/IhTIW8BuknCjck53oAcamXVOmIF+m8lWqchMdnKNDj7xH9E7u5x9YXteckk3Dm72Vv6aJBEy6zt1woXaUG59yuZYwN6Gar3ph/xwJ0pie3+InhsCsTKNXB+FT3TAMwEUXgoOIRKFpBbiifpCUu3HiQaZcMnOaMi+5FrBKQxQCIKO1gMjshXQLvFDbKtanjpyRT8D8r1j/NH/8pM1alz+y073DmaPvhVmrFJSXG4C7WmIRwWEQh9c7mDrczt7We8nLrVDOojlSpKPkl538oRs=
X-Microsoft-Antispam-PRVS: <VI1PR0701MB2719984444F85BA0510AA6ABFE9C0@VI1PR0701MB2719.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:VI1PR0701MB2719; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0701MB2719; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	4:d/nGkVKsBipbC3X9+/DHqUhksy9S+/RHAj20fxmx+vdWZOEFvKVDGPDJ3FQS7++RT/bQcU0WYNSoDecSRUYQm+HlIs76Jng1Rj2NQjc/ngdopEA7sI8GC+/C8LTNWPEDMgP9bZz4V+GwuON5SyEsIAQr0JVnfvDmLd1Magp4ZeFL6fXgLh8DcVrpSX7ZGR51na9Qss5Bue3ywTO2e9XKr74kOWVMZnoVsTTd5e5ShuYcz242aqqtIALm12LWhvna2ZkSDN9kYP7RWgilXjtPbacQYMzz/Qf3pBtWGTRy0YKxD+JeUiY/GjuNaLl0SiuhATIFIe2cyEkelybumkj5Ke4GdO+BuB/Lmo/hbsMqG8U0IURECg/FGnulJVSXw79b3IZ4leC0Hhghz9bpJ1HO9yRyQbpXbBn/h+LexD9P0ilQJ2Sm5YEwldeeOcBLyokCvNw7XWKKJvdUqtY/CG9KNVtQUAwSVyFMJm/KtxuwU9PG1CCVDXpP1xUiRBVW4zh6GX4qfxuzxUfbpMEyp3LMa9xtUAyYsdrB7lKscGIqeTLwWXKt5WZiUSmIPm+iQsX87kilgWiWjtGPsRM4999ZoOnMHmk2ZgzE6zHCgnYSkWSxEW2UMyIpRf5JwwMBaRIGhLZ7m/SJBF5Z1O+fgwlFSMCZ2huC18Zs9EOMYOXXqPg=
X-Forefront-PRVS: 01583E185C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0701MB2719;
	23:NxmJ1ozELj3S3MOeQ96COBbhtDAKXeTETTkKJeE?=
	=?us-ascii?Q?EbtzAqkaFv4oVrRghBwWEi1NHkPgVlN5XXXoYl5OVDvj5eF9z2Vc7z6KKRhW?=
	=?us-ascii?Q?EfEVHxjvWGkAcf3ZSNMzUYQw2lv5SnJcuGkMaR3JcI98imdjdtpajTgv/Xgt?=
	=?us-ascii?Q?a1bnR8xHE/Gxt0nquIIA9Z4jruQ5DvWCOX3+RIl05TriyffymKfGkbrWOnv/?=
	=?us-ascii?Q?KuIMF6IhyXwQTBgiF5FLBCwSJ5CEyulS3Z6g/copWZBAY6NOFKgdb/qBwKL4?=
	=?us-ascii?Q?cAooJ9mt6HBMdyrWuIi9WsWlRXeA//7rgTvFph5OvgFpT5wUggm92ElCPgG8?=
	=?us-ascii?Q?xuRS91EJD4wYa9xGU2jscywNWd2DhNJ0JgU7KHVfolZI5zvVFe2N3pVRPmEY?=
	=?us-ascii?Q?NpiCpmwLWFtsNPBhOHNKb0kePZ/UbA5OYgRZs7cTLejaVn5CMgdxEoDuJKIK?=
	=?us-ascii?Q?IlFmSWTbF41bZtm49a3L2yAqRc13L57jAhkpLvxpw9fMbpZxnxuc7j0xMGsF?=
	=?us-ascii?Q?72rADgfq755vDrELVHQ5nwMhCPzvxeebaJcJHiQPldHjMAeSaP2IIPXXamFc?=
	=?us-ascii?Q?63o3lQynVv73ftQHocg0U0VEvm4EIKROY9GtQuYED6bLYM7i7V/g1j32Wlzx?=
	=?us-ascii?Q?Ql4UYU45WNvPEZseqo4/etojS1s3RnVS3Be3Q4YMaDvQQ6FiVY5/vVS/IfgW?=
	=?us-ascii?Q?SeFqY3JHD2W+i5cGjT84uA2O62coCTnlOjr8t65il+WdYSHpQqNZp6GFxOFR?=
	=?us-ascii?Q?FmwEqp85oCxhZOjry93gFGT1dv8qRDmdGrggXYrmTcBb0FLWHoTaIcNlvb34?=
	=?us-ascii?Q?NPEt6iS/Z2qmVkJG5Pgb1bD41xVoRW+IH9cs4s6tfGjnMB54P8GoTbO5Mkg3?=
	=?us-ascii?Q?NDrkKb97TbBWEm+8j1oJog0WZtZOX3auUcjjNWyTNjybPtNdxkzbLnXXD6Yy?=
	=?us-ascii?Q?FHaeOgasyLw5+padO8pPSlKAyA9xgGwkabYWJcMobmxuKNAw7R0UWSPi3Ukc?=
	=?us-ascii?Q?yVraQ4loqsGPr8LqjTxp2DgAec15ysYGfbsWI8XWr+Zbz4uDhYs+tEoWXRxJ?=
	=?us-ascii?Q?5IKB6VcsmG7+DgYvrvmCEC4DZKuLA8bZDldbgDzw5q8dN+Ymt5Jdv5b1Lhch?=
	=?us-ascii?Q?nqlsJNj+vjHejY6kxEzUDICyox+DzC4Bm?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	6:Lz1gF5eoA4sqrcFktS4b2Ou+YGTvcFBX3I6FnfLM40W4/kWAA/Rd3wdlRCXXTnelNVvXbpqUUSx4Twj/i6LQ0lepukesRF1A1BfbqWHIhpCGquYvtA+QiT1z3lzXTv0E/TWsGkBnEoDKxwuVavJzhIv4wmmjVTRKLhxd5FxQ99z/IvPik8h/xlOMl09ZVvMQ9qSU4sYoh1QnkEomHHg6Njn64XkxyL5XFbCTBl5tyqm4du5nSeC1xmDXkP1NSKFUB2XX2CfjXvJFMZngfzN7WOkN71OGsV+l7JFCepj8fDeCLVlwrfrST70pis8UFlFWcXEweF+8pttFnjbv3tNeTvbzpLIYraimnRizjuUInp2l+serjuTvlWSQyrC+F4TWShgrzW2aSff4G/nMvGky2BP4T42FauW9qgd2Up13n2NLlsnA7oZnxs6rGzLqQbgss3pu1AU7kg8VkUdJto4K8g==;
	5:HSguK20ypCujGKYHZA0fbLyZHnZkOS9qA/88QrAM2vTN9FD5duglxZ98rIf7zNfL8rCJRXdiDe0WpkIHrq/oaj/OSRt4Dw3G/bAMNOdO0LZ0TCJEfGbtnraoZv7Y33GL8g6pvf5/UjlUbTAbayazdw==;
	24:fqsqi3aF7NP8sMWhmQqDdDVnX7WZC9aYcxnK6Q7LombTB916ACrGTgUHbFq9xiGjgE3M0+4AtM6Vn5KYGrQaUtJx1z1mz2hpF/DrWJXEksA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	7:68sTaEzY5CIrbpt+AuVJAJcR2M3CFQnig77EuW3yqoX6jbzr87UsMcNSjdgr7h+/MJL3+LHgPkEqfCP3/9VL3evADS6rCQ1XcfizLNmSvrmCXvLHzaLNbSBRR1lOwk/LshH7usnDte2wQcqzfjI1Ef7jseN4nugEqwsarPf8n74uFgt4Wg/G4PeVM4sSf7OWy85hN6v+EEeqh8MNcpNie/OdPOxfa3q7aavBrD0x9N35JV0pvt5oEwwsevt/FaSbWTzLXrh6xc+9P7puWgjzPM7Nn58y+2BI2nJNlBSyhVb0VPITeUyJau88Ynhz7sp/PnzJ8gnaYeGkiIGjlZ6XqxSTE+GwCKNNjnv4YJ+Qk5wTlgqjdFZPLJoaTm3zazfrKsCVxHxoYQn3oZyDFZFocFhrN231YAA9dEdAQYgYqJDAG32kxOM+INVAPI+OQTOo3TpCoX1nLqKTjIomEXxNtQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2016 13:28:06.9337 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.38];
	Helo=[hybrid2.ext.net.nokia.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2719
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.106
Subject: [Qemu-devel] [PATCH 1/2] block: m25p80: Add Quad Page Program 4byte
 version op
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org,
	clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EmIf9JUQSYG1

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Some flash chips has additional page program opcode that
takes only 4 byte address. This commit adds support
for such command in Qemu.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 hw/block/m25p80.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index d29ff4c..2bc7028 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -325,6 +325,7 @@ typedef enum {
     PP4_4 = 0x3e,
     DPP = 0xa2,
     QPP = 0x32,
+    QPP_4 = 0x34,
 
     ERASE_4K = 0x20,
     ERASE4_4K = 0x21,
@@ -573,6 +574,7 @@ static inline int get_addr_length(Flash *s)
    switch (s->cmd_in_progress) {
    case PP4:
    case PP4_4:
+   case QPP_4:
    case READ4:
    case QIOR4:
    case ERASE4_4K:
@@ -606,6 +608,7 @@ static void complete_collecting_data(Flash *s)
     switch (s->cmd_in_progress) {
     case DPP:
     case QPP:
+    case QPP_4:
     case PP:
     case PP4:
     case PP4_4:
@@ -873,6 +876,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case READ4:
     case DPP:
     case QPP:
+    case QPP_4:
     case PP:
     case PP4:
     case PP4_4:
-- 
2.7.4

