Received: by 10.80.163.71 with SMTP id 65csp3745886edn;
        Fri, 7 Oct 2016 05:22:35 -0700 (PDT)
X-Received: by 10.200.52.151 with SMTP id w23mr20082968qtb.115.1475842955425;
        Fri, 07 Oct 2016 05:22:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h189si10051094qkc.13.2016.10.07.05.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 05:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:34538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsUAc-0002Fh-QZ
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 08:22:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bsU4N-00066V-1u
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 08:16:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bsU4I-0001m1-VT
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 08:16:06 -0400
Received: from mail-db5eur01on0109.outbound.protection.outlook.com
	([104.47.2.109]:14860
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>)
	id 1bsU4I-0001jb-FW; Fri, 07 Oct 2016 08:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PHNHvxif7k5hmbIE9cg71aKadRiZvfroWZZDy6z4OAU=;
	b=VbXiFSmb/TQ0zcUvqQlIJ8c7B3pEGIy0hHLtM5rg1FHcmTASqRipfEbDVDLNPwwfjK9+2NoygPvf5KimbSuWygTk7vUuKSGQTLFxwgoV26hHq3U31Z7ASllFcEkP3tCRX/ElbQt1dpwk8rK+ThVLJEtc1dnZbfkYQzCVLfGMzGs=
Received: from AM3PR07CA0047.eurprd07.prod.outlook.com (10.141.45.175) by
	VI1PR07MB1440.eurprd07.prod.outlook.com (10.165.238.22) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.649.16; Fri, 7 Oct 2016 09:42:56 +0000
Received: from DB3FFO11FD050.protection.gbl (2a01:111:f400:7e04::199) by
	AM3PR07CA0047.outlook.office365.com (2a01:111:e400:882c::47) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.5 via
	Frontend Transport; Fri, 7 Oct 2016 09:42:56 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.241)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.241 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.241; helo=fihe3nok0735.emea.nsn-net.net;
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.241) by
	DB3FFO11FD050.mail.protection.outlook.com (10.47.217.81) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.629.5 via Frontend Transport; Fri, 7 Oct 2016 09:42:56 +0000
Received: from fihe3nok0735.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u979gHOX021361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 7 Oct 2016 12:42:17 +0300
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u979gHW9021292; Fri, 7 Oct 2016 12:42:17 +0300
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 7 Oct 2016 11:42:11 +0200
Message-ID: <1475833331-26882-1-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.241; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(97736004)(8676002)(77096005)(81166006)(47776003)(53416004)(81156014)(87936001)(5003940100001)(50226002)(2351001)(86362001)(4001430100002)(86152002)(68736007)(7846002)(2876002)(19580395003)(189998001)(33646002)(19580405001)(8936002)(48376002)(4326007)(229853001)(586003)(2906002)(107886002)(356003)(92566002)(626004)(5660300001)(50466002)(6666003)(110136003)(11100500001)(36756003)(106466001)(305945005)(50986999)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB1440;
	H:fihe3nok0735.emea.nsn-net.net; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB3FFO11FD050;
	1:pPCYkqqvnj9qFA26rQXGRnmFChJnWk2Eiqwpm7kjeri/Qc6GZl4ewpJwtKbDC6GrqEs5tb2vt6Qy3AqZ/N2hDRYxSUzdNze9eRD/g9sJP5JCXc4ZTRhNk4m4yH57s9+fYCqrFCg2wi7eqsCEua3QuFgFwxMw5fP8jUYEUNNEpo27E7TsK5doaIIM0N3oIomYZYhFKChhHbMWsGs7I+GrM1B0b5cj0gGjgNGxoV5+Whg2OAJ5dOhOCc503ZCdTj9/pGRmdKm4CarIXCuq5MQl4AGtN8skJf/SxfGqQL5VOY4z6R/4yUDmUCWeePr4wQuqs52RZ/dxxV1nWS6eJWvIdPUF4IEZCERiAMLz7Qd72QpCDq2KXNkmdXk1R4u9fSEk7xCtCXllPQQr1vF1hc8diIRw/B8cZpmxtTpER6/rqBKEG5patGgDyUnt1YT4f6ze+MJzVbDBVDbVStJjeX4Q+rafZ5BhzayJ5FK1SPOtCrc=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a4ddb819-2ba6-42aa-ddb5-08d3ee965147
