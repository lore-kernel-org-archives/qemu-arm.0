Received: by 10.25.150.194 with SMTP id y185csp1333670lfd;
        Mon, 7 Nov 2016 17:00:43 -0800 (PST)
X-Received: by 10.157.48.4 with SMTP id d4mr1835081otc.110.1478566843014;
        Mon, 07 Nov 2016 17:00:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q206si16827376oib.176.2016.11.07.17.00.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Nov 2016 17:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c3umI-0006mI-5r
	for alex.bennee@linaro.org; Mon, 07 Nov 2016 20:00:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c3umC-0006jw-2Y
	for qemu-arm@nongnu.org; Mon, 07 Nov 2016 20:00:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c3um8-0004h8-I6
	for qemu-arm@nongnu.org; Mon, 07 Nov 2016 20:00:36 -0500
Received: from mail-sn1nam02on0053.outbound.protection.outlook.com
	([104.47.36.53]:39840
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1c3um8-0004gc-5G
	for qemu-arm@nongnu.org; Mon, 07 Nov 2016 20:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=q8t+g3C8sPyebc9X2K5aXMKvgF5TPlj+zcitRuh08AQ=;
	b=pDS0F5xsZ0CDlQVEB4GP5nRBRzY2LANHxZukCclWem9RhkHSNwTsRYpFCw94P/f1REPoYfLnRQiyIy8/Tt35tInEBf79JuqUNCOxl2hdS1Ab4CeDtEbJUo4NVvD2yiwxBfRTDRB+0Bm2/vH93zsTmi3QxhDmpNEm7W8AV87oiXA=
Received: from MWHPR02CA0004.namprd02.prod.outlook.com (10.168.209.142) by
	DM5PR02MB2876.namprd02.prod.outlook.com (10.175.86.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.707.6; Tue, 8 Nov 2016 01:00:29 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by MWHPR02CA0004.outlook.office365.com
	(2603:10b6:300:4b::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.707.6 via
	Frontend Transport; Tue, 8 Nov 2016 01:00:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.707.3
	via Frontend Transport; Tue, 8 Nov 2016 01:00:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1569; Count:17
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53635
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3um3-0004AG-IW; Mon, 07 Nov 2016 17:00:27 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3um3-00010n-Aj; Mon, 07 Nov 2016 17:00:27 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA810PYo008547; Mon, 7 Nov 2016 17:00:25 -0800
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3um1-000100-7P; Mon, 07 Nov 2016 17:00:25 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
Date: Mon, 7 Nov 2016 16:58:56 -0800
Message-ID: <71bc12badf4f3125765146c21b4976b1d07dce46.1478566669.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478566669.git.alistair.francis@xilinx.com>
References: <cover.1478566669.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22684.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(50226002)(7846002)(36386004)(305945005)(5001770100001)(9786002)(106466001)(76176999)(50986999)(5003940100001)(33646002)(586003)(189998001)(47776003)(48376002)(77096005)(118296001)(92566002)(229853001)(5660300001)(626004)(36756003)(50466002)(6666003)(81156014)(63266004)(2201001)(575784001)(4326007)(8936002)(2906002)(87936001)(8676002)(81166006)(356003)(2950100002)(41533002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2876; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT023;
	1:vZ5Rw7qWhlWLpOOpIoZWqWoxPubcVYdcmfotBMWPVPNDevGxVPj8SrCtuieYy76xVDm0n/L9h0vGCaidtUu2TO7VALRnTyPTfR1QmjguQV8BzShT6yL4/pBz/OpRfErWA9rqxwu3yjqazyq88/IddIj1RTPxExqpbME42folfR3VBFsRb4Gqu+1LBoiQH+kvVLxz5IKY2MAFW0SbFgTmLwfjLLsvZPPJ8eAYQ6tNqz4UR6POGePL5DM73n7Tspv5DJFOgLlyWgSvrBhMxcEBgjC2o+lW/BixCa4hopAJHrRYkkKTwvK/SlDhhxQY/HQAD/RRvta/kCnIVWC73pWOkBJHQmXkcN+NE0vudg5ZC1pkCH9rpxkTEfJfVoXvQM+rC+jtSY/9tRIcFGdMzGlXmhDOkhTfXhTu/vj19No8iSil63Nhgg48GXhJm9BTABj9MGkTjl5UeGPAiNwHBbYigl8UJ1m08Vba/cVl9Dz72BB2yeL9OrgDXPdyGHgF8eqLuNWSLAmhTbO9QHLPc4UyR9PIbkibyu8prOy1f8wfh/ho2qhguRR8JIickhcHHSmcjP9/jrQfgDcc2bseyPmgcPPT0cv7aD8NSjUkrLWNKPs=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48cb61c5-f21c-4a4d-c55c-08d40772a1c9
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2876;
	2:ccyPfbsRlK/NzV+FKyL5CwFJu73q8Ear8ZOnjiOazyDnS7wNS+h4Mitr9EVSpOu6Sf32I5H1EwUDW2yhcU/vZgAyWYLytV+YVbrEmAm8tW7zC4pjdWxFqICiIS+wuFXSdbmVPaSR41YEGtqhEMmjssviiw+2r24oSBVWPLbHJh1Grsuj1ZrFFzibFvuTSBgKPUJ4fLiHTLK7M6guCTIuGg==;
	3:pfXOw2GKyRRzZk/a8btbccO2PXiLntHO7jCrBrmChMT4CKPLHKC+ecCglNudVyaSJYW4qJNlVy9v5DTEwGYRqrl+BROLt/t56N9uQfzvKkrBMNM8xuZFHrkqJjlhDKUVI9U2dhdkrevB33DOLNeRNRdmNToaNOTrt7xYAR7bdW7vIYNOfSxc3aX+4K72sDmhN0C4He/TOAE6+9o3/QAhAk0QS5urn0PYfd80x2LP/0GmrlnUQP8AVGHWsaStdW0ezs0ShKqmCoJmS3VVSCnsfjmN5Ts/z5qupnFHylNnpIg=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:DM5PR02MB2876; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2876;
	25:vBZmkKFFzIuza9vdoZsIaw1nxdaOXuApPipxN1wYN0by5hMIvDzhmyDUyJ1QXH3o1iG/5FBPtCBZbM79J0fQqw8ybJoA2QAx+rk1jZ1wap8S7xbCr4SGl6bRAxGh43DeGq+S0+T2p6etXcOXS9RJkK4h37LZ5eg5NXRLhVCOGfdiBgPg2FPMmxvedbdsJDwsf/zCB5/9ZLDIhE9BQJcMKw81XVJxJaNfJQrJNvnzpofhHG0RdcuuWKrzU/aQaffOdOLg5jRf3p/KGYxuLoGSmPgc8gFVZWkhHtFL07nXTbxuUtfCiRNRfAUzVX0vn1s87dFbpsVgnyZ0jDPmVSqeImQKfB26O3ByP+flAdxrR99Ff77NunaBnZxT5gXSJer3MiwmcQbj7rI8o3mnBLhDf5zeqpboPomZcPs92MK54kE=;
	31:3osfQFfifMwycr0CVYP8gxlWvUt6MUJPd7F/O64bhYncMEHtXiTY9d2jr2RabOkSr0JoZzyI6LOkzNRHD/6j1VxlnJmGiBmnUaoS7PRTKc+5GDUMHifimnVcql+7XI4jLqkQa8YqbgBXFW+5gYlTlt5wqgOo7qRyq+CHcv08VwimFEbJRus81tGT/ecU0uQav4I/KakgdhxRoHX7XM2RfdHjrLvDM4Rhqy7JtE42Be8JD03QYelAh5gwPFA01foDsaFraVhH4ARQXtTdwRURNw==
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2876;
	20:6s2MHs6ZwFj4WGvRcyinLW4Mf0iTsQ6AVRBM6Zz+ZSmdk9pBnwel9AuYykVxwGBGo9eYGWjhStrbcDjR2GoZF1JhfSKJzIH+MBOcwjZs+tWPR9prEM/ocLq35MiU5szQclgZxkpDPuGG00ci8Lb/7qa7/jTb3oQ2xoSL1vnqB2R0DL+ZFHTW2HG8BWQBN1+U0P8nXU51b5KO2oJUtwhJIlVFze4yfC689dUjeOwLCmOkdigV/VGFNw2UCYGGwInuy9LVGNjFsKgv/CY2sKael/4HX0UYyVtnmK4PMP5NqBnDn0C5JSD+KYDnBvU4igsJxlhzZbWdA9hbP+6aXI1CnGJtyNn+Ne5Ehhw3g6f52OIoHfJetFM/avTCQk/Y4Dw64EuquUH1QdgdIzQRxYZl3CXiiuHJ6VbR4RmJrz98IG71IqRteOEj1zLYaiRVY11vEWpNGmeafevAK7s8E+lSyRwhhCiIiB3rJ62Rg4GpHSGAobBpkvsCv30jPIEJMctl
X-Microsoft-Antispam-PRVS: <DM5PR02MB287675BBA77ADF8145725BAADCA60@DM5PR02MB2876.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13015025)(13023025)(13024025)(5005006)(8121501046)(13018025)(10201501046)(3002001)(6055026);
	SRVR:DM5PR02MB2876; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2876; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2876;
	4:MohPv5VbH1C0R1hU+2SXRhC0mD+OG5+3a32Qrg/0zjYODRtplLKyLyqbWqrTBLiPRwQ/d36lWbY1EdbmlfyjWWRF0LdPRtbUppAb4Yrlfz/gwu9mz+bZ43thPaErP3wqCDfWEkpb9W3pjLAbMNZl4luD30zc6+UbbX8unk5PgHM/eDbCTSea5vFrzEgB5/FcQnM2tYx5X6B0yIlAELFDBleun8WGpnYK9YaUtz8JGCjqYIibuA032gDj9h1k3ndO+Yv1E6Myu2Org37bnkWwMa8iu9WmYNLkHbYK1ZCE1akFAbJ+Mnxu/9Ngg1+qz3904AiG5vGf5KVaIKCss5UCddzM631txNObKTv9ibgu4QNXw9DEEON/QhuoH3XkgdzRR+7ZWCLGTYd3b6YS2N7LxS54HC7CxelqlRN6wMpxefT8gtCUpzPJFAuN6uAXy2AcZNB37mONyf6HTArRPFTRzZ0awcX90q5Yk/PjjoYPv1uWZgh8OPUC1hJFfW6DXrQvsw3wKm70SWJ8s0aXKGghudqPpZxCSWjeT9QfPXgqVIfJnijgAa0JU4o4W5C6+5Cl
X-Forefront-PRVS: 01208B1E18
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2876;
	23:IcG/f2g6RJQY5IJ5xWyrREBrD47w2X9OnAin8m5wK?=
	=?us-ascii?Q?yPK91OtrOnXmS+QAmx0E4mrEoU59x/UKRMXCcn3CcLM9tRFzv2qWtL0+JHPd?=
	=?us-ascii?Q?3VMJxBekF1skghQEqqbYTRfkMsdDwiFMmv2BeU9/ZJOlwtc7eh2BsaLmSnSx?=
	=?us-ascii?Q?Hj4rmPeKcxC1MTEq9wy8xSQ9wAelC2bvXF8P0rFt8bzN4hhLnJU9IEm0kmUR?=
	=?us-ascii?Q?7HpTah75q2rmELax1YYYuHcghTaqbeRdlNf4hq8OYu82IbK3IhQpkaDYKBDz?=
	=?us-ascii?Q?kfkaJr/3IVrtUJFVt+JOxxM5oKepFdIh7CatktaCaWnXRN5BT8xQfrRzoR+C?=
	=?us-ascii?Q?FO6u92XXi964ygrP5d+CSgdHDRbaWi1RurOWcD+GnRHHUsuhqXehyMMAvJUV?=
	=?us-ascii?Q?OukEAbjhMbr5a6dhWFi2gjkzsj5Hqkdmb6khZcj/0NFk1sJVy8aVdAGXYc4u?=
	=?us-ascii?Q?sC74dAv8zu2TX8ps0JmS2ZTbP5Ip42rchu7SnUS1NYgOQHoIaXnhzizTSojb?=
	=?us-ascii?Q?eTryHFiiolAt3XU6dXWynX62uIINqBwVBMqbQGldMZBCncgIoGrb9/AxTBU9?=
	=?us-ascii?Q?RilDAW9aWANuvPpA2+L+cJ0yBhr5j0wzLEFKP/SmMdx7SVYFSQ1v7RdtIyfo?=
	=?us-ascii?Q?ZkIq7ipc9mW28SHrnfIYB6jMz7gwNPNRwEassh1uBp5hz+mDE7WBb85subGf?=
	=?us-ascii?Q?TZjFlItHS04yA8At4qEB5jyRWnLg4sydHzIHdzrnS2EwmA66o4kminoBOWX1?=
	=?us-ascii?Q?sT+/Av2k72O6LIZpBOxIzj9jYF+6068W6YdWl4f3KW5fg6ApRWc4cuhOSP5p?=
	=?us-ascii?Q?d5xoNtw0fZ8GJVjfYbiPukHvIVDoiI3SfDteid6g7WOhHtsAecEfvZdxT8U7?=
	=?us-ascii?Q?VeCScnIRUy9LUNBQHqL2G1j+Dpp7YMcAq798Xs635S70hWn89gy6iQ3tSHjv?=
	=?us-ascii?Q?HhNtcszFHtNAJBBp8SojsWH3ZUvaeBgF2Au/JMf1voS8cuAZ/gwtUwjYJrwf?=
	=?us-ascii?Q?GP2ASUvwKpoMGfvwNbdNGC8CZn0FyEvWP0uoBp4iNTafCvijcFtZvxFQ2gcu?=
	=?us-ascii?Q?c39ik9WmyvBqQYpBXYU8rxJWRrRsMhnH627xbp8jaxHErhqeQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2876;
	6:KOB5lGBbQFAM7i691peDz7wqWh2cfbuCHjiGiUqcH7v9NGxGulu9b7Ll0D2nnBkQrEuXbj5Vp4S12eah7O6o8BLlGzFt7/wm2xB/Iq0TWj3ZWo+8p451M6CdAmq4JPlIZLMKc1jwgvh34VCNxYfc7ylUPb8aSSmoec2+4x5ldlzZ5cPb7NVEpIm1L+ScYcFKKIxudUImq0QfrTg7FSFF+32lXf6OKgLOQZM6i6s15MZb/UFKrfd2twQgWqPb5giUqVd6AvYhA70h9wbQ5mpjdAYOnDguT6F1NAvLUFkZbBgQkX+5uZA+3BF34RhCGtpxzERewUZR5zTlo4Yu7Hx43z5cbF9Qsfj/WzIu8LrMS7g=;
	5:nBFLvyhe3zuZYUPrbyip2fvTf94fuLMGKSVJR5laRzuO2Y2yh+cC5HuflNzrH3PAu88NFBWqi/AffsHfwK8LsYjuX2LMUjOEoyR02iE7BLsns/IfwhcGPILkW607ekBK0FcOrl6j3XolsIRZLHXWpw==;
	24:b0uK/eur5tGtqvrsIk1Irt6T7bnXip2pE1E1zVKxjejxEuihiIlUNRvDE1Iu3iNustS7jukdCawBDYmKvCKZtLrrpvkKtGZG3LhKOHJ5goY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2876;
	7:G/2YDSH6v9qwVLyhKvK0uM6cRwcNT+SeXzJtv7y3Gndjpgn/Z8YuDngSyBQnsT+D/KzI+ZsUskHpnvuja/6NGk70vLGY0cBqhoOky/KiIUhxh9oWg1oQhf0firbg9HZms/f3mVntIiD0BsF33kkc1mc3IWCTjMhfCo9F1x+SnOYjGUuuHT5RMt3lg3V5ewn2Q5JNh8/jb7K2cWF0p/ZvhgpLe0Xyci6C0XVnTN91py8YTNppHI6gZHhO7Cs351Qer/jbEPY9FEHbqEH0kTnXcDpZYgpYtVcItSKkPOZEnq2KMhPZEcjH31h05fXmwDkmR6GfVmt3JizDwZtT77/QsdsxMdnWwcDJmwX7w5VzjKw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2016 01:00:28.3259 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2876
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.53
Subject: [Qemu-arm] [PATCH v2 1/2] arm_generic_timer: Add the ARM Generic
 Timer
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1xIhR0DLY1Iw

Add the ARM generic timer. This allows the guest to poll the timer for
values and also supports secure writes only.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V2:
 - Fix couter/counter typo

 hw/timer/Makefile.objs               |   1 +
 hw/timer/arm_generic_timer.c         | 216 +++++++++++++++++++++++++++++++++++
 include/hw/timer/arm_generic_timer.h |  60 ++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 hw/timer/arm_generic_timer.c
 create mode 100644 include/hw/timer/arm_generic_timer.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 7ba8c23..f88c468 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
 common-obj-$(CONFIG_IMX) += imx_gpt.o
 common-obj-$(CONFIG_LM32) += lm32_timer.o
 common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += arm_generic_timer.o
 
 obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c
new file mode 100644
index 0000000..7642206
--- /dev/null
+++ b/hw/timer/arm_generic_timer.c
@@ -0,0 +1,216 @@
+/*
+ * QEMU model of the ARM Generic Timer
+ *
+ * Copyright (c) 2016 Xilinx Inc.
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/timer/arm_generic_timer.h"
+#include "qemu/timer.h"
+#include "qemu/log.h"
+
+#ifndef ARM_GEN_TIMER_ERR_DEBUG
+#define ARM_GEN_TIMER_ERR_DEBUG 0
+#endif
+
+static void counter_control_postw(RegisterInfo *reg, uint64_t val64)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    bool new_status = extract32(s->regs[R_COUNTER_CONTROL_REGISTER],
+                                R_COUNTER_CONTROL_REGISTER_EN_SHIFT,
+                                R_COUNTER_CONTROL_REGISTER_EN_LENGTH);
+    uint64_t current_ticks;
+
+    current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                             NANOSECONDS_PER_SECOND, 1000000);
+
+    if ((s->enabled && !new_status) ||
+        (!s->enabled && new_status)) {
+        /* The timer is being disabled or enabled */
+        s->tick_offset = current_ticks - s->tick_offset;
+    }
+
+    s->enabled = new_status;
+}
+
+static uint64_t counter_low_value_postr(RegisterInfo *reg, uint64_t val64)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    uint64_t current_ticks, total_ticks;
+    uint32_t low_ticks;
+
+    if (s->enabled) {
+        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                                 NANOSECONDS_PER_SECOND, 1000000);
+        total_ticks = current_ticks - s->tick_offset;
+        low_ticks = (uint32_t) total_ticks;
+    } else {
+        /* Timer is disabled, return the time when it was disabled */
+        low_ticks = (uint32_t) s->tick_offset;
+    }
+
+    return low_ticks;
+}
+
+static uint64_t counter_high_value_postr(RegisterInfo *reg, uint64_t val64)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    uint64_t current_ticks, total_ticks;
+    uint32_t high_ticks;
+
+    if (s->enabled) {
+        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                                 NANOSECONDS_PER_SECOND, 1000000);
+        total_ticks = current_ticks - s->tick_offset;
+        high_ticks = (uint32_t) (total_ticks >> 32);
+    } else {
+        /* Timer is disabled, return the time when it was disabled */
+        high_ticks = (uint32_t) (s->tick_offset >> 32);
+    }
+
+    return high_ticks;
+}
+
+
+static RegisterAccessInfo arm_gen_timer_regs_info[] = {
+    {   .name = "COUNTER_CONTROL_REGISTER",
+        .addr = A_COUNTER_CONTROL_REGISTER,
+        .rsvd = 0xfffffffc,
+        .post_write = counter_control_postw,
+    },{ .name = "COUNTER_STATUS_REGISTER",
+        .addr = A_COUNTER_STATUS_REGISTER,
+        .rsvd = 0xfffffffd, .ro = 0x2,
+    },{ .name = "CURRENT_COUNTER_VALUE_LOWER_REGISTER",
+        .addr = A_CURRENT_COUNTER_VALUE_LOWER_REGISTER,
+        .post_read = counter_low_value_postr,
+    },{ .name = "CURRENT_COUNTER_VALUE_UPPER_REGISTER",
+        .addr = A_CURRENT_COUNTER_VALUE_UPPER_REGISTER,
+        .post_read = counter_high_value_postr,
+    },{ .name = "BASE_FREQUENCY_ID_REGISTER",
+        .addr = A_BASE_FREQUENCY_ID_REGISTER,
+    }
+};
+
+static void arm_gen_timer_reset(DeviceState *dev)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    s->tick_offset = 0;
+    s->enabled = false;
+}
+
+static MemTxResult arm_gen_timer_read(void *opaque,  hwaddr addr,
+                                      uint64_t *data, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    /* Reads are always supported, just blindly pass them through */
+    *data = register_read_memory(opaque, addr, size);
+
+    return MEMTX_OK;
+}
+
+static MemTxResult arm_gen_timer_write(void *opaque, hwaddr addr,
+                                       uint64_t data, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    /* Block insecure writes */
+    if (!attrs.secure) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Non secure writes to the system timestamp generator " \
+                      "are invalid\n");
+        return MEMTX_ERROR;
+    }
+
+    register_write_memory(opaque, addr, data, size);
+
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps arm_gen_timer_ops = {
+    .read_with_attrs = arm_gen_timer_read,
+    .write_with_attrs = arm_gen_timer_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static const VMStateDescription vmstate_arm_gen_timer = {
+    .name = TYPE_ARM_GEN_TIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, ARMGenTimer, R_ARM_GEN_TIMER_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void arm_gen_timer_init(Object *obj)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init_io(&s->iomem, obj, &arm_gen_timer_ops, s,
+                          TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), arm_gen_timer_regs_info,
+                              ARRAY_SIZE(arm_gen_timer_regs_info),
+                              s->regs_info, s->regs,
+                              &arm_gen_timer_ops,
+                              ARM_GEN_TIMER_ERR_DEBUG,
+                              R_ARM_GEN_TIMER_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                A_COUNTER_CONTROL_REGISTER,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void arm_gen_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = arm_gen_timer_reset;
+    dc->vmsd = &vmstate_arm_gen_timer;
+}
+
+static const TypeInfo arm_gen_timer_info = {
+    .name          = TYPE_ARM_GEN_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ARMGenTimer),
+    .class_init    = arm_gen_timer_class_init,
+    .instance_init = arm_gen_timer_init,
+};
+
+static void arm_gen_timer_register_types(void)
+{
+    type_register_static(&arm_gen_timer_info);
+}
+
+type_init(arm_gen_timer_register_types)
diff --git a/include/hw/timer/arm_generic_timer.h b/include/hw/timer/arm_generic_timer.h
new file mode 100644
index 0000000..4cc0ac9
--- /dev/null
+++ b/include/hw/timer/arm_generic_timer.h
@@ -0,0 +1,60 @@
+/*
+ * QEMU model of the ARM Generic Timer
+ *
+ * Copyright (c) 2016 Xilinx Inc.
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef ARM_GEN_TIMER_H
+#define ARM_GEN_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_ARM_GEN_TIMER "arm.generic-timer"
+#define ARM_GEN_TIMER(obj) \
+            OBJECT_CHECK(ARMGenTimer, (obj), TYPE_ARM_GEN_TIMER)
+
+REG32(COUNTER_CONTROL_REGISTER, 0x00)
+    FIELD(COUNTER_CONTROL_REGISTER, EN, 1, 1)
+    FIELD(COUNTER_CONTROL_REGISTER, HDBG, 0, 1)
+REG32(COUNTER_STATUS_REGISTER, 0x04)
+    FIELD(COUNTER_STATUS_REGISTER, DBGH, 1, 1)
+REG32(CURRENT_COUNTER_VALUE_LOWER_REGISTER, 0x08)
+REG32(CURRENT_COUNTER_VALUE_UPPER_REGISTER, 0x0C)
+REG32(BASE_FREQUENCY_ID_REGISTER, 0x20)
+
+#define R_ARM_GEN_TIMER_MAX (R_BASE_FREQUENCY_ID_REGISTER + 1)
+
+typedef struct ARMGenTimer {
+    /* <private> */
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    /* <public> */
+    bool enabled;
+    uint64_t tick_offset;
+
+    uint32_t regs[R_ARM_GEN_TIMER_MAX];
+    RegisterInfo regs_info[R_ARM_GEN_TIMER_MAX];
+} ARMGenTimer;
+
+#endif
-- 
2.7.4

