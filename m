Received: by 10.25.205.13 with SMTP id d13csp691312lfg;
        Fri, 16 Dec 2016 05:37:20 -0800 (PST)
X-Received: by 10.233.237.138 with SMTP id c132mr2612974qkg.148.1481895440460;
        Fri, 16 Dec 2016 05:37:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si3164058qkc.253.2016.12.16.05.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:60565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHshJ-0000CE-LX
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:37:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHshA-00084G-EP
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHsh9-00058t-57
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:37:08 -0500
Received: from mail-db5eur01on0138.outbound.protection.outlook.com
	([104.47.2.138]:30256
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cHsgz-00053G-7f; Fri, 16 Dec 2016 08:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=C15+SKJjAoRxmrOciRj3U9yoXucBKPeZVfAzWprmUYk=;
	b=O4HtFvmSuAoYVPsuS62zrwq/yAPZveHw7ArVU1vbvXa0Gmgzj3VjzERS06FCgKvPv9tRM0mAyC5z53UMcQKvoPqSppLVVHAjVK8pnKGfJ+biSXf3PFjrQAWfcq0JVWh7TMeNg2IlWJU3dDw6OJapaElZdDToYrmWga9a3DbgtWQ=
Received: from AM4PR0701CA0011.eurprd07.prod.outlook.com (10.165.102.21) by
	HE1PR0701MB2716.eurprd07.prod.outlook.com (10.168.188.23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.5; Fri, 16 Dec 2016 13:22:51 +0000
Received: from AM1FFO11FD042.protection.gbl (2a01:111:f400:7e00::196) by
	AM4PR0701CA0011.outlook.office365.com (2603:10a6:200:42::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.803.5 via
	Frontend Transport; Fri, 16 Dec 2016 13:22:51 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.35)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.35 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.35; helo=hybrid2.ext.net.nokia.com;
Received: from hybrid2.ext.net.nokia.com (131.228.2.35) by
	AM1FFO11FD042.mail.protection.outlook.com (10.174.64.231) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.7 via Frontend Transport; Fri, 16 Dec 2016 13:22:51 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1469; Count:17
Received: from fihe3nok1348.nsn-intra.net (10.158.36.136) by
	fihe3nok1346.nsn-intra.net (10.158.36.134) with Microsoft SMTP Server
	(TLS) id 15.1.466.34; Fri, 16 Dec 2016 15:22:50 +0200
Received: from mailrelay.int.nokia.com (10.130.128.30) by
	fihe3nok1348.nsn-intra.net (10.158.36.136) with Microsoft SMTP Server
	(TLS)
	id 15.1.466.34 via Frontend Transport; Fri, 16 Dec 2016 15:22:50 +0200
Received: from fihe3nok0735.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMfHT030204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Dec 2016 15:22:41 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMeVA030178; Fri, 16 Dec 2016 15:22:40 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 16 Dec 2016 14:22:37 +0100
Message-ID: <1481894559-13974-2-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.35; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39410400002)(39850400002)(39840400002)(39860400002)(39450400003)(2980300002)(438002)(199003)(189002)(81156014)(106466001)(305945005)(8676002)(76176999)(4001430100002)(22756006)(86152002)(575784001)(86362001)(50986999)(5003940100001)(50226002)(356003)(8936002)(626004)(77096006)(68736007)(38730400001)(53416004)(47776003)(110136003)(2351001)(92566002)(5660300001)(2876002)(81166006)(4326007)(97736004)(189998001)(6666003)(36756003)(2906002)(107886002)(50466002)(33646002)(48376002)(2950100002)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0701MB2716;
	H:hybrid2.ext.net.nokia.com; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM1FFO11FD042;
	1:d2DeGPaYpyvA2p1R0WP6cA3NCGo4sRIpWoda5chKzH0s+YUZqnGV7a0wyt4vznZtTWZ2GqWWq3QMvntquVf1IpWRvNP6hR1Rt2B+04aquRnZAIe8tK5/QZK//3Srp9cEeLXlHSZP848YMIc7X58YKJONDWNP8nw1LMxIdrRr/U2Ad8gqP+CtpRKsbTfCZQfwWHLX+VMikXAjGeaW9aUjjhJqjAPxt1ixgPV3YTEHKc+ph2+JiVn32NiniNm2OKfLDTku/wbQv8dIveHCvFQp449dqMVuHabq1Q7VTUhT3AYQa2Pj8N+MbxYdr+6hp0aOe+GJBFI5TbKTZoJdKuk1qQuNAb+hRZJ4zpGpRjj8dIGJ2mrzoQZMOIOcIlpQAh2/PHOjxdIfDuqxj4Qo6WcYlRH2Ygxo+OflWqA9vJwq39VdR3SccAYLtcFINqj7EgkQw+6yD6SU0H7U5jLMXVw9SmDbxzO7nI9KJEDJiByYmasRQ6InhcuGk7MB6DltiOGV0P4ZA4tPuhnS5UofCQdPWg==
X-MS-Office365-Filtering-Correlation-Id: cb478465-af33-41c7-e809-08d425b6a2cd
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:HE1PR0701MB2716; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0701MB2716;
	3:qNJhsBd6AymQRrMrwQ6bmflW96qDjtO4NwbkIfG7CYO4CA37b8djIS8pxL83GCzwLIQ7LbB44QZ1kh1RwOr0pxHnMGc+v1uWaxgv+q9LwnAHOd/heSAdvXYFu4Jm2BLPhNBB9d+G+RpuDSCN6CvKkQ0vzRuJkfodRlKc7pjdm3NFeUs1qSlcCPMs+pVuDE4JnAaQC9hml4v5WzERP6E1p3L1ZD34lz6hSN1gPXs+nAEjXiGBuGXvO2YnKPBQg5MU/gjY1iZ2BHw0pD+eL463bQvPOBnX61sjMv/7OkP6OmCDkfyPqxrvU67OtEsr4ul82k2tKyoxYjhF+Nf5l1Ef4K8BcBqF97G6XDSECQkxbnKOrC2VsXy3flhFFdJS8Dxw4Yz1TUeVfC/E08mrcXE2Tw==
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0701MB2716;
	25:RLxm+UMGJ9+LIwtg03QS/f7f9Ox+sD+mzit+3E5dU/AD8ANVPyHrOJGq2bn7YqaNb3dEnlGXzSRH0HA+je3uprKtC1LEAq8Ze2/vV+SktvEiDvXWz1P1Tfh8T0HELYbCG0+K1y9tmrer9rbbyrE8z+7tGIRIcq6tEYZ0RMR2ISlx9GC4cdt4MIQ7UKnin98Ule6TzBvKelhU2RgFqC/NMC1FcWOXQUQepNn8smdkS3by5EUXDk79qddr6McBT8pCWx5fyW+wFdnAiC+BAj8fGo2d6qyxX4fTUcVPab3wWs/cniUgRmFy28DWOKHLsjVL//W7bIRHA0HfakUjOwjvPrM/2pfVagIDhv95uEUC+hcDFa6klykEl5JnT0RfiVimY2ERHTKLY55RYFoGYrJwvyMbX1gY7ErqUhjVAmVvlGVve1id/WCMEPBfKliwL/ypCLIBvifWgnlyMI34EB1ymQ/9NxLDy8HZrvxuPZLqw9D5MvqfmvVBPn4Ej7+O7saHEe9m3WnTdKjGZtIp0SsIFO2OIamHr30RrktV7k4Dd2mp14+Dcq/W7ACApay1rwH24Gvc0w3YBoWdJCgb+9V6bX/cBCvEUS7x41rrNBeoacOA8xitAzXfTE9vR9e6LD7tptphMGzZT+2ITrWKwDEoNR7ZhEjcQTJZpap+TTb4fFrRm3tybYc7TJrn7Jy/HMQTcomg3JRfC69ugCgJjSOd9clyDVlfy1SLi4D5YEv4f/AIWUXXUQvBuQD7Yg1kXhJs
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0701MB2716;
	31:8VMOhurk/Cqkjn84Fz9oghkB/ir3NHXn+SF9m851r7zvxzHiO2QtuS6pzsD8Qx79JC3WeO17ebLasyUXBSLwTWN1erMNum0q7pFs5fKaSQK45N/Mrux9wxSrUauUtjBTH3uaFMVqTZbJMhTUqfu7BeQFziZ2xn+k0j4aWM7q251EA3MUWqamuqReghFvMFsa10Y/SxIylqGLFS0mHmwv4As0eF2TfnQfrIb3hEA5SkPVGwESMGt3EtAHdGoXe/EWb4o81KYOJOQxxsruZ97ifMmg8Wa5GeF8NNumA/NP090=;
	20:3c2IS+igpul5JIyRO0ime2t/aJ2EXQaZf2D0D5bNLBq/VOwVqzZH1N4udTszZsLTziRiHpHQRKGY9kWy5cEaG3Ytbpl0+aIalKi6JO3SqLjpPafEiGGu3i/iVywYUWcFddAjMZSVFKKVnhy/A+k7eyJiF4W116hPq9p9XUSvqaWkq5Q6jXxyGFA79RGdjvPVmo3lZRlWqPCnNptFpfLNohrW2EWGxvBJntnbMhBwQZKzNvAd4Spfm90Cypz56ziuQyJMFRbW/1BRQnfyOyCqAZl6Gxlm6ZSZ9amY0EQ+cJVNFsqR2ONR05tFc9+KA0yltUQSlk2dSmhiZMgPr2LlTmXYm69jB2N8EuyfnFjXowN61Mei+BLSJf3J+/CNH9ma8aGlVt7pGCb8qQBuIMrvvJXfxkkVcC+cDLQouk8Lr8KsARdtJMetJp4wJiKLilTOGKqaVLdCyfpIZvwUlLebR1Mw6jhD8fvxwalN8tUmc2LP5yPVtj4P9YHnnYV7seJdD+k4icwGUnc4rGOnVrX2nY6wGYmwzDTNTaWw6VcF905mxr7Up1hB6OgXKWyUU1XdiAgpDtybpbphzpHnSubgG25u7W241m2h7rXcoXa7vZU=
X-Microsoft-Antispam-PRVS: <HE1PR0701MB2716E390525D734B988AAAC8FE9C0@HE1PR0701MB2716.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13016025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148);
	SRVR:HE1PR0701MB2716; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0701MB2716; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0701MB2716;
	4:etRb1L9oQZhPMnjQlfYEbKU6L+wXMvoX6qgfuDxJp/BNiGAgVzngl5R2y1FM6c+Cku5wjACJPE0oym7OEQvLVBmyqma3eyKQWUGRGJzgp4YzVVc4wtsJMjOsGxRcqEJm/CuBV731AhyCNw+E1D1ewRG7KfY4/mfnAmS7X+mTusfXkja7WSViPA8l+ib+7gYBr0dEbvIuaP7YY02gWuZIzL/2+UStvlAJ+qim89GmfINKZ2yU4NpY6L8A3KBAd2CHQK0r4DSfdhmt0diYM+Pr98Q1TPwy84aJQgtyKXlHvXdWUCQ7cXtMSOKy2lKBJv7EN5geLa5eviW4SMWleuArn8X3DHb243MclRsNKHar1QUiEQU/lUGUet/pRvcinq7BxsXZFI5PhOFNvHCNn9K4+RnmKWofwM8AC5yIaAo39L/atSGtgOWZusAtbDbL3cyXkD5YYDF1AGWotKp7uNgizvBP0UvBHWb2aKAGddtX66cntEjIGZVq3qSMKV6p317JbIfgIA0ptdpvZxhqmbyA7rDuoK9rKs+x4fvkcIMGiUDjiwDMwrKUNHVbMc6uBZkgEoJzUpRgNKOj/wDGI10TpfhOzB6CFy0G2//zZLz7O+i0OKmjbuLryeKillXSok2wx5fVgWHxdFHbYXnQY30D9ABujTUNgcgDkyb7MJbxyQc=
