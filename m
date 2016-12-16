Received: by 10.103.86.15 with SMTP id k15csp1351701vsb;
        Fri, 16 Dec 2016 05:57:37 -0800 (PST)
X-Received: by 10.55.92.195 with SMTP id q186mr2672998qkb.170.1481896657698;
        Fri, 16 Dec 2016 05:57:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x206si3217797qkb.136.2016.12.16.05.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:60659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHt0x-0001eF-8B
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:57:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHt0r-0001cE-Sn
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:57:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHt0r-0006tz-0Z
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:57:29 -0500
Received: from mail-db5eur01on0092.outbound.protection.outlook.com
	([104.47.2.92]:17472
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cHt0l-0006po-Hq; Fri, 16 Dec 2016 08:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Xuh1no48+8xAu+T631aoVy1QJY/eSFiufRzP2Wr2eS8=;
	b=mmte3IQfakJ8PydJMjvFI0gTktddJJeeoS6Uc6wFYjgybYzmqo7nVfRLVFnqlL2qE5N86/s3EBueVv8X8U2yfi+T68F52FyEbTTyoe4oOg61rnmZRArmz17s0wbBp43n/mWc/sc/pURJq3RzC4fhsJlxfgjZz59g0p4bKSJEjhg=
Received: from VI1PR07CA0046.eurprd07.prod.outlook.com (10.164.94.142) by
	VI1PR0701MB2719.eurprd07.prod.outlook.com (10.173.80.143) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.5; Fri, 16 Dec 2016 13:22:51 +0000
Received: from AM1FFO11OLC007.protection.gbl (2a01:111:f400:7e00::141) by
	VI1PR07CA0046.outlook.office365.com (2a01:111:e400:5967::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.803.5 via
	Frontend Transport; Fri, 16 Dec 2016 13:22:50 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.38)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.38 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.38; helo=hybrid2.ext.net.nokia.com;
Received: from hybrid2.ext.net.nokia.com (131.228.2.38) by
	AM1FFO11OLC007.mail.protection.outlook.com (10.174.64.133) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.771.7 via
	Frontend Transport; Fri, 16 Dec 2016 13:22:50 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1492; Count:17
Received: from fihe3nok1348.nsn-intra.net (10.158.36.136) by
	fihe3nok1349.nsn-intra.net (10.158.36.137) with Microsoft SMTP Server
	(TLS) id 15.1.466.34; Fri, 16 Dec 2016 15:22:50 +0200
Received: from mailrelay.int.nokia.com (10.130.128.30) by
	fihe3nok1348.nsn-intra.net (10.158.36.136) with Microsoft SMTP Server
	(TLS)
	id 15.1.466.34 via Frontend Transport; Fri, 16 Dec 2016 15:22:50 +0200
Received: from fihe3nok0735.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMfEC030210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Dec 2016 15:22:41 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMeVC030178; Fri, 16 Dec 2016 15:22:41 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 16 Dec 2016 14:22:39 +0100
Message-ID: <1481894559-13974-4-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.38; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39860400002)(39450400003)(39410400002)(39850400002)(39840400002)(2980300002)(438002)(189002)(199003)(86362001)(97736004)(2906002)(5003940100001)(6916009)(2950100002)(50466002)(305945005)(77096006)(86152002)(33646002)(81156014)(53416004)(47776003)(8676002)(4326007)(81166006)(2876002)(2351001)(38730400001)(36756003)(106466001)(92566002)(22756006)(8936002)(107886002)(4001430100002)(50226002)(5660300001)(50986999)(48376002)(76176999)(356003)(110136003)(68736007)(189998001)(626004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2719;
	H:hybrid2.ext.net.nokia.com; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM1FFO11OLC007;
	1:U9XYDFbChVV6VwjvMuuRG6TIDjV+CVcwYDAesNhIm0TB7qbeCzSa1n73DyfXccPB+C0H0NvlHPX9jgDh4nmFa7628C3Y+JZZ1Ka0A6ckvTKDPGo4dav4O4zaG+5lnRAwFamuT77W4ZDvJk6ezsM0hFaiURzrC/aD/oZzTbsy+5D5QTt1N7A5Uy6TjAo4QzXAJmRtS6B9MzEWyRgjdtsYfo420y327JUzuFLCa6RfsVLodlHzcSmyYueD1zGDOI9lsDs3pHSkGoArdCmAWzFPSljo3/IgObFtfC0TG+semlZBBeqzxl83+otWM4i6eg5fpmwMVhifXyNfqQQcJzLrd59Q0MPq+XXFYy1wuo87EE0iIkoJnW/kIyikj/B0EfyGmXlHv55aZzfLNcNO2uFQKNOYfjK1du36jhc3w4NsVBm8kvhbx/Jqk2RbFWYCqRPk2DEayRz8TK5s9kPrMiYOlCXzYWd+DXsu0STQA78kat+J36qp90zTK9Q1ZcfodM184yvTYHQWYaB/ji4UlyOJ1w==
X-MS-Office365-Filtering-Correlation-Id: f87d9751-bac5-4cf2-208d-08d425b6a27e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:VI1PR0701MB2719; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	3:KegA3RyW1scixNBIooHwvw605rqWJujIgVtDUlAohNKPZKhsYFI4YwpNU6l2BxngFYyn3uxfxyU4GmG/TtRfdAS8/2EPC1CDjUDYiy6zfK5bhTMRo/aHmbVgM6pV5O41wTEkGi0l61okd/Gl8ep5gWpWErhHGQtbC26DiWk4hyZMwb6x2vMSMzJObCdA+Tk4P+igFoFv0JIecuUUN8YWya5HNh0jTgaCABuA9nuKBqP7tE7973PxzaXJKWg8+5yWWshady8uzUmiRznLxGyvlZEXdYB1r4/Sea1/lkxDdpMXYU9FiwikOOahRAv4BJyfmewlIjKNakrAusDMaNkxlqHdDFJ/VY5dFnQdSkUqsM/LhpxqyjstXquveuh5GmjSmL01wbQbljU1cobbu5ybVA==;
	25:jxJGhpX09Xrp8lJ1TqFKYFlAfV9KbmbQBrzFHVn9kOUzhxe0B5IsRAZys83JQw1wB26D0a4i5uEEC8DH9PCb5lvXUdqatfDrW+4Oob1UtBPWOhlt57iwVZzVFqR9Mt1yKWhbUSGTC/Zua80bY8s9E8hKKXQr3Dj6srNi0xKwhOotptLQILmcuUX5b9UONz7KrjpLGZot6+z88kB6AqYZHyVu/oVo72HJv/K4BeKSc3RxtvIIqvUJAcGBGVc9aMp8yveH1mC1eJpodUQ1gEmJl0D/Nv8YBTh3+SC9g/Q+p7ErD1KvYNZ3g78h1Z/axjSxftnIzuMPHaIBBt+xAk15uj90oXtF/vY4WL67n8fPnKHrex0et/ATi+9Tfp4+TquqE7Dbej4N9D/syEYLWG3YX+O2cThP0WpsD5UMSOlnHaihfkgwoKFOjrHpbk5midjmZZUmheEWY948k5pro/8Adw==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	31:89EKUEB99pK59OuW1pBelHCvUadK78+Fz1zdUdOMjKHUh5ELA4XKT0VRcJrflZHXwJKiJCEg8Rx28dsDUJlqYOkbPhl4FmIe2hXAGvI6/zdBxQI0dLV2+04lvs9w/ZGzaaqO2E283hias5aKZk9Jad0L+3rraHXafoVj25xuXXp9sioZXzDa/7hPfLmRMr8UGNlLnp+eWhftyHJsUn422kVHWKarhMiMY0HIMNSCnuk/zqohn27b+AeX75yKXhRSmyiyrBP8RCnb4LpuvZk0yA==;
	20:RRCCZzsDnDfDsBHO2sEJQQJoQQn/ypd+W9qenxQV8wqrUy7k4OGXlKFkGE2kj/yr2fc3mAv9HFfuetioIV7epHcfUcTVbJMNq1e+ocDuhXNabn1z/aiYk8C/uxNCLdIoYeaLSzNCEoKuEPT5LkaJXKywhTwcrsdctL+eJ8/Vpnt6ZI0dPdp4SU9LQo6lwlKaX5j25RYwI/zxpMuBYLdamYVt449UyjzcpyFqgxiIjqUpkGBCmu8gVmrMqgpiO8G1FcKHLW+/mIFk4QHzrZudub6OuAMAtymdbpm76vSZ8ri1UZgvQSLWaWjD91qtrMzIp1aRQzAe+PR1TI4MXR0soZXbilm6Y3ZBtLMLo/MNDETq6GBz4ubTYjkuMQu49pSw7RLzpV1ofEfpzIxMHQRo7A5RDnlxruyZ15ImFMn6UiYNQScNNr1C3yFcUuNNh0oKfKXLxaPnOf9HH/US6w8y01pYg5y5n9Tt1CLX3uHTApwQZZe1xy+Nx8m/OvBhLmP4kwq+q5hGJBUGUpO+qCh6LOu9KKNBjiOKjZ3JWNNa2LpBXZW8iZljZTNSxJdwn/qsAVagZaOe8P+I2fDj1h7/dEne9UBX47TrFgh8CnkHwAk=
X-Microsoft-Antispam-PRVS: <VI1PR0701MB27197BD228D02E49C938B8E8FE9C0@VI1PR0701MB2719.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:VI1PR0701MB2719; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0701MB2719; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	4:/LyE5zYp50rnxYg+rJbmxHYnbbmxAhPgn3w1GsUjLsm/jJztUHDZ6PsjiNsSbWRjLxB/w1VMpRpkxA2sWk5C5nV0P/dVECLdMOG1diE2GtWFeHT4eFoSkyHW/Fttv/C/jOpFLTHduixspqKbCBD4/p6N94wYUCch4sMSIeY8lE9+CIZ+TmRc2TQ7L8FDELKn8LUHZPH7mtdU88ghNuybtnDQZ24oJbAJZ4uqB3Qm91BCN/ZOWfsBxlm0VcogaCC1V28IFdgG1aWefBwEpk45hoRD1FpCLywzLsGYnCJ3HVDMNaOk4booKTi6BA43KxJ50wvf2p+PDpgru2oM5fhjxVwv+sfoRmurLY4g8qhKmQWdC7u4ekt3LQo62xQR1uNfxs1J9JXpXVGAWjGfn7CPtFOcJF/OAWaeY26qN2w+w/iXku40kHT29I40cKMWXrUW1dyJqBAPLirNKDtuWvkp2JYJMh28EtEEtiaP8iOFlc2Hwgpn02ELYcxp+MezbO8zIeIzQqInwK0Xo2M6b2pnSUptJzCJJ5rXTZop/xAxlnvuL/3EMzZ5agzeXQVnYpvRur/p9ysp2dgURTtITkV4A0Z5v1N3CNX5u6Y5d0cn4q95ZXSLyGz6/M1P0HxDIrwlXrBWi3PIIRjZGwA5K3rNx+CRH/0iqL0Ovs5XuZWMtNQ=
X-Forefront-PRVS: 01583E185C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0701MB2719;
	23:Whb4T543Uld3FLreaA40IO4UV6RUE/axZiL/PPX?=
	=?us-ascii?Q?XOvgZhoX35K1BR1E2i9wEQnU0LhRMRy7OUu0+dDJ/wkSF0EPTxiOcoYWXrUh?=
	=?us-ascii?Q?LxzRrdzzSQGedB8p7I1UTdXrVxlfVTQYpc2Rjmfzciki0d+1363cPcHGw4c4?=
	=?us-ascii?Q?JZNgN0I4KpFAz18SD5pgqWMQDVIDPop8RL5rBlGYo/8llSlPoU/+K9jvn3T8?=
	=?us-ascii?Q?wq6XFQOWMdEo6+QLsb9kVPYmc17GpfWZ5OgomWnOPMe0keR7lqhjT5WoOALR?=
	=?us-ascii?Q?IHRcNhYwWrHVXA1I9llok2Ei0OM+Br81y6OVDxMzY27sRP6Ltm+A0FEVd7y4?=
	=?us-ascii?Q?zXlOGG3VUhZyEUKgGdqXYqkeaD66UysMmag+Cfmm9R/OwVJDBujfoxJ2RmeD?=
	=?us-ascii?Q?HOUVKAeD21H6okEHZK+m2BKLWqzeVK4IZUWbSBEi2PAzFsPsLCGjXaiockoT?=
	=?us-ascii?Q?JEcdy3hY8hmCodtTWRZVsn1l6oxXJ5CAs4HSfpe96y2V2dO77uuNjZQnAMZc?=
	=?us-ascii?Q?we60wqmycxil/e9roksAoYeSUgMdzDLB/p07mlC8IrC6yN1CnItykPlASvO5?=
	=?us-ascii?Q?FluDdo6VhQ+yT48CE+SCvchB3Qw7Use4j7+5JZDChNVimmA6C+zWl0dbkwqv?=
	=?us-ascii?Q?CI8nVE+/rpkEOyAD1bCo0TnWrcllRXr2vnZwsHbYgZDVfTzKQCSgRPV7nvEy?=
	=?us-ascii?Q?IvrPWqtVwBwSILMw1cHOBEdMeUzol7n80P8nGTG0st+LyaV88fAP6k9nv+6l?=
	=?us-ascii?Q?ChWYaFnSwg31nHwW8+GGjA2n3nD9uZPavp2zRun6Yk9Sayps5OkWZuhGyQsS?=
	=?us-ascii?Q?sTV6LQ3m0zkmNyt9WpyPbQZjBedZkA/kd/iOE3ckt3PF1OqBkPabSpzQlUwf?=
	=?us-ascii?Q?/5dFQmQA0ZLNbeiKq0OBusJ8Bm8ts7Dq/RFcvwTas0r4SfCVHp7uvhWJp6N/?=
	=?us-ascii?Q?RH0BcWlq4vCIzuke6vDB2TRBvdRiyhPopH6CvaKwwFM90MWnxfVHyV7qeyWk?=
	=?us-ascii?Q?a5WuXioQryE0hSixyFmnwG5j4zk8arcyA4eXnZun1ZWuYlrmh2QQ/hEU68jx?=
	=?us-ascii?Q?12BJ5rwf3A8nRT2IGQzxOxAKZWXh2b+zW5zVPP9M1tacfykvrvBPavihle1J?=
	=?us-ascii?Q?S2My224/L6gnMOWtSvOw3w7pgZdBaD37o2yXqb1fqLWDExpfxdlQzb1HeT9c?=
	=?us-ascii?Q?Cfq4I5PZYYxzJFZA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	6:6Y0CGFrWvEYUhzU3303R4w9Rj1C3R3ibxC4t1E5nUBQFzmp1GKA1va9elctknl4TdmlouuHQD0hrBOYvnOazIxy8r9DAU6UzJlb3H0NRrfCKvsMXo9HyazYz6u1w2TLzxJ/DmBnYOOvBmfQQe7G4ZXK3TkjMS8PqsHGoGJ1ur+7Pt298/ff7ZT1mOxfWuRLWC2CN4qUrja/5EnfsVXKTA2RI/JOdQIgsMOhS1E3ORnUZJxyQTNnKzNaRTLymfJRJYCPqG+ghgt0HjnEvAwKmpjMQJ211LF3kXpB6IPAtqR/NaEhDpdw3KyAGUpKVYSdLnQuzDT95y/EYpXtXiyowCj7ARuBQHFUoCU9KsOBjZ7p21jr4mtkIzUYqS1tUHyzRt8DI7ccp8uoMUGJQllZ2PXx6gg3I9dFYnqkJ4Yf+d9+X9tF5jnESWi7FDPiYrWitMoeV2ScWMA9MlHAvSwmRRQ==;
	5:5YNV2rB5Qg4p6HqaPkYc1HlKhdS37hX9YURiTdH+G7hHpLH+Xdz9lPjzkxu/BwCr5S20KLaYIC3H+L2uMzupDNmRK8IP4/gb7IYotFo0RBwlxKaUgLUwQ01EO+foBneDulSK48XbxNfbx/cXIOA2Rw==;
	24://XnoNbVaFEPevemPiQEZLQNJVbpng1W0gjsMkmL4+znF+kIgwWln8dzjbe2doXxyo4o8kSjOC5SVZT+N+X9iW0ovRpJEYylUBp9Y4i2q0M=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB2719;
	7:jE8SpJBW+FWTQuaRd3B5m1NqH73ZXdEuwIyny5kM8zNB8FRFLfl3k+k2OeuKeaSyEjqml/eOixIPppX794dlWkUqO0Yw83NQOj/RlJy1vgYdryUprbu85pF5M1MclAF+edCMaca/jjME9icXRdX57Jm3N8ls9uXHTlB4c974uWTWxlzuYwtMdl2FtHqN92UYkntwTpjd/caoOreFdkj/RIoYa2EsllV71Ya+rE6kr8VLk4ISCbfdvhG7o7yYpZY/WXOfQ3rVAd7ctdTExGXK7T43xsvvKDif4aoXE6HKGkh0byDQh8qHD/iXsDEZluFnCydCOhcqedamQx1WFgzWB2ZOppTYqYN2OSoEnwmfGsmj6ft68lEkXKlkzy2F4EG/dcr9g6gMSlVmCPe8FJ2QLeOy7a/2bGN/knrloR5P31kpCfcVrogGiYCakeQ9UQqaXtJDkP5mVMvc7119CV0/Bw==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2016 13:22:50.5753 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.38];
	Helo=[hybrid2.ext.net.nokia.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2719
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.92
Subject: [Qemu-arm] [RFC 3/3] exec: Allow to change Address Space from board
 level
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
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9UqdMmoyqD8i

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

By introduction of CPUAddressSpace table it is not possible
to change address space for CPU from board code. In my case
Cortex-M3 core has it own address space that is created at board
level, then updated by changing cpu->as. For current code cpu->as
is used only at init, so changing it does not change actual
address space.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 exec.c            | 8 ++++++++
 include/qom/cpu.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/exec.c b/exec.c
index 08c558e..9c6e302 100644
--- a/exec.c
+++ b/exec.c
@@ -628,6 +628,14 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
     /* Return the AddressSpace corresponding to the specified index */
     return cpu->cpu_ases[asidx].as;
 }
+
+void cpu_set_address_space(CPUState *cpu, AddressSpace *as, int asidx)
+{
+    /* Return the AddressSpace corresponding to the specified index */
+    if (asidx < cpu->num_ases) {
+        cpu->cpu_ases[asidx].as = as;
+    }
+}
 #endif
 
 void cpu_exec_unrealizefn(CPUState *cpu)
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 3f79a8e..7e2ead8 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -964,6 +964,7 @@ void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
  * specifies which address space to read.
  */
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
+void cpu_set_address_space(CPUState *cpu, AddressSpace *as, int asidx);
 
 void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
-- 
2.7.4

