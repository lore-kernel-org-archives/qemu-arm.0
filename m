Received: by 10.25.21.156 with SMTP id 28csp958566lfv;
        Thu, 28 Jul 2016 12:02:42 -0700 (PDT)
X-Received: by 10.200.51.34 with SMTP id t31mr58533412qta.61.1469732562353;
        Thu, 28 Jul 2016 12:02:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6si8951426qkf.216.2016.07.28.12.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 12:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSqZt-00045c-Nw
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 15:02:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYR-0002lz-PT
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYM-0001w8-QP
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:10 -0400
Received: from mail-bl2nam02on0078.outbound.protection.outlook.com
	([104.47.38.78]:30336
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYM-0001w1-Mt; Thu, 28 Jul 2016 15:01:06 -0400
Received: from BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
	(10.152.76.51) by BL2NAM02HT228.eop-nam02.prod.protection.outlook.com
	(10.152.76.231) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 19:01:05 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT038.mail.protection.outlook.com (10.152.77.25) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 19:01:04 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:46909
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYK-0008JV-3W; Thu, 28 Jul 2016 12:01:04 -0700
Received: from [127.0.0.1] (port=52197 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYK-0007od-0D; Thu, 28 Jul 2016 12:01:04 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SIsIZd008166; Thu, 28 Jul 2016 11:54:18 -0700
Received: from [172.19.74.182] (port=55034 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYJ-0007oa-5E; Thu, 28 Jul 2016 12:01:03 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 12:00:33 -0700
Message-ID: <e047c338ee981a61afd7f765a317b3de25a4f629.1469727764.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469727764.git.alistair.francis@xilinx.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
X-TM-AS-Result: No--4.237-7.0-31-10
X-imss-scan-details: No--4.237-7.0-31-10
X-TMASE-MatchedRID: OpZG7Ha4m7C2jsN8aguKvGNW0DAjL5p+MyouZnRyPDjfUZT83lbkELg2
	PcpzvEciLPVFwhmBX1vibtj5CZ7LrrvaJG+XDhc2ngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDUAc6ie4OhFAUAwhyW9fj9pv6FRRFsFSnkaRwsb7+ExdglykIfybt8vIvvUaX8EhoJUhC
	IxQJNVwfYEG0wJP64LlzOfX5XBYM2ZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(5003940100001)(8936002)(50226002)(356003)(47776003)(2906002)(118296001)(85426001)(77096005)(7696003)(19580405001)(305945005)(106466001)(64026002)(50466002)(48376002)(4326007)(36756003)(87936001)(7846002)(189998001)(2950100001)(33646002)(19580395003)(11100500001)(50986999)(81156014)(105606002)(9786002)(8676002)(229853001)(71366001)(586003)(92566002)(5001770100001)(81166006)(86362001)(76176999)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT228; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT038;
	1:vXcJQa73SVrNSp1aiqJ08NPadlT2+o21pFmFrw3M8WyF1ukm5gNXXKoeLmGubspMU0jDTK9pluCkRFMMwbImQvDzRpprS5GGTDaahiKZzNXYOxdGmb+xWD9bIDny9WGeidmXP+t7rh5kZJtiZtJGyVj+nSLnIjlfzkwbhhRZxnYzGiq0+sLMlByhnhF+YhTsNzuAjNoGElwLdPSLS/xbx2ECxgXcIhOW9qwOvLnuNTMLin6xeVjh1fdd4SCBwYH5KFf+oAeYYokit2TYX5rR32PfRABWhUjl5+lQdU2b+AlEbAyUy6zOtB5mJAnuHRkK6uvdr0jpaypB0Sc7rsPvJQM2ylyhEjDLcvOtdWIq3IrBjW3nF4r7SzufNHfpC8rRC552hjwNXeXgev9W/MZsZz+uW5Da/+Fcul/SO1K/9I2C046y334jeeT2jNUeFAmWYvTylFHGDmYWLbJnJPDrcY57GNlHz4N2IhcBPrqxShVxyfGEvHVbffljyf9mfPSOqtl93kjai+bSn90SpHXDXVXIDhLa1ac65Wz6t/3/e9jIslyLrL7O1OqkcUdJ033j//mhZRXTU0jE+8F31gEYfiJH1fEWfGQBLber4+XhlHA=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d52a110f-72be-44fe-9396-08d3b7198681
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT228;
	2:CkISz0Wp2tK47L/kGEa5snIQqoNE3gkziNsl/eiipgkXv+3pkUcii3XN7VFksD1rzz8EdE4GaueUkGsn8xcXEldcg+laOfkf4GVCCA2WoKfUy7VE5LrOABywNr/Rj0A83hWJ2usykFLvsPeQXRBnaF6lqgzTzRYUvOXWIe/MsLC0TtrhkyTWiuFYdqVbg4A9;
	3:jOHd4qiQaU4sO4VCGstEFwNkMnzhUMi9fyXWvoIaLLsJKgD7ZorBaAOpTdTZpsiVgsWYeGF7vLOuHN/YSy77NC8k5OKC2rCI6i28s71JHG+ZDXOfSUW3rxaR3VneSWlxBkE1AVDfoI+B6J/4EpMZayioEw1pZiySVgGNYwG7hw/cfFKmpjDS2f2OFm2HTuNz5UyNDBqn9B2CD5kXH1CFwKraq009unxvWCQtye5DeUg=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT228;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT228;
	25:V0n7Y2x+kXs2DpSuSNtPzCFThcpR7Ejh25ULJL5O5AkbXelsyoEKS1HgVuGzSYhd0p0fmgpV/2QXvp3l87f5ZNTC7L1ZmUWL0E5DDQkIH2Thtnl9uyQWXEKVW7CXSwutS0uzsJSRHn4RakZ1s17VwKsDizeT3+mLboWRTEENjP6Z2E3WTVQac8KlGNA83BxD7CAayntf8CSXL3iI/rtfGjtJB+rkbIznLKn7xLBfRZT9IYRhWY/PWnn6Nwrb8Ky48CBQPoIuGyyJlI9VfUQ3RGStHnIMNV6s31eFKIIz1faqNZ0/JbgVYcWggihbxowKYW/Brs8DUlB4SIgUMKRg7v41c/xcHzmdyVOJf5Fr6RBkOhrzqLjjj4ZXPkaiYUSD88fVsmq7rkagDnSutdTAuGmQgu5xeKqEly8tIU/aqP9fIG7l5JwpyIuot0d9C38IGRw3XB34Zdu7TM8GlNEC8rAmbrMqrKr6jwhPcjgYLPm4q0MMcpaI1OqFdreBj7We2c+mG6jdl/RonhApzkR7pCD4tTI18ntXIrDRG+8o5eZZM4VqnnNHiaEW9BDRHxypKurL+ZQU/SWT2yShy1Q5LM26WysIE9VRxkYaKliMQgetUZHFdzv7rbFlgjFLODdM8gPPvjBB+AH5jbBYW6XIQxp0qfxrZo2l0U6ROAPjFutqFjDfrFeDix/jkD+UjfI+aUF4gXBysVYwkWWxoBnM0HTDbL+TpoVvJGA9vWYiKJAjI0PSHlDcJaN+dr4enUPOR9vuTgnsR7OPGpaB04TEkXW1t7NSim2q4O9vC8BW6CI=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT228;
	31:DRu30+3URcwRwqAOGW0zKqQrVijYPiPND4qt1TYrY3d9HoO50afFDCJ1Gyj5wqfVZuJ3bVZdlmjnNeHpZ1kDi1vOxQtsYHRRvw6CTsUbBovddd/Qzb23AIZlGxePy4LsjeMxAe29AexvqhbYTx03aZvnZ5MkWKGP5Lp5T8frbzT4lG6Zwd/pLMKqkV5ziHGdkVn2iywn3Mra/bae7/XX9MZPTFMjtZq7LDRLSJ8JTzs=;
	20:163Jtk/iMxcWCJ4DMD2fbmaitdBKf0uVsNyeK96VkyfqtE0EI5XyzQN+s6Ya2Nc3xnRtEl38ULurz+CWePdu325t/x/0/773gIrOVcNVbCdIJsxGuBxFbGrppMJeCf1au4wpNzhs78JaAmuhU4G999PFtjmv8AT2H6vWCLsH1uveUNqBjsX+nji05y+qWcIWLFGtVcGI0jl/nbJTYh0CVV6e9qUHsL3Lv8yfdL9bqUlFAJ4cZ1Mg5LwRkh5nr7OuJv+2kosXN/+0ErR8ornOCsx5vLgMn2Y5x9koOKJ5nXTkGe8ovAqmbfi1fwhCcQiOFhR+dUuVVIfYu1M7K0EBFA8OQ4a24cVARs4cLnwzQitwKfSgs1tbIx9BykbAW4zvI3v/+ueAXXhL98fYgQNOgLoK5LF0cIRWwI+97iXYlufzwTAK+EPlqHCXSuK0p0wzrt4CtFjX6Yeam65AEUn7J2jRGZ0qnC4UmWlqzdF8hxACuUnjE5cC8GhMrclLNxN9
X-Microsoft-Antispam-PRVS: <8375c1b6f47842c39edf225b505946fb@BL2NAM02HT228.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13023025)(13024025)(13015025)(13017025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BL2NAM02HT228; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT228; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT228;
	4:EosXbKzbQDs1PNnKk2I5BaMMyE+k7tjUf522kvoZboheovhM1fqwPHtiiPoGrjyl382jbyv6TmlpYIi5fXkZUaSqrGcm6e/sZnxxzppDEbSe+MBkZp6vYdKTpIHhG881M58uj65ufu+df67I8rBDhaUPtxa1DjS5umJjaJSETphWmWN25tXZOofjecag7bJwjc7RHWKn5NpAAXvkXCwHytZEFx7JkZHaAqzijoZISFx082pTCmEUDjGFLqeUo5Ww32aprPYaMUSee6GSLoZ3EXX4TYeBS4ryelOSlwh0OOXbOgvNHqyO3NXdY4WQZ/o/9MRj/IaDBnJP0S6WNrB3TG6w078WKSv0EfRHU2sJfqC7N+i0EW3B+LzEE17Ntx1q82VUYETLaBVlebVP6UTzaSPUVn5Hkmg9rziHO82Ffhpo/m0unDMLCM4kHmL3mTncjWIYiyiAolRbNV9731VI9ADifVmWFns6DYd9ENlt4BWHmPYwDDFbTEE0hE0nw1UIVhV6s8F/0eA7G362is3G6Q==
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2NAM02HT228;
	23:pPDxdjlBY1DvH/2sTOOe9WENrSVQ1JDdSh+16sMuP?=
	=?us-ascii?Q?TC7cM/0GrKkXitzZiZSd+T/8wmWeKqniwoCUSJGz8kI3TTtbrlR3sbIkoZri?=
	=?us-ascii?Q?hnhpbSOhw8UVQg25UGAeIEzxNzlfgG8y5Z9sQQfuVynQSL8IU+PaXuPgM8gS?=
	=?us-ascii?Q?1GCJ51m4eXjsEo9HxBGV1FGVon8f10NESsqn6kSn2kXol/LhvO3yXRjIoKWE?=
	=?us-ascii?Q?aPjP2B/d/9KgtHOt5W88x7oWPOJt4/fByXh30JK+6xac1vdFzoc074ePxwJc?=
	=?us-ascii?Q?kRrSlGJ4KADMa4qXZtL/lsIlGUi+OrN3lauK3kX86xmtUGhumrEWJ1BxNePt?=
	=?us-ascii?Q?hquHhPap7h9SGpfrn9C5URhZZBT3WVaniNrcAtwZ0nIFQ1L375GZ5I+yrh82?=
	=?us-ascii?Q?uKAzQdNP5BnIbb+UqlD9JYf5jYNcz+PBIuE2d2Yu7yRUjewVJ89OP3PNXUpp?=
	=?us-ascii?Q?QHv46wDhzfAJX3uhVpYzJz5cXkJSjOlwwjFYxOhilPiI+gXW6AvQXt4OJgmX?=
	=?us-ascii?Q?4q/4XWjGZQEPfdHTNtWPUObib88KbJ5NTGVTLKiMArFX7hfICrImvGTnQLkg?=
	=?us-ascii?Q?JX4ExqyDDiFMTkm3E3C20VSr+XozP+TN07tE4PpKb0HfZaoPyBypwF/OB51d?=
	=?us-ascii?Q?ukQ2MgIhc+2I3jbqhI4W2rrRVO6M0ecYbxlI5EEEma9u0Zu7yZh+SDbQ0quh?=
	=?us-ascii?Q?TW/D2OqXuPi6kEKruv56SNROIZlVk49jCIB/AnjUNEQkOKEAKtvmv2pjFJ39?=
	=?us-ascii?Q?yVF13hfrD6YbDhdlKYjYnuAJFIvCgZ0Ov6aBzeQqN4Ffy/nOWN+QvD2/AOKj?=
	=?us-ascii?Q?el6VKPwUcnR9RGK+FgEHwODC7GsqwTK3oUJyUYK4hMqw0Csi7HdaWyf2Rpku?=
	=?us-ascii?Q?pQNjCq60MdxZ8yYRpJwEJwXyKbkjSliZ0gxprO4XdPrmg0R5oJtEGDk1Z/cb?=
	=?us-ascii?Q?utHsePgI/Ldi4IMy0rjs6qtw4pXWVe1T2l42MBNoBa26+a/EZJflL7EbKSQ7?=
	=?us-ascii?Q?rcMz0dKhf7Sm1WmQ2v05S8HMDSeZQF6mEY9EB1Ri0rcruRvnb9YDWFX/Wgu7?=
	=?us-ascii?Q?/eSp0q1LnpgeZN9dZrDYOcqkpaGXDRaeDyDeA2H3nTvVQl7304gl0b9wJ0SV?=
	=?us-ascii?Q?ig/mqicJunz4c7C92l6EbbrFSENNlH2SFwv41RTCq4RRuTzLsX/PQWuy2ODV?=
	=?us-ascii?Q?lUyem9J/b/eUPw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT228;
	6:GDt/m+/87LJEFXI5Dfo6NKoYHEFgB41KI8U3TcXYqliygqZfBQ+Qr7VM7oY9jwa2MkdoMdp3oNTj7xpiVE/yrebepXyuMmTk2Mh/sG62rKhc5zZF0L2TNBkyM8XEB+Hk54NlERw6nUtYL9mchE5cjnbjnQ7Hkh6N9nQOBBfGJ+TFERFUIrSDSmuccXDBaCDOSoaTqg0RfxHzyRm6iIfD+ZwNmkLjmFG53Ez9yQ7tIh77iSdLemnyj2Y243Q1O+XzSWbYXqDyc5V2b5XxhNSqe5MhqAEWoKQaFa8fq5+nxbCEv8tILXiIQJoSRWmWnpz2rB2Benom0Z/CNAnUrVjDVg==;
	5:7pykrEOuRLrffg7nrYsLlhYetW7+s1Iajx6zZ7S3EDuZ+xJh+625ft5brxGuuY8KBmJthI8ClVErMVfgvgNHYDPGx4JO0DEuAUip2Z7OZhxFLOFRD9uxYfRTkeydUJx1dzJ2obLSDNcVzc6m+wAvQA==;
	24:BTsdh10FSttXgx2QN/Umrm5KhHPHWUEyP0yveYSUL9nWznoY/WmdfDEPT0Setp2oTvvwN+iDUFaYj1XtZ8z3uxB9xLQK/pyjJjINQ7cp59k=;
	7:ILSvHtPC6la57rlxnhEITzTEkkfRu+8r+8UJyMLXJgIOe/ZJK4k9ISmzJlhz6K4fWLUp+B9KtBU111QkmLraUmluaemV+pVGjtUoFoLOcLHrzBwbWfVV89lJzXiggXIpJDN4ax9V6fuDgsiERsgGe7FyD3QO+bJ+luiCUVvqsz1berm6EV/MBInzXqBZhS1AzsPlnMGrgjB1nvqlz8OLDC3KXVTHbjj7N4wnpfwAUO283x33sSvxpJD5FoOOwq59
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 19:01:04.6201 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.78
Subject: [Qemu-arm] [PATCH for-2.8 v4 6/6] xlnx-zynqmp: Set the number of
 priority queues
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b0zwDa15lh2E

Set the ZynqMP number of priority queues to 2.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

 hw/arm/xlnx-zynqmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 23c7199..0d86ba3 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -332,6 +332,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
             qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
             qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
         }
+        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
+                                  &error_abort);
         object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.7.4