X-Microsoft-Exchange-Diagnostics: 1; VI1PR07MB1440;
	2:kntcvU7VTovK1W8eGezF34l6WJbi0kk1OVwEydETpVXQwHphNzBVP43EPv04Vu4WDFxGlYo4otaAW5QaMSQqbmeQ0d9mBZDFEFgfVp1J64EsOXHr56uNrJYTqOUs1Ezt1MBtBrYJrZ4XfCAmN1G9Wh+crmZIIAfnHp55BR7rI3ZfcP/vh5/S1hQY+zQ3U8bRZjNSVoJ4TnGvAAxKMx0xjg==;
	3:kuTFenTilOVGZmoJlcPYWK9MgRM89vdAD99IcImbBEGJ/s8wQE67UM8Y3nIevgXhZTqrgXG+YwiSQagOSNtaBkyWrWN7oB5zUwU8LEUX+LkbD/7aWbhf8rIgJX0GPpzdn+dWnM459mXbrq90Vu3nuLdMVakAHi82LqBpjm0jtOFDpAJHISSvIxOFsGCJket4XjpsNOtELcJAaUH/2BtISiKKjX8o96X62Y/bAnJO7f+m521oY88pwk5zqCWxA5uOMdnX4ukJvKUHbVZnJiBkzqG6yYBaR7LY6NtRx88MVYw=;
	25:yH1/brgE0mTjeZkaGyl9VVk/E0LW2rsej2rPBuwRP4eRGr0Oitr8VzKqT5Mts0JnqVpqPZOUOxT5OKiVMk4pMPwntLZPH0z9Ux2bTcJjoKFwZXHfidvY0So6s+LsVermLvxLQExFKKqUW9NQ8T8EjsP3oI/nYuiBEsOcjPZwzNlGcnAta/W9jd7su+QLsCNKUIdX3Pk5Legtgu7gexBfDtGfjoNfIQGq7PXUIDmwNpoVJUB15nDQZ9c+7S3AH1g3Gr3yB1xeG9U3vrQBoLqlSCfA+1Cjv80Z1usWwEjsldwtd41zOZOa2aKc+i+k878531TYfkWgAcf/GcWRvFywmNHUBTqEMLZzCCcjQd3M3e9WNTnUWrBamyHTrze16pOQz4EBUm+Ch+u+8RpheUnDN/PZScm3pkChiVZDVls5bdQjE1jXNzpTQsjRQZUJSaqy
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:VI1PR07MB1440; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR07MB1440;
	31:kUC7OSQxW1zMbZ1m+HWt5bu20lkgRQScmVDLG09CVpLOZJvIbdQcAgfy4C1jxiAN9eXx0MJ5nnrQljsDHBl3T2vFwjXcgDRxk8ecbdQFNicAQP2EXX+aUsuRh0ZInbF3hLoXKGWcr8a8FTdmXB1LHrrxzAaGMZxiFvKMh6rDAf/KzkFlwICsArLAOLKE34toOklGN5pMdg2Y2oUU+7z7bVFCQOzHeikB419P/GWGGJiSvBloeOUglreznszHpeZs;
	20:u9R5d8G7p92fT2GEh8NEuJzZeiQvBhgmCmE2JNX31JgyDNPqNUwtk6d09/ZNhu3DfJ2l8C1Poccv8o3xAt/+RIH8szaHQ0Kyh19dMTy161PMh9WwhbxzSjdBMRzWbWJryZJwq22HwrbOxL46sliLLEvuLPNDmRUNlm96RkDfgiKzFiZqgIrkjWnHYMEKyIg6gGmYTXYClOQMyuv8mRWBFGmKwxFpFcLt5j2EW2LDQyIQzUwnM5ggSdMzmpgjuPcsOir9dqaKPc8dD75dSabsBpF+N7zzEvRcNC9T3l7abxZLOVDD7YG0ZJ+ZK8Hfx7hY6j7QJDGq65KeN5YgfTVNnkzgpztFB6Ls2bVSvnfYQQp2d84rtlWKzhculVM2uDhHLymEOzbIc6gqpG2AB52YD5n2KtRKer/XUEOsjYLy+hyg3+lRfzXbtUqy3Ed98X3moPDC/u/y84I89EduY5fV76wDtT+XEdJby64AjARXOoQPS0q1765Iylht9Sr5cG2FvnIX3LJ0MG9FsUd6QvC9pXCgWK6w9JrExPqXpd9VpKozCs2wg8bWnp/LagYl8iXFUcO8SE4ZhMPR5aH62QSB2gnlgBwtdIslvAaIBEa0sr0=
