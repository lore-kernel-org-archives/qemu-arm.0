Received: by 10.25.15.230 with SMTP id 99csp802150lfp;
        Thu, 23 Mar 2017 08:09:32 -0700 (PDT)
X-Received: by 10.55.97.130 with SMTP id v124mr2519338qkb.241.1490281772579;
        Thu, 23 Mar 2017 08:09:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si3889523qkd.232.2017.03.23.08.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 08:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:56926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr4Ml-00057f-Vz
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 11:09:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1cr4Lz-0004qe-Nm
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 11:08:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1cr4Ly-00020m-D4
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 11:08:43 -0400
Received: from mail-co1nam03on0062.outbound.protection.outlook.com
	([104.47.40.62]:50505
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1cr4Lt-0001xZ-ND; Thu, 23 Mar 2017 11:08:37 -0400
Received: from BN6PR03CA0004.namprd03.prod.outlook.com (10.168.230.142) by
	CY4PR03MB2791.namprd03.prod.outlook.com (10.173.38.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.961.17; Thu, 23 Mar 2017 13:37:26 +0000
Received: from BL2FFO11FD034.protection.gbl (2a01:111:f400:7c09::118) by
	BN6PR03CA0004.outlook.office365.com (2603:10b6:404:23::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14 via
	Frontend Transport; Thu, 23 Mar 2017 13:37:26 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD034.mail.protection.outlook.com (10.173.161.130) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.977.7 via Frontend Transport; Thu, 23 Mar 2017 13:37:26 +0000
Received: from fsr-fed2364-102.ea.freescale.net
	(fsr-fed2364-102.ea.freescale.net [10.171.72.66])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v2NDbEsw029966;
	Thu, 23 Mar 2017 06:37:23 -0700
From: Diana Craciun <diana.craciun@nxp.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 23 Mar 2017 15:36:51 +0200
Message-ID: <1490276212-32008-2-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1490276212-32008-1-git-send-email-diana.craciun@nxp.com>
References: <1490276212-32008-1-git-send-email-diana.craciun@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131347498464980194;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6029001)(6009001)(336005)(39380400002)(39450400003)(39410400002)(39850400002)(39400400002)(39860400002)(39840400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(8676002)(77096006)(104016004)(50986999)(48376002)(50466002)(106466001)(50226002)(47776003)(81166006)(33646002)(54906002)(189998001)(4326008)(356003)(305945005)(8656002)(53936002)(2950100002)(8936002)(85426001)(105606002)(5660300001)(86362001)(36756003)(5003940100001)(38730400002)(76176999)(2906002)(6666003)(217873001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB2791;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD034;
	1:UT2mF2quF6ks57sdfH+RuAr1i6sP/+GCRkzEfiasCTRNhUZ0R1QLWd3g6J9XHANY1gof8BXvUbQjPAFYLGVHDckqhJoMr9ghWEZDkgzniltuL5BRQbSDE5qXOdNnLW/DddG1XxujHW5T/p0CWbpB1N67qCxA28nyPtoSNHBVL1CVQTC3uL//IIx0che6UQznxsC1q1BhqfRneEwFeGN2CtehQHV2Fq5+41H8z1Gx+X2AfIBBXUifKFL/3rNzlSYScvnXQ+qHHtZRA4O2hUaWkxHb0BvC0v5BJtfYcp6pzvt3yqEmF7IcG2hIhbrkuU7YvlZfC5rgejS9WdJlujh551EuqFRxo1XJcndgwvHP6B5CVaH+Jfw8KuTtLNKwaGGT9sItElq70k5CglptSbnXxYFsezgd1C85JwPGdQ+MpD35uydW9DkcxZdBd+AkZ5a588U5pv8hvfKoqd713QY9D22VwGiJL4K5+gC6XK74HbOpX+sSUbCE2fatW/Rf1Z0gk8eJ9I0BrHcWHLWkt9QyOSxc4NelDLm4K+askisMRLOg+gy4UOBmMv4LSLJOFJpZ7mbr6gmgLp4m7WCCO3G98eujonr1xETK/kILlQaiTfjl2RsGGifNyBio0Ayd6gGCdYcosO+vi2NyhsyvBUgkqqcjrY6p9yszWgueBEP0/LEJXPGLS5T3iVE9x0iBiTHWh3jYHXEeR262GG0BNvRe+Q==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d77a8197-398c-473a-2ce2-08d471f1be9b
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY4PR03MB2791;
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2791;
	3:vmRsedBRcBI86R+dpOknMR1IllfrABDBZvWVgQdZ1nKf7W6WDTLrKW0s1j00PJ+7NHH1navC0tZuVR5y5hv0zdzCsJtVUGYhq7ekBpy/rpExR0MyhHw4IvGgr0Ti7WAcPvE+FZSCtyzFA9WzpZvAiyi/SS4VxawHLeXIk7sdXph44WeuZPaHAl+n3gV8HFmBEHrR7KC4C9jltovWTZzyLekCwyXfKR7hInlVX3HvkDpZmq/d1oJj0LfctlhQ9DcOngyhk1q2oa8T9nrSqtaMoGM6Kq9wEZBkeurTFx2C8k9Rrbp1P8cl8/FfFJIW6MUYjkFnOs5anFHW/mkAjCgMsYFpXulaB25gxR8tu5QuJ7p0GIthvMuDJN90Nl61kr0x;
	25:gbSQ4NXN9Q2T04kTrg5apYT7GsYcF35H+fflXtLzTjyknQfWDE3/6D9nlp0NrYPi/bfuKSGownhBtw3NECF0CT+rzgtldzP80iEzvjotfgOn7V/plrfF01+s8jEYUDnzxSaU73+KPSltR6x6GwEQIZ/rved6OL2B3LYfqnz+PoWLjMx97u7XBq4DPD7U9fmc/QkNzkEoHUrWiQiR8DYwkjSXh+4reDdEut11TO8mMVV4BFy2MRlmmi61hxzeLf5C1xFDFj8VEa1KpHOxVdAe5C8kbhxri+7nVZnA7fvxCYy7yEetS0ltbK5szGZDC6rjtiyC7vMJx2U+EcR7wAcQ1y4plS1pZZQBPqB0gYhO0O0oYNtDVOmXVQ5WpUpjq6501/NhP2zs7zK8LhpN9k2ZBb5Le0OAS57gf8ake233fs+GJNf8pinWEGD0x2668INXDvf6ZRsthX4YMtFNv4wesQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2791;
	31:BWiRWhByyNJhYLWrIX/raHtMWMGxwKmA2qGYN8tPcgzS4pkLr6AcyAqw80n357KPPG9+PkNob3IHgsp0Cdc+N7vJGEr6JRs+c3RlYrfsfuBypGtVgFgbPKoAfHLanhwDcjRzhwrbVjAklbLBhjaglbri707GMOwoGvu9d0IX42+A39AWg5xoN1/dVbwYgM0SJhizMCSlN3W2DS3nvbmQY4To0swuyqaJ+yn7qCFTBuIQ9JcAm3+TYSOJ9fND4pacgEJhaWMxS10LliU0UVBpbvPvP6RsfYqb3mJ733VEsno=
X-Microsoft-Antispam-PRVS: <CY4PR03MB279185033F1A703E9D8EB02CFF3F0@CY4PR03MB2791.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095060)(601004)(2401047)(13017025)(13015025)(13024025)(13018025)(5005006)(13023025)(8121501046)(10201501046)(3002001)(6055026)(6096035)(20161123565025)(20161123561025)(20161123556025)(20161123559025)(20161123563025);
	SRVR:CY4PR03MB2791; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY4PR03MB2791; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2791;
	4:h80AriPMYTGyMmyViZMvSeumKSgYBBHWKMcovgp3+XA6T0TKr7keZqo/X+42vc9wmT+qyiVFKb9yRXcUwG1POGTEGsyxzBgTBWpOwkYmJFkgmq2zBkcbwHgDsQS10g1ySdwBSsciU9Y6xmjDWag+R5sRxCEm2KrmT6tD4titPYsud3Ib5GFEphOucVdNxY3hEdP9ZuZEE9okn4t5VrK23rd8WMCtTZO4nACzGQxYeUJ6AFF/vizyPX27npSNDO+uM3ZM9XxiSFSwNRR133h2ELYQs60VBLgMAYRDW0PR4wecGfDwqoyLbGFsdGsPJ+ez0KSKh5GFEbZt+1g+3KoqeKVJDHOgPUAiejUa23n2x+4HVqk9ucKWknZXWh64RXOHmN1sYr9qiUk9w+QmULT2RyWF4fDTkxAZuyDPvHrD8pVMhYjBIps0KEtsOXoAxeWN5PelO+dhuQm6UA2Ld227F4yRxmymhqz0fCzJz898tHb8SFmx3dgbLc9fnU+WhVQDrW8tkw1bFrCxEbYqk1WPscwX1nogMx8EqraCR8kLPFyNlyWHpwMo2aKjmI7Eon8XqMJLGUj1s6l+dSyi8A7vg/4GDf38WFVhdF2omSTsaJ03AuIWaEhFo0eIdvid8WVzHOFRrCNV9i2H80W+ZyD5HSnQg0KiZk6UlIvVU8d7uAdxehOYpS92qKMb0p+3gRnJszWoX8bhN5zkW2QHtTMOFw6kJ/4jNhJtZxW46GZkuI1dPQpJKr2T/43o07wX//6q
X-Forefront-PRVS: 0255DF69B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB2791;
	23:wtoDuV7oAh7gmXazKCmcA5liygWlFefrmPrQuNQcN?=
	=?us-ascii?Q?XpHXMjfZYisgVFkpkxnXfJACw6+2MhbmuyCRVJ79o0kRhEFA/2Yyqp7HEFPQ?=
	=?us-ascii?Q?g97lkHFVhUjZhH2K5V9eme6R9YWyae+3lNbBW4wB0V3OGjE5eBVF6hbPAdE6?=
	=?us-ascii?Q?OMPW3jL/xwWJL6jWqBbjwIrQYIVfy8iqWD+aU90aBX8bL/SFbpr0e03tlZDS?=
	=?us-ascii?Q?iyc/WjyL9evdsHAFGs5a121ZLsr8YGTW8pLQoaEwGXFGuCyOj150es8oanvO?=
	=?us-ascii?Q?qqphzMFfI5Kk9oC3Iofuwu+W9o/BZ2pLRZd82d5mqoqnJl5n2coXjiYCd2gB?=
	=?us-ascii?Q?TR9eJb8cXr3ObX2zE2tf5PprYbjMHBPkJAqoF2pHY6nL5CLUxyikEpJAp74+?=
	=?us-ascii?Q?vuvPexG42xJu92n5PAMbaNUPHaNKNCrbqska6HhsxdW+rTacT5AErPw96SfY?=
	=?us-ascii?Q?juzqoIAp8UtE0VgO4IXFhq5fiEV/74xtU0lNddXCeR9pe3LNbz5wCpWUcmCT?=
	=?us-ascii?Q?z5AfrMj3Jx/L4n8dp6lsfIZP68/4ZvZelQBmkfeqC4ctLq6Fb/cRZbxjFZOV?=
	=?us-ascii?Q?aWjOA3OUVmFQEK+lhKjbJLjFRnguvynE1Qrd5Q21q55R5q3ngHEJ/+fsXyEI?=
	=?us-ascii?Q?kFUpAS5QfAc1zkEJ6Z4yp9N8w1h/1Kh/MPgmsrIWpuGdIgjVfPgpovWKaxG1?=
	=?us-ascii?Q?hZ0G66sEPzrm8yVX1t+h2Cvad8EMF4CoJjqMwmxsde/WSnGHLkbLZYgSr39l?=
	=?us-ascii?Q?RSy7dhPbTNyiOzpHEy6hsOekO4PjJdGgd0jr8E6432tc3WWnphjPu6qdQpCe?=
	=?us-ascii?Q?kTsir9XkzYNjQq/tcHlwKLiXvJd+NFmnyyI5vUqIXqR6lLCPZ8BkULTOMBnd?=
	=?us-ascii?Q?1qvX5LR9uSQYatYgNTZ05yKfqKjUbk2kCT0qXaXonrBaLzScvMccGQM+uhMC?=
	=?us-ascii?Q?vEpMXqoYWHGJ0Ovv6Ceo31Je2H29jICTCboyqUGdwewXlCAk3dUXxdvZYi5u?=
	=?us-ascii?Q?bKiBmZGVBbM1JDTTTrypIKZYgQ8o+4ZJelfMr7OUbi8d6juTsvEFxv53qK4D?=
	=?us-ascii?Q?ccLLGJHohtkTxHADUrYhoZitMiFAnGmHP0lrU+6HHdU5GW5mFGu6K/QLldqf?=
	=?us-ascii?Q?dX5evfTPzgL1NcebxVWr8a702RcVcj+EVH4SSEWFbbt36vlgHQRnRX79xPsZ?=
	=?us-ascii?Q?dK+YGdQPPgI2hNIa/suO935bf3Qsn1ts4ScNUNfpPi9CBfJxO+8N9SI4Q=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2791;
	6:1Xm7d93yk0OgGy9X0rufFrLVl/TWBYhsjP8kXjYRoU6r3d97Cm30wFeg+sruEN2fuf3/kEeaKO7Wmez7WC/ev4IIrUW5OY4yjrH/3AnBwIty4s2IyJMc+ij11Yf7ETv4wcxvne0mWxzzHI3m43uE5ha25fGFp8F3QA1YoZB7GyMfaX6Wc+PNmAf2vY+MnVQ++wukOeSF6/OL1QPZuaU4E0pAnJWinabYUOs4zn2zLVbWpnj1NtafZSLq6CJwkysVeC8KJYE1DRVz4Q3h74lXzE4ndjpC+Og+GFRoRYsHbPNBA5GM37bH2hO/j0G4pIaP7mzeW1W2PAQLrLgsOPLnHq9T3L0cUFAbAmUVRtYvtCFzaQ028fLQ+mRNdgScPZeX7qnjfRKcddfYUE9+kUMWKXAQmItSKmLu4ZWA8R7Kt4g=;
	5:z67HQFhckzw7pLsQ6YZxFSYQ8aj/0F50wWPxdNeZ/S1QXmpuuBVCgBq0XEYALT1rIxD22sVBVH50v3MLukxmtzov+NsSOoGBSSCwnhqaAXhcIGWwBY1HlrU7yp2Qk2J2tgJiqikKPMozRbAmclQsB9aJaMyzoK+AIPTx2u8JqvYQ+3z0g1p72Js1ysZ0hcOZ;
	24:IrWtGpzMh7nh8Rd5M+9OV2pjbqUGDUg2ILPIxfG6E5rAyTRBbVU936JeBfyiCQ2BVieF41IQyO28L44TqLZWB+ez75ptgL5AwU10TQvyGUE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2791;
	7:Uil+MmDzQMnnZwhBref6fhGhfqkPVji327tdvEZPxCJBKnTKCKcQmJyhk0JtLFoxziRxgkHIhXM/BTPx7mwIVKq66vmS+qCIqo24CFJ2WpGjQXzR6YHAzloCuI5SFUswX7EuGRUKZdcM76pKiK+SxDSlq0DM9poEpBmvfn3wYXTk/yRhGClEcsUu5L3TJ1RjtxUeSRTLDrINEvhe9nieNJQt9+1jNGYyFBOvfcZR4vD30IItHCH6eWH0DVJDSc/u5kFmnRmB8K2zz01xeRmXk/NFabgrg1w3/WaE7k6LYZrgdtgnMzMecPND4XwX4s/9AYdpGLdrKdDC1kmBmKL4NA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2017 13:37:26.2796 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2791
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.62
Subject: [Qemu-devel] [PATCH RFC 1/2] Increased the size of requester_id
 field from MemTxAttrs
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
Cc: Diana Craciun <diana.craciun@nxp.com>, eric.auger@redhat.com,
	mike.caraman@nxp.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UDwUMtwuedkp

The PCI requester ID field is 16 bits. The requester_id field
from MemTxAttrs is used for MSIs to specify the device ID for
the platforms where this device ID is needed (e.g virt machine + GICv3
ITS). However, if more entities that uses MSIs in the system are used,
16 bit is no longer enough to represent the device ID. Increased the size
of this field to 24 bits in order to accomodate 256 entities.
Also the name requester_id does no longer reflect the content, so
the name was changed to stream_id.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
---
 hw/intc/arm_gicv3_its_common.c         | 2 +-
 hw/intc/arm_gicv3_its_kvm.c            | 2 +-
 hw/pci/msi.c                           | 2 +-
 include/exec/memattrs.h                | 4 ++--
 include/hw/intc/arm_gicv3_its_common.h | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 9d67c5c..efdb1b3 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -66,7 +66,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
     if (offset == 0x0040 && ((size == 2) || (size == 4))) {
         GICv3ITSState *s = ARM_GICV3_ITS_COMMON(opaque);
         GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
-        int ret = c->send_msi(s, le64_to_cpu(value), attrs.requester_id);
+        int ret = c->send_msi(s, le64_to_cpu(value), attrs.stream_id);
 
         if (ret <= 0) {
             qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index bd4f3aa..9006907 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -29,7 +29,7 @@
 #define TYPE_KVM_ARM_ITS "arm-its-kvm"
 #define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
 
-static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
+static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint32_t devid)
 {
     struct kvm_msi msi;
 
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index a87b227..7925851 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
 
-    attrs.requester_id = pci_requester_id(dev);
+    attrs.stream_id = pci_requester_id(dev);
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
 }
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index e601061..b13e1b8 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -35,8 +35,8 @@ typedef struct MemTxAttrs {
     unsigned int secure:1;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
-    /* Requester ID (for MSI for example) */
-    unsigned int requester_id:16;
+    /* Stream ID (for MSI for example) */
+    unsigned int stream_id:24;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 1ba1894..6140fc6 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -68,7 +68,7 @@ struct GICv3ITSCommonClass {
     SysBusDeviceClass parent_class;
     /*< public >*/
 
-    int (*send_msi)(GICv3ITSState *s, uint32_t data, uint16_t devid);
+    int (*send_msi)(GICv3ITSState *s, uint32_t data, uint32_t devid);
     void (*pre_save)(GICv3ITSState *s);
     void (*post_load)(GICv3ITSState *s);
 };
-- 
2.5.5

