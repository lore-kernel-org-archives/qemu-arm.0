Received: by 10.223.188.70 with SMTP id a6csp1500063wrh;
        Fri, 1 Sep 2017 14:05:08 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4+Wcc9wYztplkbWPlHK5T1tkxxE+1Eu06SP8c6gt2gFpTI7IUlPDDWv1zEeoHcGPPoJA21
X-Received: by 10.55.22.104 with SMTP id g101mr4459353qkh.306.1504299908717;
        Fri, 01 Sep 2017 14:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504299908; cv=none;
        d=google.com; s=arc-20160816;
        b=EypcjWayRGtj85ADuhsiQBoh5yaorZ+5iz/KCefo0rekRVsf6hCeAhf1OTQYdg6SUa
         dA5faWH0ei4UzD7yfdkZvJYRi2Rpr5d3v9Btms3dvJP6eQkHNJhYWRopVMDf5ZypaNeE
         YEih6qrNhuCL4YnzCqNq+6FsnnitGaEuGcQAzXm4MBuWwRkd5E8Y2MwihKFwsK9Zwxu7
         I9DDOloTUmNJXMgefMFLqzNOlEZe4F4UBOYSh05RsfKSfSMfWU6gEyQ6kUnolltI5h9t
         aNNqJsTYB70UZZ7c/pPq2lCggh3GsxUAD3bRN2SEtucjL8Vct9LQjotxyT48zMfoD7Hy
         A2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=EMacYEwxJ8+u4w4EUG4eQ6ytZ4g2Igr2UDyPTuOmtFU=;
        b=nW5znlL0iAcGiUaH6jwsv6nG0eWTRdKu/lidL5xl35ViWGeenidqS3InjJHyxBILOB
         Zp8U2ySRBvxKm4l9uuxd5OMCCorEMJ2swPNt5KpdhBkkL7GhqYVPrKzBsnIrWUczEoE9
         kgIEiTbMY9n0JllvfZp4WgBLe1gKMNBVhYifhC5COnWp3Ry6xfMTbw5PG4cfqTXKa1bR
         AjRzhNtNldoxrhEJIYsgiEewrbtwTikInLm2flW0Rea+xAisYq5wyx8+ALLrTcM6y5QD
         PVMe5lM2BpiBXCOc7PS67KuJwqdp2QEcES+r76N3poOSwiGY/1xscfRWbSW7nxqhd+/h
         HQgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=P9PZlkzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o185si10855855qkf.520.2017.09.01.14.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 14:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=P9PZlkzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnt7i-0000r4-EK
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 17:05:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt7C-0000Rc-OA
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt78-0006oB-Jw
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:34 -0400
Received: from mail-sn1nam01on0088.outbound.protection.outlook.com
	([104.47.32.88]:11530
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnt78-0006na-C5; Fri, 01 Sep 2017 17:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EMacYEwxJ8+u4w4EUG4eQ6ytZ4g2Igr2UDyPTuOmtFU=;
	b=P9PZlkzFRs2hYDrYvM8bbiP2HWKQJ0BlgYRPwqCV5lD5P4UZRhy/YXvYE8Os0Un5g7FSB4GySeTgZT+IRmEEFVMbpXweIGUsdK6gILYNXaAuDjh788DpWmPovYbi41IKW5ftfVlPF+JBljuigGvYxcfBWIXF3ShINeZZKW5BY7o=
Received: from SN4PR0201CA0003.namprd02.prod.outlook.com (10.161.238.141) by
	MWHPR02MB2704.namprd02.prod.outlook.com (10.175.49.18) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Fri, 1 Sep 2017 21:04:28 +0000
Received: from BL2NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by SN4PR0201CA0003.outlook.office365.com
	(2603:10b6:803:2b::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Fri, 1 Sep 2017 21:04:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT025.mail.protection.outlook.com (10.152.77.151) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Fri, 1 Sep 2017 21:04:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:38308
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0002QI-RF; Fri, 01 Sep 2017 14:04:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0007gz-OC; Fri, 01 Sep 2017 14:04:26 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v81L4LUg027573; Fri, 1 Sep 2017 14:04:21 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6z-0007gI-1l; Fri, 01 Sep 2017 14:04:21 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Fri, 1 Sep 2017 14:00:45 -0700
Message-ID: <58a155d758561fd2011596b211db9080a78aa2ac.1504293917.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504293917.git.alistair.francis@xilinx.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23296.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(54906002)(81166006)(50986999)(5003940100001)(81156014)(76176999)(33646002)(63266004)(36386004)(8676002)(6666003)(106466001)(9786002)(48376002)(77096006)(230783001)(2950100002)(47776003)(356003)(39060400002)(50226002)(626005)(36756003)(2201001)(5660300001)(8936002)(50466002)(4326008)(118296001)(478600001)(2906002)(305945005)(189998001)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2704; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT025;
	1:AULsRV5h5uYHFV+0/YIL8sxNjZ6bI/yqVnU5zgURICbkfXf3fRV/UeF0V6kTBtEscO1Q9iDFkjcZO1Bo1vCAFxKq/FPOv5J0gamsI+mjrSN8mNvfQ/O2m/HNL4PygIkM
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42559dd5-d735-4c6f-c617-08d4f17d0855
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR02MB2704; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2704;
	3:Y37nieHpnUIacKVgcXZGFY7Fet7nxiaw/CLN22cK3T9gQU9KOEJJaMHxkxkLdkziKPbjBhEcu9CBIJTjyfLMQuRQa2vtrW7+dr/hjJbWNKJVmrkF0mTmzmEB3MA6BfCYJWqEtTmtnO3Rl3cnDAhXWPKjYYZwTUJU5GUuUya7Wl+GEq4u3Ro0q5bUuf7bi06/FBKq4Wiy6syLA8Skl5nb9T6XmDAB10rBJeQJ3KIP5mxtrrF0B0o5GhKi09Dwc1pg8CC+Pzut1BiSj/V0kRw+00iD7ohEAPLfpRD4xm5bwFy4TtTNBq8qvtY2nMaqVWddoqO4++0ZCaGtzG26ElaOaVrjiRF0buCGBkSUh6QnL1w=;
	25:2hF0RyQ+reAD22DLROLoOYwwTfDRGM+P+qqWbNpjZLJoRNrBD2fC/XW99Upd9tQ2sN1sP5XjJ+guCohuPaMA8Y9CCqcwQRGPUIHhO6QfOCcd8fYTmbhI7m3Wgwel9wUjVNqkZOS5y9WPYq6YryiEkdf2JmOdZka963b8NWWvzgU+d3vrnTpk13ErTn7t5HVI8YFpDIf9D7zEIwoFakurH4O4QsMdklSldzMKtZUJUAC5dwyG1+u6NXcVBcnv/hhVZphBjYOcUbe89HGKnJS1JyV+i6ehmM7Jc4BJr7YgYl2DAjGUlHcgPy/y9e9ZvGLUpdrod0JnmUQ8qliRm8AOZQ==
X-MS-TrafficTypeDiagnostic: MWHPR02MB2704:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2704;
	31:EdhlL4yQogaJwODQCDLyPPISJB4KNaSTzRtFlCcDE1GQxErF+4/ame3e74WxmVD4jjVHOsGbXyw6BNvwBzCJyBho+WpYMZoSu930ZO94nMK9zxW1x7n7RxiIVJvSw8v7bjJMpFrTAIETxpFzwljzOvI6trHwOvaikpe6NC91YtMNfoiexZ5QJBQN+tyF4mQOynGmML5D+k43RFRI0Er8yf59qhJ5hMIWlZ/ybkhhtVI=;
	20:3b1dMDzl5ts55lKZDjN4d9yU0WS4oeKfp7OrVhr2E5r/HglP0WtZigpzMuNZpLaq76hKMQHH6S7/fEb4iVXXuMWhZcTaB1yqJVTKaDizAJYJtTd2YO91Zodjtho0LoUSEj2hB1uWVilPv/OV9J+w33OLXEU/8j76LRWxi58nI4xBguRZ72eJEAmklqZgn/TMkj4CyxbZvkoQtgNPjmuD1jJxkajTiOfpzQhETK/pIfx3NDrlhLjVVILVE336QvYDMWz+0IuZE1d7W7LQ0syWZz+laQjKI6fhuODIB3n+JpU1UXHY8bMv8WvTqfRMnM5XRkgYM5N/R6j75mj6J3kBdMQWpT00rmn9xBnIvfkFvPQ/nhF9zcctAZuCQbWv2ivM34u2ZZPrx2oSDsvr4s1ktUE0FP8fQEFdVNP5Ok0sCL2k7SoJ7/0PSlAJNodhzuvz8iFabuIqQKwCczFUdiufB78ZI4QS0QSITfmIUtdL3NDXVmPV7qFucPA+E1d2ci6k
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <MWHPR02MB2704CACC0132EB18CC817696DC920@MWHPR02MB2704.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13018025)(13016025)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93004095)(6055026)(6041248)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB2704; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB2704; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2704;
	4:s2RHzMgbKgm2Woj7lQcWh6vzf3klchcIMoAu7VT8Nyt4CS/kN6SLz3KzZYetN9+3VKH6v+V+hGqXsLWdkymuAimZFQ9/A/C9NQ6HEkwzvubj8U0+gVAwlRgXs4i1n7KnNBdzxp6xq4Mmbw14TdEI1YrY+onGr1IlS3USCK0tLtIX9oNHtp9Qx7QQ+xDall6tn9KDHN/1MlTUPnphb0rnm76nxs+XgLKWoUmq3XqKJxbkPJcDOTVEhgs8MsH1uN0j2zGRZwC1z7IXpN+JwvIHKtabV7mEIDhiYNK/V9Ucg+KqN9ut6UCZP4mLQiVSHeosUMaUIPXvoax15gNtjINfYQ==
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB2704;
	23:zfQ/11tI5AousQyuV4Z2d9z0N86gX3Xw+cv4ukKUF?=
	=?us-ascii?Q?INH29XIL3YaPL7zYaInbwn892V07iUuR4nrlF1OIy7A0tHYSxACLrB8o+GOr?=
	=?us-ascii?Q?X6LoJI/DSb2d40RjV7SHI6lsj7QxSU9xCj+v7cwRFIWamCJX8p0lWQc4hwxr?=
	=?us-ascii?Q?WWa+nqN6AimSt1JMZwOBzwPwPmUg+M2tRcOhcsaRgndQzfjM1y5kTXbVd0oQ?=
	=?us-ascii?Q?mrwqZFQEqj+wdqn0tozODJTKi1/noAsKnVPTJ2j2OOwB/2N/YrqTAefDeJoA?=
	=?us-ascii?Q?2DnE4dKZFouIPMVhttWNQq+LFAqBoQIOBfuqnRzAALGnyp5/VUZUZXZLStTj?=
	=?us-ascii?Q?nHZLWFC79apsS3MznvUKZb9Q/YM2thyp+4sbyEiIo7NeoQWBF7rl0MolLsat?=
	=?us-ascii?Q?B1vWX0BRf10vMvIZiWhnasRmPStRe9/nT84JSat28JxOA/z/RZwA7TQZTUs0?=
	=?us-ascii?Q?7hm7bXXSYwxE/7gV1x9Z4nXYkemz6GEfgzCDlbboPvZSCTeJs6ekFStLhNo3?=
	=?us-ascii?Q?2HzYyXI9eN7jnXNq/6qnLmpNNWNJhrJEvPLm8huZNZIEA4sdNIipwqSkCFKC?=
	=?us-ascii?Q?I6W62sxFWuly/UHXTBLqDgOf91nHNIWVRxajagL3uPEgXZEQtj2yNltYKt7Z?=
	=?us-ascii?Q?8k6DXoYy8p4AvYQDTlL5Iplha2of7DuxW3Oxw0V65qrPFt+XL5TMGBknzvqo?=
	=?us-ascii?Q?TGrVMiiNlEbl7Ebje7HPXbhbeBuNMrPaeNvhZOMRmKh3m+zWqphVavcRRSA6?=
	=?us-ascii?Q?O33thr3zDvsFCcMRUZv51BkpsPBN+6/aezU2ytzlG4A5MSh8vbXd5KaDlYxp?=
	=?us-ascii?Q?tbnEtcP3tvuBi1G4WsiP+a2sJa13ywrPl40vF4vGpuXiG2mXwcOrwEuJfUTm?=
	=?us-ascii?Q?FUK7Ma1WoMGcihV6D9ZYNEcOuISgenHCZPRg2zB+DUi8dGjEYf1gL57I5ZEh?=
	=?us-ascii?Q?l6vi4abXVZkOTLPd4jbU9xJXfAheBOdKu8x4jXFivXA0t6X46npAo93IKvW7?=
	=?us-ascii?Q?TiSK3o6VTANcHBPtoOE1kn1Eh8mDia/2AmmVkW7H0DVHQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2704;
	6:CJvKsTkPfkcA5qmdPe5D+ueJd/KbDdhiltw0nqWpTfgGR0A7ZMXRaq1PG8PjK4bcidl6Tz8X4ewuNsfRrlSE0Gv10Mjt4d0HrikNj9O3RD01eBqwJ+1weheU6BE6cl9XTQLinEBQ1PC8SO5+8ws74TkZnBa3xYcWH99z8hYFzemlM4IldTyflvuRVUkwGTYUhkp0K/nlspMc35F61tQVuOcWg05J0tDUlxqDI2OxHNlytEb6b/n/MTpbyZy6KDsiGLf23HXjCvabGRcByHVnC65aYfPWJmxyh4Zzj/W3LoPG7ybL+midGEHXGMK+OSSJPcCUQJL2KQD9j5Vd3foTXw==;
	5:/GzfbrtXL1hxs+OwHb7ht9TY9xsezasBVxwqhae8Y5mC1e9voyAWqNQ349OYfnGB7FyZG9uc9XAGmLwlPsboX6O28IreBf2HiRFF1cDnFfPPAshHG5m6kOwSdEEMG+CXucGNJVH/1N5FM4rQKcbbVA==;
	24:iuBhdagwf0BJtpZbQsFYxAD0bCFEXcmD4PYQ0jDyGngR9oCBl/5ZUk3bBrk8ihrbgWVCD2ToQvug3DRqNodQWdyc5iKnmAu74+eyz7zyDBs=;
	7:9e2RGjl1joWRTZUbFhzmRAzmnsoEntFYdkQCSF1rOAYHsyX5piDquXA7pyWceXVm3T2EHwdIH8UyREu+ldEn0PwRmjORQ6Gr9UqXs74EG0CYGSgIUPaX52Yfkmsptp3lZm6kI62SeBui19Vekv0cRz8OAkR2VLPjjxysgVUEZp+Mf4TyH8mCoqCHBHmzxWrX0v40wk9IVMYAoiAHTifvivX5VgeInp8APOE2ALOcqZg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2017 21:04:27.7252 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2704
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.88
Subject: [Qemu-arm] [PATCH v2 5/6] xlnx-zynqmp-pmu: Connect the IPI device
 to the PMU
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bN10tQZT2nyI

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/microblaze/xlnx-zynqmp-pmu.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 33584cfa4d..a6c14495ec 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,8 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-zynqmp-ipi.h"
+
 /* Define the PMU device */
 
 #define TYPE_XLNX_ZYNQMP_PMU "xlnx,zynqmp-pmu"