X-Microsoft-Antispam-PRVS: <VI1PR07MB144086D6B00E23976211542DFEC60@VI1PR07MB1440.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:VI1PR07MB1440; BCL:0; PCL:0; RULEID:; SRVR:VI1PR07MB1440; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR07MB1440;
	4:Z7ctf+pL3U4O872Pn7w/k3HflF7Ebm43UYk/rW20x7zFtz2067nd3Yqc2dWglwbWXOrNpWC1MF9TLhz3YK1bMrOzHy2CpwMNQVLHOdjK5tiq/vS5tAJPb3y36GwCpQxOVLPqk0bOqfjHnIlc7Gd21RuwlVjdDieltZaT8tw7JZ0JvEZPA/EibLac+OV35WlD6besdg7ecnf5W8YAa+hN5W7rgG/wwSfVtCQznoQSb0Wa8b+ioXJckhVrDrs6PZL5pdnpcQYKY8DL0Lgd9oiAaaiPNn+R3Z0bCf8LZY/xUbXDPXE6lXZJXbz58TkJa3jhabcwAB1n2ubLYtlUZV0z9TlV1sci3bHVqgFnQDIy59bW2KL7tXb5pFzIP+PpT+VTVyIg9ci/BFOCrqNT+qPYyyls2Nb/6rlI2uI56akyNUM6gB01GIKeAtADT4RiGGLsG6OivCwzneqSAltKqZ8k6CkVyhwhmvVHaaAvJ4HVku7zDuEA9Sa94tWhunMu+bdP
