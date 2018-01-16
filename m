Received: by 10.28.173.206 with SMTP id w197csp4571688wme;
        Tue, 16 Jan 2018 15:27:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBovs8Y3RXiscgCeV7d2FlKwR8xQGiadJqZ4390c+UWlJRbz41IzT5fQUvL24ciGkmSwdn6e8
X-Received: by 10.129.111.139 with SMTP id k133mr776066ywc.419.1516145249460;
        Tue, 16 Jan 2018 15:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145249; cv=none;
        d=google.com; s=arc-20160816;
        b=vI5yUQM33WZBfjz0qEdlYQi5Fi2vf+U5lJUnWoSRH+i+uUnxpRV89IJlhlDZxt6Ne0
         OAjsXdx9ZNYVf0jq6PAi18ukdpT5ZF/BtZnxJDfoW9nvzDnvKSM+JRczhXPYUtnEvLMd
         t1b+ILP5/LWo2nDpe4WibYjRXtGDBLS+PwWowO/cgXg3oLVOPunA0yWkHtTaEq4wtu0X
         whB8N5DqIMHf1l3LB4y3N4gaDK4aAlqbLrc+tKQl2AWK2TWf8wdyt3LaTJIeG2ZCMBfT
         O1mYuOTEKJphKfeJ2EQ+GIh6W8Xe0ICTNw89CPTqnNIQ5xW6Yp6impNLJhKs1w5o+A8O
         u+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dKqpjIfXwR77cXocdbcs1k8rRLN3mKC/pSSFulfPEUE=;
        b=04Qz4/wmqaUFmn1Vn0iK7QHdveKaFHcGA99/FOQdFi1GneM0AkdVzccHe1GGQlz/Sd
         UHvMrd4W/ehpj/j8TLLyuGuWYQt9nQUyYXhsF4rkBGMrvgunztcnoYVEOo3fPQGAI/nv
         kZu/Ac5t8Jlu6nuTjjjNlFdW4jsR3KsgUWM9mje1DMUqNKza7hFhSxeife+PQMno1bsZ
         tQGAEwEOMqfs8Ij5QkscT0y3q0jMrIWT38SiXhrrcUhgV4zyiSEVPxZZ1NlfP129Ex2s
         YFfopUsNqBRSxDZDF0EX/bL7QQ+B6gYKp2sXh8iBCURp7SjaC9upF4wpMfY2lJDm4v08
         SEfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=zJJtJ39A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si729035ywk.351.2018.01.16.15.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=zJJtJ39A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebadc-0004DQ-Pl
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebad3-00049V-2v
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 18:26:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebad2-0001yB-57
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 18:26:53 -0500
Received: from mail-dm3nam03on0042.outbound.protection.outlook.com
	([104.47.41.42]:16197
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebacx-0001rj-6e; Tue, 16 Jan 2018 18:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dKqpjIfXwR77cXocdbcs1k8rRLN3mKC/pSSFulfPEUE=;
	b=zJJtJ39A3kXyYJ/gHknC6awj0thddw/H9lQIIEk5F7Xnv6l7/OsAydFtQ7+C+AG1SezC8Q6LNkWMaiR/oJgnX3J4ogqJhVeAGP2RMrsOmIlTm+9Dj22JJq8tt03xxObYmPNC9PGCkIIszv3lVGtKrZBPlGzQRgkVe9ToWQHC8aQ=
Received: from SN4PR0201CA0069.namprd02.prod.outlook.com
	(2603:10b6:803:20::31) by DM2PR02MB1338.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7;
	Tue, 16 Jan 2018 23:26:43 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0069.outlook.office365.com
	(2603:10b6:803:20::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:26:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:26:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebacr-0000Md-KP; Tue, 16 Jan 2018 15:26:41 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebacr-0003K9-JM; Tue, 16 Jan 2018 15:26:41 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQcLU030907; Tue, 16 Jan 2018 15:26:38 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebaco-0003Jt-Li; Tue, 16 Jan 2018 15:26:38 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:18 -0800
Message-ID: <cover.1516144891.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23598.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39860400002)(376002)(39380400002)(2980300002)(438002)(199004)(189003)(8746002)(59450400001)(478600001)(39060400002)(50226002)(77096006)(5660300001)(8676002)(36756003)(6666003)(81156014)(26005)(4326008)(8936002)(81166006)(2906002)(7696005)(36386004)(106466001)(50466002)(106002)(2201001)(5890100001)(63266004)(47776003)(356003)(110136005)(305945005)(48376002)(316002)(9786002)(51416003)(54906003)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1338; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT039;
	1:Q6cbLfUxu5lTBPm5uYdbZ3gbDhJY8AH8hYZewf9N/rqWvgQ8EUZT9/ACjk6Z9pvxWEtedC94o9p+dbkHs9IcgdsO23DSXdsebH9pBGa8IYIgRaHjLc3ox/5F32+6b8ka
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f0ebd80-4f85-4e34-6e87-08d55d389a4e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	3:c/I3HO3A64Ii+BGRq33mg2TOdeq9/tMBjFygvhD6aD91XS83r9BnRshi0+AHF7Tgbjyo45i9fddKq3MD/94BuCX1bpJNIbwcpi0UUV47MgOA23aWEnZCR/EZF6hUsjSOwju12Hvq5ceqw5nrQkyeo586i9nqvOZXCgMhAMKqAWkQnNn9lEJVXcc/awPAGZZSp5F714stzNaibE5PyTAh6MCCoB4usWCrWAe06o7UIsb06KbKA/xC63FHAVqZg3ppnMMks+1KsURpa+jXiG7BdAwWLJh+QHkwRAdt0bWsTdCWosEJFgbbI6ZbJOw1H6Ww50Zsfk5dS2jG+H3Q72R2sx8fdhje8O965O0tlYlSDGc=;
	25:gY4XRym6JYXWBgDJJLaUPin2cR40e+e3opZrkPpa/OEcN5yjLJFHw3H4XyMtTuHpHbv/bSX7UFyCYn71RN6E0wAExfsAc0lVWSQY67NYnCR9m4xszFQYeeiWAbz4Cm/ZIqYEUzhEumOYuevL4d5/cLW8xVgRpXLdaKuNhtyxjH/0fzL/7UZX/2Q6HaGekhNiUPmT2VOdd8eVh5yTdbnj81rCGTPZetwBap8XbPhqoOjs3hi3WF6XSF5C6GTgzp4rL3ax6tfsUuPWlWUEdNK9mQqo8/DB2HoMZdx6rsy6P/K4Ts9/aemnOW02KbCZPjLO6kvGAxtKll0a27CbLUggiPemVwX/X9lbu8j4GuBinME=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1338:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	31:UG5hbPrfDXWkizT+81+XkIbO/6chyp4z/cviumTQR3LmOx0W3TxTo9vM3Vy1iLvMduErA5YHR9tcr9wAwVmEllEoH1dXthAZj9t9s3QP95G/2Yg7LLfwWbM2e5GlXkHwsa+48DcqOKmcdg8+PEEfYkh0shRh8JmZ9wldH3lRgEDZjjpZTrk9KiLgIkFJulyM3vG5RAu7+aHHoJfmy/YZefjeluJTBQiB8v9wtH3+69Y=;
	20:vXIRSknPOebICILWm+PuWNrKq2sbRe6rSH7e4syC82TP0jRKyRBSsWd/rOthJIHlsdoJMfFSYxuQ+IPweicivlp1yP7hdQnuuQG9sXK0BA9jE1/0x/AWxUFCglbjBGXNr49tfxrt3uI30EOjl9/KUNuxuPiTH1jorc05v0OZT6evZI8pnEZV5VJTyiwx4cAt7wvHbh5f0RcsFJ9W4i+tOyULqD6WwMqRDrd8qgC6OprT/ioRkM3ZSxXoej5j+marEytJwKK+n63DWQA3j86A97PR30BI7dv9M4Us9gNVRX9wE+pv85yCGk5WYbpfFt2T6CfukyxnLgXUN7sMtkOo5Y98mYH0u4EKiNauC07/KaSEap3jEhxZ3hFlnxFfEmqPC+miU8/2f3qlxQoEr4GvjTiqn5PPe4Puo1HccB0K334V2ACya23WPe1pVKpxBQzzQJSorQRaAO4QFH2O1vEdgBJ4qlM/Qcbl7tPvktFMddSetvQGteA1ve0QHWJsz2au
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR02MB1338A4EA136AD9A394AFA67CDCEA0@DM2PR02MB1338.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501161)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041268)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR02MB1338; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	4:EAWf32yghGgieR6SBA1WdkYkvuLaiLTzcdhaALavAIbiqto8rIZPEpBWsVn4H384pNqQ8i8TQh3y2mmVnUF/hUQrDQhgaSPCZduiqwuqTKAwfWMtGcri5d9a68v2kvkUp/xZIB1MnLDvtRhXqPvKUJEgYjf3RUbrUopmsS4FNcwsLYcoL1/P1+Di8vt8Gf3XVyUArSexKwiXku3poBEQ4xZmIyhN5PPAeavr/WzImrcQFGW0OkP1GOVtm16du0A9jNfN3CCFI/cph9bVEoPaWgI69gklfxzSfTx2uG3n9PJDvmS2smsEIcrj3vV/SzKxOJSCtFKaMJhR2bI0tHq2Aw==
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1338;
	23:YVlE0bM7YyggWe3TVY8qwTVynt1B8ZowqmK31+aX+?=
	=?us-ascii?Q?IM4WdSXT2YW3JVFMBGMdCSW1vC3/KxWJw++Bs9qs0PJNKpYqvBVowBebjVcf?=
	=?us-ascii?Q?AfuDHTwrIcIB7pUbV7ZlUeQpwIDRpZEi+yj+aQAPR0ds3jT3TAIAvOTdZeEV?=
	=?us-ascii?Q?dE49d4SL6Tz2yuhtCmFVCyUnj767JZwNNuwHz2MYwdDQ5uIkVdd3JvT9UAcf?=
	=?us-ascii?Q?CkAwfIYW4QiwufwpcyG8/zJ1hlBcbi4ahQR1J1A7tE93uapSHoQTWr2P6QvJ?=
	=?us-ascii?Q?C1p8W3E//BYkGEcUVsZ03pgkAz78ryEtmBEQXF28mJWvjBj2tqJ6Dd4GbCpd?=
	=?us-ascii?Q?kDszUNbyZ0wfLavdp6kH2VRSG/YSPALNF6WMBcFg2DfbVT85/BOA0OQYIjmf?=
	=?us-ascii?Q?menjWl6TFrdymY1A8FXw+JNlpSWBZ9inygMZe7ra9ygnYRvETszJHcGgM3fH?=
	=?us-ascii?Q?lUWfPVRchWaGXWQXgPwokSQLIE6OsTNVrpHb3SzmuDL3mcdvk5bFeIxyVoLj?=
	=?us-ascii?Q?+M8f68sd3r5IhYjWWwKTqpjr3XztqQs7mbXkqlw3ra+ZIfxCphli80zF9N/u?=
	=?us-ascii?Q?SM83X+P1dZV0VeNg5BBCig3LF+LbWBY2Bfg1aQxrEgQA+iKOgC2B1SO7w+pB?=
	=?us-ascii?Q?RCt3TMcIzPwAt1eV7ktZdP5DZMfB/CcReMvppc9nsOpdgJ9u0qncrhoNCuk2?=
	=?us-ascii?Q?f88bfCtHAGUDePfUdI+LEN8Lo/9FvmcdC1L8H8Cpnw3Yrkzj55t1C6v01UHN?=
	=?us-ascii?Q?YqU4iaeQvlKRHxneXh2F98M45v0WBGWfY+ppx1+lUy3TkY+59SeYwj05foWj?=
	=?us-ascii?Q?Rs9NwlNOSamRvyeUXd7TUG1+XRKI/snDYu8apqEWo/Ps70ReMEpnYeu0XXPL?=
	=?us-ascii?Q?ay0lSniLckvLRImiAmsKd+4xhad0VvMDDolOoXJEzb3T6K8qLkuAdlqK7ISK?=
	=?us-ascii?Q?fMVHSWF/vjaFBrDULiwKV5ZZ1xs0CoMUqwNHvOXKBaVitZo2N/ugjsSMEWTH?=
	=?us-ascii?Q?mFFrk7LhSYqxtvbWgyu5+Cvpc4GykuAzG8bt7vSRegvEA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	6:LBCWLzWYSu9iMIy+HF1bVhMQMLhIjOj0PPaHe98XyzRphqpWmg1OZyPyc7gU/3iPzx0pfaJPL252sn5/352DUEsORfz3biXLSr0Oaq2KlkSvxsg0S2VtqwG8mEmZ9NJenJk1DXlcbAKoJ4uGqVhTAVTZGx4z8qcNLFEg53zYQbGfuiPNwEgyQRiyMkPv27uBZavJZqgRkgUcd/mVbUuUDnYam7B0bzIOkh+1JG7GOfDwrsiDVX/fu/MTekMUwldpO5BHAWeJUjbzvrU0yqrQO61jSGtJ9VkGK9Jm6gVRPz4J8iyQaljTXKzlJoTspTkdY5/A/5Lp/b4P6WGWjbLq2iJaUqD9AxYLLUi9GDeZGpw=;
	5:WQAwt3pY9qZwP9Ty9Pw989VE2Ya84XOTkaAmW3nL29qNxtMWZayNmmRVosHeDd1Iqqq2rDCZYTeQtdbUSIwY1+M3LZnh7AXjlpTTmAVn+AzGcxuhw5ItR0bepJtBXZ8yn3WBV54UzdBLFuBtuuIQUwE5dBmVmvXb4KsB++IjOqg=;
	24:wULp6MQeSI+Ek7/dsTUuJO+wJrLlQ5dnZqALg7806RoXpeoCjdZAcCk2/jn5UBlRMZw3cJP7nBh1KILNvzwsUwKJRWznPn/9pov7jVaQnzc=;
	7:7ARHMm1bYAQ3OxDdjImHuM/xTbjHADAdRXH4TUo7cDQQOAMlRuViFByx4U7gqdQAVuRMb4BFhWgQ8JFXyCbmYso/iwkVna8qSHSO+Gc3Q251gjAHpVjlgauQBYY0pqxHC0Oe7BCJfV44xotwymBf/GNzF9cNBkGssQeiG2YL6lOTEIE1uSze2cL5w71eALn5FMVXNmGI0EGpSR8aNRBaHUaBJqwWs3+GJHfXqXcNhIdwEjI570MTV+F5K9O0GrEV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:26:42.9301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0ebd80-4f85-4e34-6e87-08d55d389a4e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1338
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.42
Subject: [Qemu-devel] [PATCH v5 0/9]  Add the ZynqMP PMU and IPI
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e1QoNUWLgccs


