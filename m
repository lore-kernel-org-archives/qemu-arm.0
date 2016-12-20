Received: by 10.103.86.17 with SMTP id k17csp456517vsb;
        Tue, 20 Dec 2016 14:45:07 -0800 (PST)
X-Received: by 10.200.46.129 with SMTP id h1mr1719232qta.277.1482273907019;
        Tue, 20 Dec 2016 14:45:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i128si1534069qkd.118.2016.12.20.14.45.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 14:45:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJT9c-0004iN-BA
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 17:45:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8e-0004i8-2H
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8a-00040Y-Mc
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:04 -0500
Received: from mail-co1nam03on0065.outbound.protection.outlook.com
	([104.47.40.65]:57952
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1cJT8a-000405-CW
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=E6pWfx1RAiyabFpzjc2pqeQ2opmF60z8pSH9aJlUIv0=;
	b=nM3QYGLM2T+nVom5xDB0dHoB4hBqVQE5/3uF+QjDpPUlxUU82aM35ZoC9Ecv3o+DrPvvtU/Ef0BnUBpW8VXxSAn3KuZKhza1Hsa5WqU620W989ijorxYcIidxXC777hFakijJVQa9dpM8/Qtn8c0rpsRgvuy6Bj/NtK+oLOA/+0=
Received: from BLUPR02CA046.namprd02.prod.outlook.com (10.160.23.164) by
	BY1PR0201MB1077.namprd02.prod.outlook.com (10.161.205.14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.789.14; Tue, 20 Dec 2016 22:43:57 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by BLUPR02CA046.outlook.office365.com
	(2a01:111:e400:8ad::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.734.8 via
	Frontend Transport; Tue, 20 Dec 2016 22:43:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.789.10
	via Frontend Transport; Tue, 20 Dec 2016 22:43:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8V-0002yk-69; Tue, 20 Dec 2016 14:43:55 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8U-0006C5-Vp; Tue, 20 Dec 2016 14:43:55 -0800
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8P-00069t-FB; Tue, 20 Dec 2016 14:43:49 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
Date: Tue, 20 Dec 2016 14:42:04 -0800
Message-ID: <b9c61e0c893b6215531ea210e566c9057d28c792.1482265908.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482265908.git.alistair.francis@xilinx.com>
References: <cover.1482265908.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22772.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39850400002)(39840400002)(39450400003)(39860400002)(39410400002)(2980300002)(438002)(189002)(199003)(6666003)(81156014)(2950100002)(8676002)(189998001)(5660300001)(36386004)(76176999)(2201001)(626004)(81166006)(118296001)(50986999)(5001770100001)(50466002)(50226002)(92566002)(48376002)(33646002)(8936002)(9786002)(106466001)(63266004)(2906002)(356003)(305945005)(5003940100001)(4326007)(38730400001)(77096006)(39060400001)(47776003)(36756003)(41533002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0201MB1077;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT024;
	1:naTdnQxI0r8p7vY6FDByTLEKmJ/xZqdh6A1EqqKfQFMhi8kn3X4vJhT+MCQsRq1xm2gWTBUy9GimJmJCepztSAyTxyFyvDmo9DkiAZ8YOYXcAN8dsNszNiG+lrwa2+G/uLspnLqMPE2veePOrQhL2WOC7gG4m9lrYhoMk/7yfiqAZqTZHUKG1srMNdqgqOBIvHarwxoJwI6+NWcDg+qmj8eaXdpLJP27KUXElaG6WRhL/zWo0IJFoXQHXoKf0jMn7FqbnMgxIf484PfVvk9GssEk7TH0kDR9oqoi+kggMN2i7rrNuT5IRnSLfgCk7Zv2BqXl2V+/sVwDcqsMVhe/dT1E6MxU95KmcyU3bfJevAqQkf+iGBMHMyzaveH1KEuHfhS3AQ7akvUxUZmhs4ntwpQ/Siufk9HMsIRzSP6cCJblEIaMPLdK4LWrjGWl1O4VHrd9n9KPKxcT9BQf2cgOiEPahYIueI18KMzeRxENWzUBChBGGXTycLAgmunImhzs1V2poNkJzZi67Hx/lbjmgW7D17eE5iOrP8wC4AsXq1D4C/FORQtnKc/oBJlu/RoqgrxcuGpKnVBVCbj67tgtSQ==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 03f59f54-9080-4880-f12c-08d42929ae51
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BY1PR0201MB1077; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1077;
	3:C9QBum893WyKQVe0a7KOp1hmorJbR3Y/jwBrZXG+aIzQfDLqyzW0qRRwmNUWJnG46whPBggy2Hcii2IQOg8pnOg3uvBKBSDZGmzS0MZlGHSXJ4CQdHezZsL5BgDhoSnAeEC145ip+WfbSKsGelHHs6MXvRoWfCRjYPMVXlY0/IdxFo1urHGBckfo1ao8nMHJazpnO7afMLOw3o8v7kvYifC8YlQ7IklEkcBpH1qEU6FslAPqnRQl/t67E/vdL8IoiEzClItr9/t0OpQ4a0+xiFeynwL9He0WnqU+qotfZ//RF7rqZc2VgmWs6Llo4osHlLBUcDQHdwasADf+h9dt5hEJNnELkDF8nC8hcMi6mJ/phC4r63BoN8w/1RUKHCNgASo6Hn80A62MwcgUWL4WQQ==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1077;
	25:LZSJKpCiy0dDOIsAl8pu0hLxUDHrqx3RGza+HHYUpC6maGTogY8bAqBXQ/iuQ2jzqk6WTw7Zf72uKjfCzT7PYzpNX0jd/PewU7Rvob5PUfZWf/yOva6mC9IzJV3apOFbjBBYnD5pcDnVaRcqqif62OXM7R2VLS4/t3pqV9fyYHzhI8BljdFxcIRCXMbZ/36+zwUPekK3tTfm7HbjUivxJyP+/YV60caL4tg0wnY8fWDe1NRWPVUB10V23841xKTAW+d6higSSZAhHm7eozVaHKeWEaAFy6dR80Yl3ELOSTNVkRUSJXPRgRA8Q8gsx9NvOGJh+WgXP8gfBSklC0XogRJxtzIWvNhl7pk2RXfxTKXlirc2x8in7irx6SLBRt5XvMF4bzRIITzcicS5oSzvt/nUIykyTwYLp7fJtPTPSUaO6nNLENNp49PdwPUlCzQY4o7+zPwD71VoO0E9fJw35vpugLsj9v7dNDMFxheeCmmq+7KIQKCdbZweX+uCdNsQHeC+a62Gz9HbkT/9a1C4/s3fNzufIPA5qWdhNCJqfF365wryxmYp3Z/HlUZK7f5KuzACGgNU9bw2MW7eZiNyRSds1OvJXyp/ihd64Kz1ivlVYOIjGUvE9TiKS/cNjjqLR1mzGkd9rvWAt5yEcukWAzZ4AfTr1ySTfgOfj7V2Zhl1yry5845OKUfqBBa21h1g8SkZm6iqQOqlr7tU8/XAfmWu+P73JzJ160ZEEQap825IjcohBsxKBlNRJ+qLE1Q8Nsy/vZVPxe8AkIFlRzlZMxDwVuP4/Csnzdj3KQOvFwvswgdmd7hYn65OF8OH1L3i6nQKuBh6DPrQX1amNZInMdhlmGlW4X+Ht6qXkcOISDg=
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1077;
	31:duNIiWx2E4NuRprAoPDyZF9iQuBDnajyXCkOkeZR6dnO5KMjMOxlzhnSlK5+y2g6M1CRFwSBRWoxYAvCdYtC8+Ga8sNK0mFdsmh/SrixfHZZB7/n2GXhdP9KoaoZDd5J3MKS+yaNtAvug0SAt9ZalAVSqThy/5qP7MDL8w93jzSP6P73bWQley8moiERcq1Y9/z6D++FJUpgJi7rvWBRSP+MZvZn+bNB1vO1qTxlmx3Yoptty+5lZg4V2uBTgVg5YqOhso27PDzY6IkhDPXe4aAX6/G53H1nGoO0z2q/gMQ=;
	20:YmnDZCmIUh3uKiMm9laLzPzOVtWSt2YkFbDqTj9ft+9bCW0yxnQKdyrWVlMoV5lLEPMmubtMsmlJ+XUUsBhbaG+l/6ZMnFGE0o+PBZFzR1mCUmI+6EJFbJvgRDp7d6tB5YamMUgDFs/mri6J20jxQEgcS3yUaiL+sRMfD8+w3FwCg4FPm5UCkjt9EaxcznuphPB4F7pFLiby5UvgCzj3atS/fY8QpAp4SXZMfTYWDytBXvOgHoD5+0H3SPB/SW/Jm7D4mp+pu4FdJgMHtF/OsZVrM168i6xGKgwFwrfM1TrItCy8FjeVRMR0mjKi20P3gGjmohV/4BIc5xPBpjSvKoGl+2XjtJoyOLYXFICeom0oV0TBlqisKP6SSscktNF6a2nFI4zAZpF2IRH8ILxQYX52ZiNMWPg7fyrlk33lrXl5XVsuFDAz7c94KlcmLQVu8FWuLIXftIpCZl2Pqb+rpCCps3IDHlzwoVV++Bbbn6tuV7t2qQYlv8dcADwBS4aa
X-Microsoft-Antispam-PRVS: <BY1PR0201MB10772C8B02CC420F59EEAB91DC900@BY1PR0201MB1077.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13023025)(13024025)(13015025)(13017025)(13018025)(5005006)(8121501046)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123564025)(20161123560025)(20161123555025)(6072148);
	SRVR:BY1PR0201MB1077; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0201MB1077; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1077;
	4:+aUMoRMOGyixPnUViNhAsuYhlSNLRJR8mWAUKa6GpIRlohGvIttkX4WeLkK0r2RZO0ih2J+NJ2aTTTVV/qLg60/S7CvWUH+BV//wGHoXT3QRoayb9spQFoW2aXmaeJUrCaoZ20Q7TIAB+5uDoLqpGXyRaU7bIVsoV0JzwfkcJYS/uaD7/RL7knGXOsWKh9rX6AAAq1wy46NDJboLlKZyfLqiz0SVAPS7IRON/8VRiSrTHiRgQ6v4XdY8g+KLCwZZOa+CZGevlluja4Fann5Qbl5uHSJC1DJIX4gjzIFl3t4EJSpVidX6cglKOGtT/apU5pGX62tuuB4lIACrP1UcNeLAQ/1QztAohdnzQE5hQPEDFth/JrXOBk7fBeJiC1bDqUftRms57U+xif//HYiyPws/MPC9CovPkjzxmeVV1GK0arAqRxqT6unHQCpIlLaT+M8IE4HntM5S3vPTMMa9f6S4PerfOLVzH8/8vnm7fb9oH/giV346BWXroHiFVTx7f1B7WK1F6Mfk1bNn7ex+3Lj8+pGQZtcu8/ZBNC8d+AxEsCL7Gp3fJrX5C+fG/0VdtlxjzGvjzlX/uRORFfF8lenVsER7l9CssS0RUJZlJvvXf93F7WqHjFqWBofivzE1LNHBeuP2xt1nv2lZS3StVIWiJjAhN7IW6fWkIIAVmOpc5o9tlrBvzihtSfFcoqf0NpAVCx+sWWHFxo2EjPb6EYnHGDsYM1jF+YjCm5Ps8qk=
X-Forefront-PRVS: 0162ACCC24
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0201MB1077;
	23:q4kofNg6d7dtgRWpoCXABvnHD31dRX0ZxLyCuMm?=
	=?us-ascii?Q?aL1yYJNowoYLbqCTmmAn/t7k1NGaVy3U7AK21d3812eiHMTWnAvYolGJ46Hw?=
	=?us-ascii?Q?yRQg6GgCxRW8JrmAecLhHIBN1OIdNf+p5BkojnTBnY6LsCoSdOWrPWwC/AcJ?=
	=?us-ascii?Q?2UMSL1WBSgFczqQX2YvkkmZjMOvR5oiz3S8xbEEEk+55LHR8oWFZcIV/TmNl?=
	=?us-ascii?Q?gq9F0tvhrDqOX9G3p/H3AF1orQymAQ3Ws+ELtE3kxawfqqPPRK0CB8mH3IgE?=
	=?us-ascii?Q?9qDDqQ+cvL5lSs92Wd7V8Y7F+l68Od2E/qYt0A0QjXKojfCjYnUerLsGVwWL?=
	=?us-ascii?Q?RipqXzeDzrwmxmoRN9q3aZqrCRn8rYzzbcba2ChdvNWDNsvNL82h2N/J/Bef?=
	=?us-ascii?Q?PgtDFJK6QqWT5FNa9k2AhMaxfKIGB0Jb89WEMqVQwj9ojbCaXrK8gl/9ufny?=
	=?us-ascii?Q?biRzvEVOfPXMPojLo0RlOx1w+ALNGLc43+vh1wnZmipsNxI21NaG0tbNOaw+?=
	=?us-ascii?Q?q9zW60cb0Qpv9UnRJIdQM+zRmLOmqbujv1AX4haCFkrHu+x679/lDx1qkvnt?=
	=?us-ascii?Q?0M7B64UPi9vGA1XS8aW7OH9c4lDVqEwDbvLGkwYh3gLYEC8vK5oOIGTsqSvl?=
	=?us-ascii?Q?QH45wBcBTjkwzEXg9cnonqQMV1mqZfUQbZS/RO2l7WbLdnzL66PF8FAsAn88?=
	=?us-ascii?Q?zeK3Tsu2HAXIcuD95aN9/yl5CPzQU/n2y6XhQE25/rh7Y+AxDqZZVMaXHhDT?=
	=?us-ascii?Q?hH6QPBloxlcmGE8/u+JJuoDKYf6P2BUpSLe+BEVO3ZSz7j5mt2U9o7rmHZd8?=
	=?us-ascii?Q?HJ8NHpx6pk86h6Ur1SouxiWPN55JI6h6sqrtOl/AM+9+XNMuW4YtljNzQvAb?=
	=?us-ascii?Q?RMXpINBP/mSAICzJEk06wESbk9vy4/bmuruOY8VgRHzo4+w54F+OZwcf9a6h?=
	=?us-ascii?Q?VQV/RgQwnpcuH1cwDFMIzBgcOX2wiLzNaPmrmosiL+6HEHoWYqXsewZHrTri?=
	=?us-ascii?Q?u2JHAlnwx+K7vSSuVgyb2jeq/2FQRxloPtbReBlclLOci5+MJj2bjc+uzZ7g?=
	=?us-ascii?Q?pK6iM/n05CAbblZFg1p6kif2kjnt7PEhjCEoIIhlH+u7wUyzJ6YUa3+lGsFf?=
	=?us-ascii?Q?Rh+Iguc8Ib65YbVQPI+7lCpdaBzA5B8Z5?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1077;
	6:uF8Q4pEZAUbBQx/5kBoBE7uKq/Y4fjDIYuJWEXYy/9th7aqVeISqJrr0U82eE8ddiV4szFdvGr/lEGN1x2xIQQKQj5xorzf20rCzkq8UCq0k/X3N4TrCnGWy5Ft4ycwE9Kfm0zBLWpmV/Z8HGRxhazW/wXJRjvvZgbpNcM3MCQhVCbq6+VVMQsDjgK4PyCtcNQ+Fe0rsQg1tu8jkyZeGJK15Q8oumQL5MezlMvlPI6ndKVhGI8a97FdD2tbz968GAAny5VOIXEEtzO17sMBQrlzp66J7SqY5cSJvizREBIT5awTUr7R3NA5X6bSAVpkFZED4WqZBZfcLOwD6qG1JYlQ4c1DiNPGicYpLy2K7UWhawp+l7s0trijoUbckMZVHVNSrA+sjjGPdcyzMy/45b9TvmcY3Yn3rB4nRuJisdzIWhd1h1+Xg1uGpV0wQ0FhZVwhVcF8SYS0RwNcMx3o3ew==;
	5:1Cl5LS34KVktB9LEVlYTZ8B9Cj9WrM0lUznlGcoc4NEp8U6ASW3FnGco2fDFmGr3Rs240Nyp0Mhe4DLvRbKP/OpFkin77kEqQWSrmIeN4dzvA612ss4/nxlHaFE8hHM1pg4NfruGrcS3JCwhUf/5/A==;
	24:RZ2gJbx+nNUrOaO4VuHOwjxL5w41JFpLtiJVCL3gqvS0YQRtE5Vjo9ryLJQtwYw+Mv0yfBRaUTs0IzqwwaP7YFfbpIv1LyIblD0tO+GcBPg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1077;
	7:AaGP/XrcXP30f5vQ2J9vRq3qxH2ppresdnY9k2xouWv5xWMrqrxgRoUj3FLbjlRNCXLnvmh7XjRW5dhluafyHJXQPuOhXty4SA+AOqlbKE1yGq9sgxAQjdjzq3Om2di57uSUODmeaJjCSAdhaa2XbT4JHRhbHe1yPPFO5NuRnyIqKn4g3hXpUEC5qxD6vROQ2SkZtb1ZRUiT6oHez7j4GYAF/mRXR/r1QejPgkWJE7uR1gP1uDoFlGcEpdGBSbEZW8reftqgPCqnD+QiUQabPEzhQ5Ov701OSDRGwqpO68vfzoKij+lWAkpJECqLnuQoKjKa3wTQezdDP3GqLu87LhlQ1/qFxcdE8zV2mIVwtPmYr7Z0Q90VJVa4kiBlNYTODt5hdTUddvRVMGUeaz1RfaNZ8IXmEi3kp2QV3+6g/UfvGSKpmz1tLDiStjE3wZvr+zEXmjtp+yuUyuSQjF1LnA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2016 22:43:55.8429 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0201MB1077
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.65
Subject: [Qemu-devel] [PATCH v3 2/3] arm_generic_timer: Add support for the
 ReadBase memory map
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8B80B2yI0FtX

Add support for the read only regions in the ReadBase memory map.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/timer/arm_generic_timer.c         | 27 +++++++++++++++++++++++++++
 include/hw/timer/arm_generic_timer.h | 12 ++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c
index da434a7..5392657 100644
--- a/hw/timer/arm_generic_timer.c
+++ b/hw/timer/arm_generic_timer.c
@@ -100,6 +100,17 @@ static RegisterAccessInfo arm_gen_timer_regs_info[] = {
     /* We don't model the CounterID registers either */
 };
 
+static RegisterAccessInfo arm_gen_timer_read_regs_info[] = {
+    {   .name = "CNTCV_READ_LOWER",
+        .addr = A_CNTCV_READ_LOWER, .ro = 0xFFFF,
+        .post_read = counter_low_value_postr,
+    },{ .name = "CNTCV_READ_UPPER",
+        .addr = A_CNTCV_READ_UPPER, .ro = 0xFFFF,
+        .post_read = counter_high_value_postr,
+    }
+    /* We don't model the CounterID registers */
+};
+
 static void arm_gen_timer_reset(DeviceState *dev)
 {
     ARMGenTimer *s = ARM_GEN_TIMER(dev);
@@ -166,6 +177,7 @@ static void arm_gen_timer_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     RegisterInfoArray *reg_array;
 
+    /* Create the ControlBase memory region */
     memory_region_init_io(&s->iomem, obj, &arm_gen_timer_ops, s,
                           TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);
     reg_array =
@@ -179,6 +191,21 @@ static void arm_gen_timer_init(Object *obj)
                                 A_CNTCR,
                                 &reg_array->mem);
     sysbus_init_mmio(sbd, &s->iomem);
+
+    /* Create the ReadBase memory region */
+    memory_region_init_io(&s->iomem_read, obj, &arm_gen_timer_ops, s,
+                          TYPE_ARM_GEN_TIMER "-read", R_ARM_GEN_TIMER_READ_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), arm_gen_timer_read_regs_info,
+                              ARRAY_SIZE(arm_gen_timer_read_regs_info),
+                              s->regs_read_info, s->regs_read,
+                              &arm_gen_timer_ops,
+                              ARM_GEN_TIMER_ERR_DEBUG,
+                              R_ARM_GEN_TIMER_READ_MAX * 4);
+    memory_region_add_subregion(&s->iomem_read,
+                                R_CNTCV_READ_LOWER,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem_read);
 }
 
 static void arm_gen_timer_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/timer/arm_generic_timer.h b/include/hw/timer/arm_generic_timer.h
