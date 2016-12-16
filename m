Received: by 10.25.205.13 with SMTP id d13csp761803lfg;
        Fri, 16 Dec 2016 08:00:17 -0800 (PST)
X-Received: by 10.237.34.167 with SMTP id p36mr3130354qtc.286.1481904017847;
        Fri, 16 Dec 2016 08:00:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k123si3466558qkf.238.2016.12.16.08.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 08:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:32983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHuvf-0004nL-Bt
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 11:00:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHuvW-0004a4-4Q
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:00:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHuvR-0007Cv-My
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:00:06 -0500
Received: from mail-db5eur01on0107.outbound.protection.outlook.com
	([104.47.2.107]:27072
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cHuvN-0007A5-3H; Fri, 16 Dec 2016 10:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DTQJJd2JNuppyS2mv/bzN+vkZkgUXLR6o4UcKXNSY2A=;
	b=KJuqv6bb1rt1SUijIAQycuIO8h5Qbmk6WNZysTqJtfmFyd9zm2mkTyoo8OYsV9u41CpcW8f/5QzC/nvbBTB2ClSZBAMOYeXtUwW+KvEX9r6U2kA83GIvdKHHY61PvUSF/EcP78gU4Zkt9HW/QCxPQ6se+aGqQWoc5XWC5WPMH+s=
Received: from DB5PR07CA0028.eurprd07.prod.outlook.com (10.167.223.38) by
	AM2PR07MB0804.eurprd07.prod.outlook.com (10.161.71.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.789.13; Fri, 16 Dec 2016 13:28:10 +0000
Received: from DB3FFO11FD024.protection.gbl (2a01:111:f400:7e04::132) by
	DB5PR07CA0028.outlook.office365.com (2603:10a6:0:2d::38) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.5 via Frontend Transport; Fri, 16 Dec 2016 13:28:09 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.37)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.37 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.37; helo=hybrid2.ext.net.nokia.com;
Received: from hybrid2.ext.net.nokia.com (131.228.2.37) by
	DB3FFO11FD024.mail.protection.outlook.com (10.47.217.55) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.7 via Frontend Transport; Fri, 16 Dec 2016 13:28:09 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1345; Count:15
Received: from fihe3nok1347.nsn-intra.net (10.158.36.135) by
	fihe3nok1348.nsn-intra.net (10.158.36.136) with Microsoft SMTP Server
	(TLS) id 15.1.466.34; Fri, 16 Dec 2016 15:28:04 +0200
Received: from mailrelay.int.nokia.com (10.130.128.21) by
	fihe3nok1347.nsn-intra.net (10.158.36.135) with Microsoft SMTP Server
	(TLS)
	id 15.1.466.34 via Frontend Transport; Fri, 16 Dec 2016 15:28:03 +0200
Received: from fihe3nok0734.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDRi4O011460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Dec 2016 15:27:44 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDRhR5011449; Fri, 16 Dec 2016 15:27:43 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 16 Dec 2016 14:27:40 +0100
Message-ID: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-IncomingHeaderCount: 15
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.37; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39840400002)(39850400002)(39410400002)(39860400002)(39450400003)(2980300002)(438002)(199003)(189002)(38730400001)(97736004)(50226002)(81156014)(106466001)(53416004)(189998001)(22756006)(81166006)(2351001)(48376002)(33646002)(92566002)(8676002)(305945005)(50466002)(68736007)(50986999)(8936002)(77096006)(47776003)(2906002)(5660300001)(626004)(356003)(5003940100001)(110136003)(86152002)(36756003)(86362001)(2876002)(6916009)(4326007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM2PR07MB0804;
	H:hybrid2.ext.net.nokia.com; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB3FFO11FD024;
	1:bIFWBDeX6huOHs1oNMx2mBTCReIOM/2XsDsvOnrs2fPloAUY1GnI+9SkM1QNzwANxFQms/WjIqsEAKBh6pr7uiAcSlh3sdRtz8nl8qjWdqFCsxG9vFsEZ8xs3NQX33R9q+YaTEim0W1+WDZ8Jbk1UpXvf8gWKW1VlrYMcx4/ARYIgV2+fXXg/z0pqNyXMH1dgoUfq81pK5E4xpxmY4d3G3zBjTatWQlKE0N25CnCnzogGWRQN9JScjVW5YOmYEZNHy/CcyKT9ZnljBL+iZlMtiieRrls4CvUFIbQ0EYzNSXhcfkebqEbnc/UyvrAOju4FFdaVav3/BqExRVzwibkpK5GL4Pd+59rXGp7uFe51iGObdbb3vgmLewSdipRMjbMSIFyFSNDi4ljfD1txC0KX2J18gPWk5lM6s4lx8jlzNVVkZVVCm2u74l+GhI8zzGUAMw8BqzGIeMA5zH68Neovgm0yn4l9CmAGCRH4vLlSPSylGHpETZZuGkbfJIZbw27aNTDkM1WArpFckahSwvOgw==
X-MS-Office365-Filtering-Correlation-Id: 5731d2c9-f624-4d58-8032-08d425b76081
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:AM2PR07MB0804; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	3:DFss1QljXXzvubPX8FEdvpjm8eU4/nIvI5W4LUCQ7yymFsrMGT4o5e0TWqDDzqEuo2Sd7YFJJtyz7m5i4xExQoKUF86EabQwksM553yb/2m4EHBooqbh7eTgKBhVLsvroD16LLPsx29nG4q/ZgU23T99VoRIGqIhHI19p97ePdjQnm0bV8yuuHUudPOyPVs7WP2vWfXa0kWTUt2eTGPHKP0Ha6/N7VZzDtt79MLl5jaobjN1zvbAWTaWZxs0Iw/AdqxVaM8m8HJZwRZx+is4LHXxQCpJQ0UTUOMO+dh14XzVLWWTn9XaAbJ6y06sxyfroXIOrgyoiCJRfvw+t5JYN1JY4qMVlyw9hpn52jzxhogmR5Ag8P9mTvhxgMCi5x7do0tzbJsbnou9heT6+qZKfQ==;
	25:ukH4f+wcFxWMsVfg0kGWNJhuwc7jD6AK1LitbZ0/tD1NIKMU3Z9KjjkD/V8D9qT+a7w0IU0+1s92FwGyducacAmgPMynwnOyk1v+1TEXZaKEPJ7ZI9XQasZrcaXwaWTAeTlo6SyoogyeDp+zPOZzDW5qxj3Hj1Ne4K/qN0/kuz7dgoMM1dimBb0wSyVzuOnS/57kwJcCMfmA+9GgkyTUm58WyW5ds+CEYrFQLyMsy2Sz2LuL/3i5iXi/vRLk9zNWlmJ6RxsQafz0ThCGgigUQ2KfZKCxQu9GqW/j16wDI9RM4kdDC24MhQoV+RFDrZJRBCyuk7j3qgC9sNAfR9W3A2LE0Kaq0qUKZq5NUH4aly+mNrxJh5kufobV6OSJfW/U66GHqqGnS8CgeWL5GabyEaFfXEkO/PHL4as892K2GIACbNL2jMFuBagS5Y+vdBut1CR4oPgLsM4DeVensF1Gdw==
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	31:tX6AzKaPoXh4JwGRapYsuMnqUPkwAPq5qzB5+bQl+ki8QQVZ6o32u0WT++DH3M6rz5HNBCffgAAf4ZXec2t0si72Nb62CiGNnRSgNNtOn3G2bqE++wcVlV/ys/AUhhS75dKut2MPXOeyLUMWS2E3oAV4WNKXELpOwaMdac7bwtHxAMr8QtFGybUgVY3rTsuT/fm68RuRKal1OHGbJ6aHK2L5Ca8Y3n9+oKMAK9eCLXADnlG8vkewzhYZply4pDN2XFfyza5K8RaODL8cqs8VhjP7qoLVMZAqnkNs6YAHe38=;
	20:N2Af3Yp72z8iciVgqoQz6py7aTJD6hZEtxPfUlTtgSrDTzqSdfvna7/kLSEmG7dMSnT0qs5PXRdyl4zHqGmh9QYMNuOm9xQexwxF4qQ6oqLIm05DpnkJ+bIIoM/Jf61suGXmr4+TYmLKaGqdVq3cZB1K/6i216Avg9gQwgxZSp3JP5YvVEuPtq7VQ32WuWnxcK8yCrv8iUexEVzv0lzJeDUsy7P77gdKmhyN6C0YWIYs6ngz6WNQuXW+/4cEznIQWEKs14zY7IWd4q4zIwZJCckmzN1fXAr8ZtRD3WVc87zER2inTRmQ9QtluKDHYm66hAZ3bcMvjemVIH9yHLtJy6+nQVnGTS7zdL7s4UGGRrpK05ujrtdZwzq1jNcSm+5CcqJEGkvuWfizbA3Sca70XOPRl17a33X30jtJ4K8jG0R0FSFqUqASE3K16xEH0ZgGnHNuH4lffJt9njt7u+OoSSJr4dks/MIH7nLXmKStfYm2wPe/tkF+2z4RiQoX3Ru/KA0/B6I6ENFckTl8FkPAtFkhkIwPUZiPALhP7jR36X8fELuYsyje7y3UXbgtMItFJFzvW+JS/X1Y4Rniy4iY7xXDi9Sfh2+scGIdaXOLLwI=
X-Microsoft-Antispam-PRVS: <AM2PR07MB08044B238188F12F98A6BF15FE9C0@AM2PR07MB0804.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(13018025)(5005006)(13016025)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123558021)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:AM2PR07MB0804; BCL:0; PCL:0; RULEID:; SRVR:AM2PR07MB0804; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	4:ELqWWkTA+q2xHEKRxUTNrA4xWemXQiJsXR40vaDXXpNG3jds3rzYIG/AdNhpz97ZIMqlxmdQSyuzN6iqokOBSOKIflypLK7VLlxTeODsF4A9+4daxj7bLFNbO188OEslAmuCVkPpfq8MQ/hBR7dPrCdisOO0f3bD9JIji9WaLKua2Cp8pE+RHAs3FRGUt+Ogc9kNr6Gl7mdw5UKorpZVs8LlTC2XHfKXxxLwMYiX444QOTw66vH6R/xdvQ6v8nnetW2qfLeeGzZJrhWJABo3i4xQfQimstaJAX8jZh8UMbAuS4D308HNf9Og+2PKKZJ7nRhVPdQEW5+lmBbzQHEaPZhlWhieeapHonahW4qzU8IGW/baCxG3gxMKBXjr4JGddXS/igO9cJI+3igDw5ClMKq1svJjB/LprwAkGw+31K2oOo+ppVp+wOud35M2lpvnG3OK6ygbih0jHLcV4FC2qKGAPlsjrxLE0j4GitUZgpEPQHlFIDeGCqKdhokozgSpsAIQnIb+x5ycD3uyKYCR5TaAC4oyqmCl5ZD1qdKZQyglwcuHnl4s08HTa/4osVbI+CEn1FzYS+ntho298+i9c4lW9nwT7YJh/DoUngolQRMydqbTMIvrbud2C2ezEbXkYsPKtG3VT4lh08FAv5gxz+bFosD+6U+mQhm8+BonOlpMGLbKGiB7XiddCzAVuiA5sOIhpiKQq279GihIy0DNDg==
X-Forefront-PRVS: 01583E185C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM2PR07MB0804;
	23:rte9sF415dYIRCnTF17te5/YNmWkOVvt1ltqi16ag?=
	=?us-ascii?Q?G2ykjSv+H8Ve9yWSsoiR/QvvmjCsFkP3eXDX/Exc6ljig6U+5SQJZOYKYgu/?=
	=?us-ascii?Q?Pnk3reGHChIWHsrIpMqO7uyFvGyA5AF56MCoZt2kjOp0/gZbSd1IX13EKqDm?=
	=?us-ascii?Q?p4npsvyJeNbYwAUKIwZXI7zlCaxwWtKuoN6dmyfKsAYKu0TrCODO3Vvd25e2?=
	=?us-ascii?Q?pfbk3iYj9HE9bd0LHikfXKHW6ZwVgpgZyryyyAvQLm9eL+ABG2X+SjI6P41I?=
	=?us-ascii?Q?WM+GA6gZqvi72/CVrKaCq0HqlOCenUf1k28aamd+CxBoBXtGO7NOUq48nnaW?=
	=?us-ascii?Q?ZDOFKV+DjdPza6ImuaBjWA/53FRQ3mtBaDMPlXqRDob/MTthZv4QbEGAGtI1?=
	=?us-ascii?Q?E1AL4X7yOOGIYPqCGe3K/2j1zxo3nF7ZwmWld4XDC9SPQIMpQmixGCeHBdb/?=
	=?us-ascii?Q?hVQgDT006IVez+bhacPIsIOTRqGAevkAIuWyy0HmG+7iDz+0PuJJpkM5rfPN?=
	=?us-ascii?Q?3ieCjHmvJSPq4MNcRonnWh60DArs2McDmYszrYGFDx3kKhnoWk6oaZ67ck6x?=
	=?us-ascii?Q?475Eg2Oduo6/+dTlyazSroOPysRKeKBtUItMdtHzhgvRPGiUFah1junm7hjg?=
	=?us-ascii?Q?PzNRMvnfytmUHLxZPySxEFrmV00qxoUN0/oKAttfisUz6owwcL+Z53oWHQpT?=
	=?us-ascii?Q?EYSzTINv+w3KVTpwsVMHTf+t9YDamzo59qFKI8uzs1aZ5WNSjp8CYsi0C6l/?=
	=?us-ascii?Q?II1jZF4QzMUwe0/uNE5T7rEXlOdR3smmqw2/elW5Uer4lJj/jGzjZAyAX75M?=
	=?us-ascii?Q?dC7HNSxywQxi4I4Bwoi7e4yYY/OIdyktBVG4kXmi8AtPvpAofcZWxV8mh+9A?=
	=?us-ascii?Q?cNcjjcnFm6aOb5+seOZhVJoua433VEUutK/HnLtO252oIsD2iG+tLvtbrAQf?=
	=?us-ascii?Q?bLPapUiSGxZvHTcpunokdpYpIxS/RJ45JbD9zSabgVU08C5ddtwRX5lJilsO?=
	=?us-ascii?Q?3jDB931BpmKPLr+TAyK3Eu4yWT1DGBc1fv1UXi2pcvWzh7eWKnNuRZzggWPa?=
	=?us-ascii?Q?5JV4lm6pIPi00vS5nzINI5GJsfT?=
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	6:wg5yNeK38paCtV7xV/3WUwjbzsrcSDECZRexSbxwdqMOKggjkzMnSnRhlmOSj7u9rRgbLOOVoGs2/5JEGMdgbn7o0LHICCo1dhWGIQI/apr0GhVdduUqns1AkxpV8DCTlFm9h5jvkfaAYMpKtoGt1TQr+3uFJJoXzwAK1bJxbihKySFyIvAKOcG18gRIb0tpcc10wtSlyxAzWGEN8iGx2ldzyo1dnYXR3AGl8oEl3sbdkknVrnwOKH2zKDFaZMy7WyIeBqlnr/KZOvEm6jOWmQfdue9VZmgPSnOMHFYJ/sIHBYAl1rzgD8mhrSJJF7VcxQhqIp18OYTmLhgzqmqbvI3vGqKx3jv9iOlzBl7aMzK942ApFoPf4wjoFVAPVpND9GVHYuPa6sFyPuz5omZjiPGEIP/Q5tA2CakwsSMyt0BiLW0wCRGwKs71DVU97rOfHfUvAMNd1GRNYj84APCNkQ==;
	5:NTgZ3EpkS7dF5WqH7sZOH5npOcYVccy6+CXLcPD2j26seFcRdkOyBe32KTLqFmitem8X7ID/WvPENVlZVq3HvmNUi7KZmz/279kAgPEUXud7veWDScvx/vbjlBIGi7YbangHsn/MYxEY1Q3x+wm6bw==;
	24:YiD9Rzvv9rye9plCftcfkpcb+NIcdFg5VgjnKinzmTeYF6VlpcWdCmiYSvQ5WBtiIvdoSfDWrgNK0OMFnNod50+wMJk8PT5S5/Ye9SpnEtM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	7:jhtipOKu8b/TZ3Ao0WxPVvBCx71CKCIWfvLZKruv8YR9v+fpg46a4cS5fCyCHvhO4EraeteSgWAFsKoANx7IB+I6q7vSw6lgW8VM5Af78v97H4cwrpZeLNanaZuW3Qy6DX4GogzrJx/HoMnLouQWnEqGHT4zEEAXSoN+MXfUYN+V9fXimLTG25LoEJ4e4YDeBZ6jvi/49604TcYgLfoVPYh4bdnBuO2H5Hi5aZpeF+z06pSwOEwJR9LyuEzXWERxJKcG2P7EthlL90BP5CYQu4qgaKhR0bh2wePEklKBDPx8QcUzlWsfuaTZzfDTrTu4R3MBKFV0U2H2jBuiAOX2DG6gIg7EjvSEpRT+UbAne/Vyj0v9fq/+O0Kc4IaCvpoOLlhTGoAu2d74/NqzlgWU6IvlZ64p8ulfHLuIrLUNzoPXA8BympBXvVnZ5w3XS0eBJSdX7FP7QZ9oKPKZndMRuA==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2016 13:28:09.3333 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.37];
	Helo=[hybrid2.ext.net.nokia.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR07MB0804
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.107
Subject: [Qemu-arm] [PATCH 0/2]block: m25p80: Improve mt25qu01g chip model
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
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org,
	clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8J+a8nMjuwdU

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

This series introduce some improvememnt targeting mt25qu01g.

Marcin Krzeminski (2):
  block: m25p80: Add Quad Page Program 4byte version op
  block: m25p80: Introduce Die Erase command

 hw/block/m25p80.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

-- 
2.7.4