This series adds the ZynqMP Power Management Unit (PMU) machine with basic
functionality.

The machine only has the
 - CPU
 - Memory
 - Interrupt controller
 - IPI device

connected, but that is enough to run some of the ROM and firmware
code on the machine

The series also adds the IPI device and connects it to the ZynqMP ARM
side and the ZynqMP PMU. These IPI devices don't connect between the ARM
and MicroBlaze instances though.

V5:
 - Fix clang makecheck error
 - Rebase on master
V4:
 - Rename the ZCU102 machine to just ZynqMP
 - Rename the PMC SoC to "xlnx,zynqmp-pmu-soc"
 - Move the IPI device to the machine instead of the SoC
V3:
 - Add the interrupt controller
 - Replace some of the error_fatals with errp
 - Fix the PMU CPU name



Alistair Francis (9):
  microblaze: boot.c: Don't try to find NULL pointer
  xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
  xlnx-zynqmp-pmu: Add the CPU and memory
  aarch64-softmmu.mak: Use an ARM specific config
  xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
  xlnx-zynqmp-pmu: Connect the PMU interrupt controller
  xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
  xlnx-zynqmp-pmu: Connect the IPI device to the PMU
  xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC

 default-configs/aarch64-softmmu.mak    |   1 +
 default-configs/microblaze-softmmu.mak |   1 +
 hw/arm/Makefile.objs                   |   2 +-
 hw/arm/xlnx-zynqmp.c                   |  14 +
 hw/display/Makefile.objs               |   2 +-
 hw/dma/Makefile.objs                   |   1 +
 hw/intc/Makefile.objs                  |   2 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++=
++++
 hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
 hw/microblaze/Makefile.objs            |   1 +
 hw/microblaze/boot.c                   |   2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c        | 204 ++++++++++++
 include/hw/arm/xlnx-zynqmp.h           |   2 +
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
 15 files changed, 1275 insertions(+), 3 deletions(-)
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