index ae4319c..462ee5b 100644
--- a/include/hw/timer/arm_generic_timer.h
+++ b/include/hw/timer/arm_generic_timer.h
@@ -33,6 +33,7 @@
 #define ARM_GEN_TIMER(obj) \
             OBJECT_CHECK(ARMGenTimer, (obj), TYPE_ARM_GEN_TIMER)
 
+/* ControlBase Memory Map */
 REG32(CNTCR, 0x00)
     FIELD(CNTCR, EN, 0, 1)
     FIELD(CNTCR, HDBG, 1, 1)
@@ -46,10 +47,18 @@ REG32(CNTFID0, 0x20)
 
 #define R_ARM_GEN_TIMER_MAX (R_CNTFID0 + 1)
 
+/* Read Base Memory Map */
+REG32(CNTCV_READ_LOWER, 0x00)
+REG32(CNTCV_READ_UPPER, 0x04)
+/* We don't model the CounterID registers */
+
+#define R_ARM_GEN_TIMER_READ_MAX (R_CNTCV_READ_UPPER + 1)
+
 typedef struct ARMGenTimer {
     /* <private> */
     SysBusDevice parent_obj;
     MemoryRegion iomem;
+    MemoryRegion iomem_read;
 
     /* <public> */
     bool enabled;
@@ -57,6 +66,9 @@ typedef struct ARMGenTimer {
 
     uint32_t regs[R_ARM_GEN_TIMER_MAX];
     RegisterInfo regs_info[R_ARM_GEN_TIMER_MAX];
+
+    uint32_t regs_read[R_ARM_GEN_TIMER_READ_MAX];
+    RegisterInfo regs_read_info[R_ARM_GEN_TIMER_READ_MAX];
 } ARMGenTimer;
 
 #endif
-- 
2.7.4