X-Forefront-PRVS: 01583E185C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0701MB2716;
	23:hig3WNKASjK/rOeDWTOPgspUAEWNotlgzjjC0y8?=
	=?us-ascii?Q?cOQASzZLhdgAQXM3cE4J7soJhMwqUAT8WTVpREER5gqkoCbANCK9QwKYHV1C?=
	=?us-ascii?Q?W6RTFKN5Vtg0ZcijGO0MJu0kTY+JR3XE7Q7JzWApTNnkbrPeH3xJL0PF5b6K?=
	=?us-ascii?Q?xvHjXSKq+svyJJ+kRqwtHgKWNnFukhAMtIw8QCSAIlh2rFQ7hD+HFwCWJMrY?=
	=?us-ascii?Q?msec6A9j6/aIyT8znSBWZKywPjQNFfpox7HbHPMBsY9qfT+dcxDtvf7pgFIX?=
	=?us-ascii?Q?+jAijwLehmmLkJcc1nR6WvTR+f+L+crIxPHOxVW4FzZha8HY5T+5xg+tn6qj?=
	=?us-ascii?Q?P9AnploPXuUhAbJe3zpS1KIVWpCpk8s4kx+DNRHkicTFGbXHH9uawIlZW+Wi?=
	=?us-ascii?Q?2oRq9Lw9Mifrf7TpL1LJPQ0hgdr/Nx8xpcRfjL5WUOeYyCBk9xA5+7MW0Enx?=
	=?us-ascii?Q?9HXE7kRvbPNOC3eWndzciZBf5hXdKIgfAokLOmhOyftsLazC/YzxQ3O3xq8Z?=
	=?us-ascii?Q?8N6GzeK/i1DUkMyysuvv76xRYyhVdu5wsgiV2optJnSbzD+QJQSmzUfdKliS?=
	=?us-ascii?Q?xQGLac87xwNxqPZaCZN94Fy/g329A7tr6/NhOdNJ4DYf/Bn7bvO50xPo/aMe?=
	=?us-ascii?Q?EYZlUvmjf/bomHvq9P8JBHl5VtwBYPuP/9C++embrUeutc+02wdi3OEsA7Kk?=
	=?us-ascii?Q?/fbjT0w1DcZSdRjUUzNPCDa1UNY6BfLTZ/J84leL/crjymNFavhzRJQnlkf2?=
	=?us-ascii?Q?TUEMMFgC/JYn+m/L6nmbqy7dEXhEMeDiYykPs24FnM++oLcCVME3Y/ogmhe6?=
	=?us-ascii?Q?nQbOyMuc0ggor4bOXaoPRRCn3xWgsPnA60sra+R0c/sZcD8O2eE4DyqTxrSN?=
	=?us-ascii?Q?q+Lfv0H23Sc2l+qEako+BRCEoK28c7pjYdMB3BBaJOi2Mxhu35ba4MNiTHof?=
	=?us-ascii?Q?8hLN4+fb8zTEIinofjsQDDtyrnTnqyzyZJ2UfqEoZtm4XqeurY/nUTMQrBKf?=
	=?us-ascii?Q?dkdN3+gUx5Djpr1wEhJqNTJTyttr1TANpnPUBBkbHX213TSgugsf2VHor3K2?=
	=?us-ascii?Q?8Zfxc5E/bc8xI+RwaKgLr/k2QqkhnpJpBILxdhZ0ittkPv2q20okYS6GfeNt?=
	=?us-ascii?Q?piXoOuWMrdGYW9ermPEohNdMaXvRtGraedBMbm89nEKtR3DRp0NsQ9zYIW7n?=
	=?us-ascii?Q?dwDKubzAosyrWLLtxfLwdQF0sp4qul/hl7aiWKyM3lkJaZOk7Hny/NYnrGg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0701MB2716;
	6:8LPA4S1XfsGD3YB1/Ux9lrgX54qJbntx3OIO0sapfcsWrXdc14PTAqcc9MLD/D+ZnysfXQUv+w/ZgCyCkTVPRUeF7D36NB8NthO8Gz8TeNMUvyVPBW8GFv9YG9qJ83NJQyfsaUUOHW53SKhCNDlMos1BSD1HEFx+ppFPZW2NTAp0dItSS2BmlvVK2bDmGGD2qrMy88LCGFdfN2e/m43TFIP7GXOhkFyPISt97iANmtbqIA2WJ3vhxCZn69G6pFM+dP+snUO5KmJVvUfwUEHig3PeEzh5ffj3imNNqXWo0sdv4HtkQ0y/gTppFC18nuT16DLMqBBXYARcuuxjfddU507/Nmi0AuVs1BMOHkXvmS7uQB+Di5rgGGmIxUQO5BJWFdLOV4ov0n6cOMb9L2pN/UpdQ4zWmWEzB9UA/kLcszzlK0Zvw5jTqzBinnYE24a63l2sE3zksxbXJrGYR/ri2Q==;
	5:Lh2seX2/3I/gMq00B2LK3IPOjN3FxUkp9I9fVVymemrTutDiEkSM+vjHERBPeagZMPz7+7Y83Kb9TgBytBSjIt9jb0kSf82zK94PRkgVOshzaT/NUGuurmLvbj/4IdSo/jYOsWQteYduSFQLJwS10A==;
	24:LhkD3yC67Yo+EQhLrJPmXOPqCWiVcxlFp4rIjJaufoVmiqI6G/QqsgazYzozH1DmFieu6XBTffeAaQKpJY+HhTJauc9UA9TJGjX2+F4HO+0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0701MB2716;
	7:RSVi/J28mRHvRJDHCb+sO2t2evIGTrvvIJl2rxIoKVeD9dQicC21n98xghk29jA2nzdsTREtahf3rw47lEI4OI8X+4FjZUkaWeJ8fxDAW1XoWnB5t6wB4MWwXDMC9tVunvTCXw5uy2q7Qv/eGCweix9zoK8T7/2HnQnFuXiwJB6fcsO9H1Mn/clrY8TJY+CFBMqPDmS7c5K8kHqqe38NsInmPrYte4+YiZCYO0gM59CU8+5JsRpYhY5TCTh6/czhooJHIZvGz6Ac3CKPq3w67nfRZmXFgrthMgv0hp6F+C16hx37BsPEUEhBlYZ6/T2MM1PjcDvyW4kKsmX7bthVk1bCNSzs/+cZ5PdBlGG7LL3pd9n0TviVcaJR3AIYEbybRYvLmQw0wMiZ+6DxUwxPuS+OAI3PG4xO43eKX5OpBJN2gyI1I7f/1uzCwtqTIp642jNFZ8sJ7nSYTizA37Qkmg==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2016 13:22:51.0825 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.35];
	Helo=[hybrid2.ext.net.nokia.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0701MB2716
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.138
Subject: [Qemu-arm] [RFC 1/3] nvic: Add CPU numebr property
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
X-TUID: QenLr3Js7SGw

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

In case of MultiCPU SoC M3 is not always CPU0.
This commit add cpu_id property to allow set CPU
number for NVIC model. Also address space that this used
by NVIC is updated to mach CPU's one.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 hw/intc/armv7m_nvic.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 06d8db6..66f0f70 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -34,6 +34,7 @@ typedef struct {
     MemoryRegion container;
     uint32_t num_irq;
     qemu_irq sysresetreq;
+    uint32_t cpu_id;
 } nvic_state;
 
 #define TYPE_NVIC "armv7m_nvic"