X-Forefront-PRVS: 0088C92887
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR07MB1440;
	23:5borPuArlkNBrWOqsT2TmjTx0RWg1zciuU3FudSSB?=
	=?us-ascii?Q?bfjMhxxjqq5hjLUKjFq6KWVNVXu8sqa4/w0iRqPdtfPctUukX/8VU6ttB8jJ?=
	=?us-ascii?Q?/ionlxLfc27YulhtD7ZGfbASz5wQBUYbzhRzWExN1D7qKZSIOlx68OIW3ev8?=
	=?us-ascii?Q?C5UloJcTWU1Q9TGTK36K8eZOGxNSmWAleTWOxRo0Z7Brs/w68+sLgCk1XyrS?=
	=?us-ascii?Q?ZFzwgZgeJ8NyloF2aPlbXtkf0MIwl8e27Q0sYMrSAsBiWc7C/89wChOQy1w6?=
	=?us-ascii?Q?kcwMOVmW7+8tJBs9h7q36ehJhcnQwigcIPhZ4C7CTxT7cbt/43SHRxOyMds3?=
	=?us-ascii?Q?vc+LXMvczgeaLrsayON6XMlLbaVO9Jf1rezhBsntMpymzroxevqU5AXX8uRs?=
	=?us-ascii?Q?Ff5Ey1UconGQa9BmH3jyADupkbWIMvZCTLIXSZrHEy+/Ii4JEHZ7qA+SwFgM?=
	=?us-ascii?Q?w6FdTuVrzlHMj7I0geEjmWy/GvtzCFmHtIHDKxAv6XRLmCfxrISPFFVtgc0U?=
	=?us-ascii?Q?48f1mKUOrxupwIEjvuSR6s+3wYLgblVQQ5WUK0d9r39uKsFFFAZlif6H61nt?=
	=?us-ascii?Q?0J7qaHrraeiiIUz0eLldSGKHfOrsgx5SN2d7UAIq9CgVRH9yjhQdxDvL/HU6?=
	=?us-ascii?Q?/qDW76e1mRegteQEZFrXDaGz5wz49IHZY6EB6Ig77VNT+CqVABvU9XMj/LHi?=
	=?us-ascii?Q?fc2Nvxb+YxSF0UBrlG5bIpqLwcOz972qPiHP9RLkxt1RAM8iawLTJUqVgJQ4?=
	=?us-ascii?Q?2r1wYaJ/UMS9UJ5MdPXkRACEig6JaMKA/5ifNOybxD6BvulrQ2mRjEUjvwLE?=
	=?us-ascii?Q?4LrVf7nnDSl9ym4LjOvYRh51tVH+GoNGU6ijLt0NvHSTdv/SsjEAJfZ+kGo9?=
	=?us-ascii?Q?1oqi36x4uf5645A8fLvWfnNCFWfrfcIjshG5kfVzKav4ljiXYT2lLZBuHb3R?=
	=?us-ascii?Q?pzHyOUVanDMOxyla6Q78Igw0Xcj6SA285dukk+ItcHx11WzQ18hXWKOCId3x?=
	=?us-ascii?Q?/r3YqDGYCDHg85Oec9SHjUYdimhdal6kUt6MZw/r8zcVYNSoXAErAd+iyXC3?=
	=?us-ascii?Q?MqNgP4vE2qnYZqntkhoaFe3H+F2JeWymqrMZ5sl6+6kG0QSldM5WvX+TZhZA?=
	=?us-ascii?Q?aNKCKWIAvz/xgZZ+A406be56tyn0adHNVhO/PgtpxVpR0EHXsQfig=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR07MB1440;
	6:8ZRnK2tAcLC64QTdPCWFfkoJ3as26VbbtpaFDvao3bZY7OU43g8MFT8puflMTTmSIOEOcMHbsaVmIlyabZCPJYrP+kFHiubGWIiQXNNjZGg8U90vpQxVEykuDPN4UdOgKsiG4qo1dAagt0e1MtEDHxB8h6JaQj2zzmGi4erbXM92iDAit+3qMr9mSv2q7iFRCn32/+IErNH5olSsZYLZwTvSplogFh9Oo/B3jusqo40CkRAgsuArwBoWcQ0JzZbEXogYb1nD81ms5hnnRvouMBXJmPKoXm0T1dIqD+aHCOlLG8sOe6p+osA3LHjQRGZDXpH4k0svVhBMBS1tzYD/K4bQXhXEspMzX48P2fu2BNk=;
	5:Ktzyhpx3njXT71PCpBaZqIF8TyXprH6DGTbsJUMx84weru3E9e2TyT0LTbNqMH10R8xp363C5F1IAfftdg2MrINbwInFOX9XfcM+UmROvJ142rQsCIsbxSHwTQvoNCHAkh8uNmsyMkD9NVfwlAkTa19TH9a8kolGGeLciAuC0l4=;
	24:4Ox6PE4G1r5AGWBrWm7mmm63Oxb1EVg/DUiNHlAi7KckhpC7MC260lexJfY0x8Pw7rnMBUDQHKDiUzeO7qe8151TbkzZuoQ0lQxkQf1UiU4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR07MB1440;
	7:jjXSLm1mv3Pxp3sfjUQSUdY2b+Da+VbcFquDvbNropM6p6GeWgqiiALEiDFL7N/u2aTuHQMDTUC5rWbwqZZUM6ABgBIToUyrBTBlrHyNdypK7ZCLugdNS3v/1avXd6ZPDL1PlsOlLgz8LrFtGD/qR64M7HAaXHiKni8RSnMtPFvY3tbAcKuLmnmAb2x8YZB3C7YDqXWhDoRzKd+akkVUtsQNKf5BChUd9vD20FHzuJXqEijtnHXbTzgiS29tsMq21u4YwH3p2mg69hPcLXsOUA9iEmLDKN8iZUKQSoblRsFyBFesapB3wtvQCAmRA218orZXOxNDv3oDRgr6qtz21A==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2016 09:42:56.3513 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;
	Ip=[131.228.2.241]; Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB1440
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.109
Subject: [Qemu-devel] [PATCH] nvic: allow to set pending status for not
 active interrupts
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
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZOwcMmz8iJ4N

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

According to ARM DUI 0552A 4.2.10. NVIC set pending status
also for disabled interrupts. This patch adds possibility
to emulate this in Qemu.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 hw/intc/arm_gic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b30cc91..85be6e4 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -147,7 +147,8 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
 {
     if (level) {
         GIC_SET_LEVEL(irq, cm);
-        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)) {
+        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)
+                || (!GIC_TEST_ACTIVE(irq, cm) &&  s->revision == REV_NVIC)) {
             DPRINTF("Set %d pending mask %x\n", irq, target);
             GIC_SET_PENDING(irq, target);
         }
-- 
2.7.4

