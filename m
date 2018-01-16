Received: by 10.28.173.206 with SMTP id w197csp4573559wme;
        Tue, 16 Jan 2018 15:30:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBovyLIj9AMWj33jlJNOuzd9tbQqqLBBy0E6HePCvgbbd5+QeIsZmGTvG0fUg0fglkQK9law8
X-Received: by 10.13.192.129 with SMTP id b123mr772766ywd.415.1516145401835;
        Tue, 16 Jan 2018 15:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145401; cv=none;
        d=google.com; s=arc-20160816;
        b=j4E/0Gmeb9aq2snnD878c6m+LaqYzM1yixty0wWl9BsIXafvBVXwEZ/23WOBs3+Pf8
         n0oMJQhOxMbJdhjPYdXPsZ3bOK7o2p6Nh6QFfGls45SDupIptfKlkw/AY2hrBqeFsEI6
         E17ulOOSjOtk01wzyDSIungXPZHqgFl9AP69FAwDNPSQRWX2h1yoMQNencXDZTp8qXAN
         tiyntK+DcyV522cDwW5iCV+7ap8z5EngdkUCY2PIT6mHzg3IdkMfpJtF5/1s8eL9ljJA
         UL+t/DMmMDBnMEu5EuBlKWUXhEYxNd/MZn21xZYOckvLeFvFasfFtNNs+XQuqQ044PZG
         +Hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=UGEKrBJpmNqH/Nx9XnTinanDpFtqIhrUaYmddG//cNM=;
        b=B2H0ui73UafUGHDneX0gQfpKsnKgSG4vafyFpGCBtSylaNJTXREpQdtskQFq0wC4c4
         9Hv1djnqVD2js5io+1rNNmjH2w8MB+OXEVRKxIujrLucVL72mnhUpmaK/YwD2sIVFy9h
         VVOJqg5UgF6IwteOvNzmOy9HdZ9CORWtxrhieZTb5V7DKwuaxSUQwi2n8Xg2UBrqJsAp
         vIsPENnlyx3uUAet4bzLHwPV0fTOYsPMdj0We5emLv46lmzAfIZzMNTHKsTVqI7/1GAz
         dHfV25RLWesyd1VTThziUgyc4KU3T9UPC9NuwJ6dnqRgwuY2S8HjLQA9uv4BD0uddwxJ
         aLlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=IcZNgb9c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g14si776570ybk.206.2018.01.16.15.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:30:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=IcZNgb9c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebag5-0006fs-5W
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:30:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadF-0004KA-Tj
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadC-000262-OP
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:05 -0500
Received: from mail-sn1nam01on0073.outbound.protection.outlook.com
	([104.47.32.73]:48405
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebadC-000259-Hw; Tue, 16 Jan 2018 18:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UGEKrBJpmNqH/Nx9XnTinanDpFtqIhrUaYmddG//cNM=;
	b=IcZNgb9cWhNhZ+YvdPDivLbZyFeWDZ6aUoX/OGWIBl2/Uv4D5RdvPm4ViMa7d2cDMqkI5JDZ0JfqU8EKa4fPMgt0Fk01nQhEcdrduuPUp66Ad7iv9MeK8br/24U6MiKEO8e2iRzd8ChfHrVbyI6xJZzONFZlxYhJNjkk63aVI64=
Received: from MWHPR02CA0039.namprd02.prod.outlook.com (10.164.133.28) by
	CY1PR02MB1335.namprd02.prod.outlook.com (10.161.170.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Tue, 16 Jan 2018 23:27:00 +0000
Received: from BL2NAM02FT060.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by MWHPR02CA0039.outlook.office365.com
	(2603:10b6:301:60::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:26:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT060.mail.protection.outlook.com (10.152.76.124) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:26:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55902
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad1-0004Nh-Th; Tue, 16 Jan 2018 15:26:51 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad1-0003Kp-Sc; Tue, 16 Jan 2018 15:26:51 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQoCS031037; Tue, 16 Jan 2018 15:26:50 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad0-0003Kk-Eh; Tue, 16 Jan 2018 15:26:50 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:29 -0800
Message-ID: <6603dc74caa9a754b1a331055130096efab79a92.1516144891.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516144891.git.alistair.francis@xilinx.com>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23598.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(39380400002)(396003)(346002)(2980300002)(438002)(189003)(199004)(50466002)(48376002)(77096006)(7696005)(51416003)(76176011)(63266004)(5660300001)(2906002)(9786002)(36756003)(6666003)(2950100002)(59450400001)(106466001)(478600001)(305945005)(110136005)(118296001)(356003)(8746002)(54906003)(2201001)(50226002)(4326008)(47776003)(81156014)(5890100001)(39060400002)(316002)(8936002)(36386004)(106002)(81166006)(8676002)(26005)(107986001)(5001870100001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1335; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT060;
	1:OXW+bSs9JZ3m+DISqvJhr1tFaBzTQ92qBmPhEDG48n77gBIm6NVLLYz0i68cTQz8vjXFh7Fdyfvb+q22x2Z1C/UgpMHIrX1osCvTZ6afbRI9UmUOzjZvx9PpB0kSNV4h
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2c80f83-2af8-4016-c7f8-08d55d38a027
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY1PR02MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	3:Wia/04yERULGE3JKfbvAEK9OCK52fbpIneAZRN7z1jH2Jz0G4EYx+fFdABTT6fVaboow1zE9eX1vXIN8FL4uxT2JiM3s9rx7rXwR+yUwn/7NcUQooGb6fg7r9efl5GGfzqmOcqSEdbLwG7jmS3mXYKi0rm6TT4lXf8PYOfdBbbp3eS6IyrQPwHTg47BnsX5RE/jPbXXSL/aJmK8vRhCq6doSCqR+cqUD1GlAxp0h/qYDcvG4RIsGxBuUJpXWY6yVQBmhzVqL9hYl47Rr32AZiBRRDZRDHzMV45T77Sm/F1CpQSGX6Kt1Xe65SHfAQK+8FUmdU6Sk97ywsA0x9knqDCcC9UtxdIJgpJ0JXg3gPeo=;
	25:i9IiOc1UXLzOymIURejkZ5vhMVns7JA6/XZ9wHmzP3mOsxaM0etEzi9Dp32HfdcFulBqasWb78Yn9uKy4N1EW1alBBjZL4mNbo1CF5qQ4axjaxzxOxzg+nhSiJoI2klwd/nmr99wg7/SP4Oc3+tSzz6WDUGKw93XhQ0k+wO7rLp5sH+ueBfC3AlZxZ98GaYTSkShcO+8EPgoCY6+n8Cqh2IuITkqR+XfHLH/P4TSSMwHNWm+qxC9u7BL8n7VF8KU5BWNKK6nl8d0Kq4OtD9Ecs6tFxQKnoH4s6YRehuO5bK/J++P7Cx3abU3NtbR5zYm+pnC5y3Qo+gevGOcdCb460xL9t7Zl6K/16XdaJcsUxc=
X-MS-TrafficTypeDiagnostic: CY1PR02MB1335:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	31:SL63CTKVPsFnBDz421bpTSrAkXJqYjmPuclnCYWZO3lz7bXuFjbor9d3h6QxTgJ8N6d2gFnXe1a/UMIuM82IFkLUGEwf3qF4kY64UFlkriVRqqZ4ARMehp8BNjJ3RS2mQmL7wH847m6my6qNnU+BcihsdgiVXN8cx3ZQP/oI9o6qzU4S//GBuobI1vm1ESvV5++W6lSON3/GtN430yKoKAqO0UJyRek1/mMrta5Wn6k=;
	20:ofAvJSHNhWluGCa5mY62b+3H4CjYdR6xHsYfDVvmVcXedJy/RY5SP4apMnyvRxa2ktjU6p/pDxqQ/Rc1y6MqZEN0rpJHCacHNkQLW4Kb1rKX6ZiR7ChT3KnT3z0UAMO3epC/0J2P7Yjq4m3wam71x4ZgnM0X0Pf2XpNPMYye3eq+kwJo1vVQyUQePnlouQv3S6lyvzKgvtedBXA1ATkNoZpdqDNmx4F0zuJklVcmLAcu2cseVHoiK7ZXoTx5VbNVIZRCVIEdEN5B8KMP84u8ETJDEQY3kVacJSJ74Qm5pv99SppDOEyhuplAw015jwrWCTDTir4BiNtr2EeMXJD7IjcQYXb4XLWwBjLkQ9UtvzQpyx4R015fEEwza11LXIFNOtYXNmCIa8CREi3YE09EWf6NH0nbW8uSs7hqa5plka6nAHdF/dBRt5N7hpVkkqJyREjdn9hLcQ51y+13Tu652uaxxkHm7u9PvERPIPAD+bWWFn8N2BbVLW/MTl4Iwzf2
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB1335A88916E4F17C505F0364DCEA0@CY1PR02MB1335.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231023)(944501161)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY1PR02MB1335; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY1PR02MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	4:Ib5S1ONjHEDFd/z0hhZ1AeKdm+CbIUlExl24OcdVg/FQJ/bgMgTVNj/blFj9kDyq7Jqae/isEokTxIG8cD84W4Fac5Ww7wDFmVfECNFqdIx/Io8knPTA2AZmMJ9pIxJqwE2buA4qPqpQpQaRu1VgUN3PzyD8Z7zD46xXxrve6BlrUzQqCGw+aBzUE+ps0cx5rfqPoF3rjjRj4jqxdPcpZZog40+tZWGXu0ktiNvKCCApwJ+dcYbBu8f4Gd3c4YdsvHMB23jZ4CXOyrySPrsQH2ahAbFElfs3KXah+mpyMhjrsFM0mu/EIJoNjugZPcCv
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1335;
	23:dcZ7rS8tnmBH+mhU31d2YZxHSXlwuP+vTSwXaLGoa?=
	=?us-ascii?Q?LxgvLAA0W9OaizHqNmdPgfsp36/WN9Ndk3xmoyf9q2SSzn/hhbY9Rjha5pSz?=
	=?us-ascii?Q?WoMrYKET5RyiKMW1LryRtZZ69JsnuioDIFWTgzrqJB5f5aCIUIBZ0FDUwyv9?=
	=?us-ascii?Q?PceGWHA3LKXISmgn21zTIFsJe05g7XRXW1QNg3RtKxVJTCR4sjjHaBIEpRm2?=
	=?us-ascii?Q?7ozyJFaw3Kk+lLweHTAABafvgHzcW8xIDdCXJvg41yz6BwJ8kVAwQrT01ziz?=
	=?us-ascii?Q?V3Y2iGVH1pyZyVZA+8Rl90qXieObJShzRDJLgv58vuTB2QmSag2fMNxbikdI?=
	=?us-ascii?Q?wbMyf6580d/XrTOV1ic+YbrCi3VBhMx1brqYCyAUbBHODIxPhsX/FfZa//gJ?=
	=?us-ascii?Q?BWs4HIl1rPSqKQE8501ngVYBhqyZ9AMsyu0/89mT2OCP3A/757JUE3InY2L4?=
	=?us-ascii?Q?iUsw6WpobkOiXvJsj+/mGm8f4pBb1of0TbdNpl0lF7pzCTwNiLwwWQdAflsl?=
	=?us-ascii?Q?FZ68HJurK1ZH+qin9E+LRTmIbVcE/fS4a+52rFAPL5K8k37taEYBOKHA6HWI?=
	=?us-ascii?Q?0yuLG5h4Sqwg6F8lvJCok6RjZo1V6rb3wkmf23/xAlvfKMqeJoHQws6Hx1nW?=
	=?us-ascii?Q?ExhB1S+ZgKry0kFmaiEV2DnAu3PrrqPZWp1XA8Qpzj48D0Pkw/DOpgJZ7lQE?=
	=?us-ascii?Q?jGP1Eog5YMlRsWFfanUQ5BptpJs6f/h/RmxaZ+NflmOpolaIRJYtYFU3dtgr?=
	=?us-ascii?Q?e/t4ef/7bj/fjlDttDcZ07gLy47EZo8rZ4n9XrBEvQLdL2VrXe+JBzkLHhXn?=
	=?us-ascii?Q?G2uivNFqmODqOsxnUxAjIcJQuPeqTIZbyLBVZiQOJ2dPtqmhIU2fylx7TG4Y?=
	=?us-ascii?Q?bvPyeK7PgW54GYGG2UVBhxn+rlo3NyvHCUORpw4JUr5pLyn+L/tJ/ts0Myva?=
	=?us-ascii?Q?LaEwOR9V4R6XzJzA/l39AT41B+muhEBCTib6XaRNiIgBpczUxj9mUIF1/Vtb?=
	=?us-ascii?Q?Uu/8UPxRKJG1kFa7MlgvQlyaYhs3ejw/frtGtONetbQq3GflEso3v+uc+aRE?=
	=?us-ascii?Q?44sa/VQVBbP2PDYdCbolCp6HBCKSPWjxm/uwR+pkBmfcdMc1gE/YV80E10s5?=
	=?us-ascii?Q?bpA93BhN8otQM0rBq4E2D88k0I8JPQc?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	6:50Sj0ZfRD5zXXYFnLoXq0p3m9V54P8f20mzbavXj9LwADR2CBu6vXZhhZ/ZeLmbLvTxlq7z5AWvHBkmfWhmUxAWDXSxIYJrcMOqLW6QQ+7Q2SmJ9g7sY/WAWf7CbtO9GgCRhuMXjKZoQpJVBsYMXa31C+Zw8vgTNWM93pkfJgu9JVXA5rOWuxVGLQfa7E/QLvDA0ouuiuXy3cEXoVjy7UldAoRuN2HWhP2v/5ByotkhmKYvbuEiiYckWs69sJKDZdvs09NGU+Jxsvf19fqop0McaDMgf9JZ5sVUpZn5o7yf0/u71L3PI/DJ+2uGCt/r7fXU03AOqt61Fgw/eqdJKWaELGaCaazJ7ZcRCNr+Snsk=;
	5:i80e0qmqTpk7Zkdf0cqvlv8jQKyXaC9iz7VXTgL3wPlrrMc5h8oFF2iyMRdPlhA3XhJzsW3nVHB5L6lcPqK8p5DXRX0q82sh5Ojz7JIJs8Awumj7o7Jxz5ZRNSZ1etQ2jfjOQKdDgjM3CcWOqWMhgHuSDp+7f1NDR6Pnl3LqYkc=;
	24:ejOa8E0UHJsS535D9aqK+hQoryI5G0BjtDTRQvhsSL6NKuvrnsQXy9UHj/QFscGCVWjxOEB5ShdBDUu5xFOX0xIBQpQB3cItQew6Zj2ZgSI=;
	7:sCVzngRk++iThjR1MAwcXHk9Qb6aBW4Fh6mIrFddrM/CC21OzBYMpLhdY5rvNKokPQbP/XEjmjLPq0dhxGBNTf45mJF5x8RqXEB3sLbJ6h5RlAgccMV6FXXyzl/89aNfh1Gz2RGq7wwNYIoeFSIjSISo+Cd5OWDdqNHpCklAZIZ6Umvt+t5BzDtMCO4N53U2cNzhAbNn3iTMGyNjzwpUKYhr9XBPOls5PFsjrgzL0rNbmvtxxzhLnjW1DPw8fIwh
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:26:52.7567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c80f83-2af8-4016-c7f8-08d55d38a027
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1335
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.73
Subject: [Qemu-arm] [PATCH v5 4/9] aarch64-softmmu.mak: Use an ARM specific
 config
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
X-TUID: 65ZdZCNs0Rse

In preperation for having an ARM and MicroBlaze ZynqMP machine let's
split out the current ARM specific config options.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 default-configs/aarch64-softmmu.mak | 1 +
 hw/arm/Makefile.objs                | 2 +-
 hw/display/Makefile.objs            | 2 +-
 hw/dma/Makefile.objs                | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-=
softmmu.mak
index 24494832cf..9ddccf855e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=3Dy
 CONFIG_DDC=3Dy
 CONFIG_DPCD=3Dy
 CONFIG_XLNX_ZYNQMP=3Dy
+CONFIG_XLNX_ZYNQMP_ARM=3Dy
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2794e086d6..1c896bafb4 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -13,7 +13,7 @@ obj-y +=3D omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-zcu102.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-zcu102.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 551c050a6a..d3a4cb396e 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -40,4 +40,4 @@ virtio-gpu.o-libs +=3D $(VIRGL_LIBS)
 virtio-gpu-3d.o-cflags :=3D $(VIRGL_CFLAGS)
 virtio-gpu-3d.o-libs +=3D $(VIRGL_LIBS)
 obj-$(CONFIG_DPCD) +=3D dpcd.o
-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx_dp.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dp.o
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 0b3a009b87..c2afecbf73 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -9,6 +9,7 @@ common-obj-$(CONFIG_ZYNQ_DEVCFG) +=3D xlnx-zynq-devcfg.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_dma.o
 common-obj-$(CONFIG_STP2000) +=3D sparc32_dma.o
 obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx_dpdma.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dpdma.o

 obj-$(CONFIG_OMAP) +=3D omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) +=3D pxa2xx_dma.o
--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