@@ -187,11 +188,11 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
     case 0x1c: /* SysTick Calibration Value.  */
         return 10000;
     case 0xd00: /* CPUID Base.  */
-        cpu = ARM_CPU(qemu_get_cpu(0));
+        cpu = ARM_CPU(qemu_get_cpu(s->cpu_id));
         return cpu->midr;
     case 0xd04: /* Interrupt Control State.  */
         /* VECTACTIVE */
-        cpu = ARM_CPU(qemu_get_cpu(0));
+        cpu = ARM_CPU(qemu_get_cpu(s->cpu_id));
         val = cpu->env.v7m.exception;
         if (val == 1023) {
             val = 0;
@@ -222,7 +223,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
             val |= (1 << 31);
         return val;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(qemu_get_cpu(0));
+        cpu = ARM_CPU(qemu_get_cpu(s->cpu_id));
         return cpu->env.v7m.vecbase;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
         return 0xfa050000;
@@ -349,7 +350,7 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
         }
         break;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(qemu_get_cpu(0));
+        cpu = ARM_CPU(qemu_get_cpu(s->cpu_id));
         cpu->env.v7m.vecbase = value & 0xffffff80;
         break;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
@@ -453,6 +454,11 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
                   "NVIC: Bad write of size %d at offset 0x%x\n", size, offset);
 }
 