@@ -34,27 +36,42 @@
 #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
 #define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
 
+#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
+
+static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
+};
+
 typedef struct XlnxZynqMPPMUState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
     MicroBlazeCPU cpu;
+    XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
 }  XlnxZynqMPPMUState;
 
 static void xlnx_zynqmp_pmu_init(Object *obj)
 {
     XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(obj);
+    int i;
 
     object_initialize(&s->cpu, sizeof(s->cpu),
                       TYPE_MICROBLAZE_CPU);
     object_property_add_child(obj, "pmu-cpu[*]", OBJECT(&s->cpu),
                               &error_abort);
+
+   for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_initialize(&s->ipi[i], sizeof(s->ipi[i]), TYPE_XLNX_ZYNQMP_IPI);
+        qdev_set_parent_bus(DEVICE(&s->ipi[i]), sysbus_get_default());
+    }
 }
 
 static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
 {
     XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(dev);
+    Error *err = NULL;
+    int i;
 
     object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
                              "base-vectors", &error_abort);
@@ -75,6 +92,17 @@ static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
                             &error_abort);
     object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
     object_property_set_bool(OBJECT(&s->cpu), true, "realized", &error_fatal);
+
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_property_set_bool(OBJECT(&s->ipi[i]), true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi[i]), 0, ipi_addr[i]);
+        /* Need to connect this to an interrupt controller */
+    }
+
 }
 
 static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
-- 
2.11.0