+static Property nvic_properties[] = {
+    DEFINE_PROP_UINT32("cpu-id", nvic_state, cpu_id, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static const MemoryRegionOps nvic_sysreg_ops = {
     .read = nvic_sysreg_read,
     .write = nvic_sysreg_write,
@@ -461,13 +467,14 @@ static const MemoryRegionOps nvic_sysreg_ops = {
 
 static const VMStateDescription vmstate_nvic = {
     .name = "armv7m_nvic",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(systick.control, nvic_state),
         VMSTATE_UINT32(systick.reload, nvic_state),
         VMSTATE_INT64(systick.tick, nvic_state),
         VMSTATE_TIMER_PTR(systick.timer, nvic_state),
+	VMSTATE_UINT32(cpu_id, nvic_state),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -494,6 +501,7 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     nvic_state *s = NVIC(dev);
     NVICClass *nc = NVIC_GET_CLASS(s);
     Error *local_err = NULL;
+    CPUState *cpustate;
 
     /* The NVIC always has only one CPU */
     s->gic.num_cpu = 1;
@@ -531,7 +539,10 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     /* Map the whole thing into system memory at the location required
      * by the v7M architecture.
      */
-    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->container);
+
+    cpustate = qemu_get_cpu(s->cpu_id);
+    memory_region_add_subregion(cpustate->as->root, 0xe000e000, &s->container);
+
     s->systick.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
 }
 
@@ -564,6 +575,7 @@ static void armv7m_nvic_class_init(ObjectClass *klass, void *data)
     dc->vmsd  = &vmstate_nvic;
     dc->reset = armv7m_nvic_reset;
     dc->realize = armv7m_nvic_realize;
+    dc->props = nvic_properties;
 }
 
 static const TypeInfo armv7m_nvic_info = {
-- 
2.7.4

