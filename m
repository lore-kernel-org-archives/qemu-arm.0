Received: by 10.223.172.38 with SMTP id v35csp1198840wrc;
        Wed, 20 Sep 2017 15:09:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBfXHbe8bdannlMbg1j6PBkbW1j/6SJHPqZXbN1VnhNTLcOUmFnoxlSRc7ep86EQKOkSuvF
X-Received: by 10.233.232.13 with SMTP id a13mr258899qkg.83.1505945357816;
        Wed, 20 Sep 2017 15:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945357; cv=none;
        d=google.com; s=arc-20160816;
        b=s5pC+Lt4TbMiadbjWJERnx2vIfP9d/EBa82na5ztvRvTVCGgjceHCdmzVql7STWxGz
         v2mEba5ptnChCe64zmw+BgEHWpC082pkapfRMUJZHE2cbcsfZHHNptW359NtbgWSu+PZ
         npb7deI33WJb/UPY6Wo95rGcwVkVGqyR8CphSMyClPQ6djpFEf8zMK1MjMFIrgh+wY97
         YGChULsWbLZFXc3vUak+wuZwO8Wgsxp4yw2tzEjoYJU8kIw76Q8N4Kaqp3nDapTu4tIX
         4lEVKmHB6cfPm5aus8wp2fIlclhihVUeYMa3YE2uA2WpcQTYvVlCOwtvamc3Srwb7Pul
         9rtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=3ZqkR+YXndSB/HweNqMSMeXD6ktPmdO63Po/LqRhGbU=;
        b=k7Wr9vkb2xhz03cKU449uyBY13IVCAy3Zk3aH+k5VAAflFohlMeAG+oNBNCQDdEfQY
         m9ghBwcOhLu9yDIAVRf8khJOGmuWJBSI30x8oEza8NCOa1rpTTGgnVNv00ie/fP90GJ6
         8sPtYxrl0YO2XQRBiabmOktcJeKAl+Mhw54dl2vw+gotn9gOrERU9C9PK4CmhpKeNhU7
         2//HRZb97GeDz9kesBUCzXautDDR/yc3vZ3mKb9WtM4Ak0TSN+QtCdKeQeZXZwDn0joT
         pgoh3KVCtJhEfu03GEEZyZRkymgYCMLG4BuvhHYdOnoHyswFOk4+6Ak9yj308djfIGQf
         NVcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=qoxWUg1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h23si2760175qtb.281.2017.09.20.15.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=qoxWUg1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dunBD-0003yH-8c
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:09:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7j-0000xj-G3
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7f-0008P6-FA
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:39 -0400
Received: from mail-by2nam01on0041.outbound.protection.outlook.com
	([104.47.34.41]:56192
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7f-0008L1-1G; Wed, 20 Sep 2017 18:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3ZqkR+YXndSB/HweNqMSMeXD6ktPmdO63Po/LqRhGbU=;
	b=qoxWUg1KBuYCeNd/srwNqAli/saNO8jPtBILVtL9BNQCTFPX3DcpqnUS/q2OnNsJKLMV9IrQ2e2Z3I+cvqd+y0e+T/I9wHxjZD6wbi1uyxuCvPyttadU5zZoKIFj9lQSrWe2X3SKT3GAbr+BKmpyoRbVs2b7Pter/TS5iSV+h/8=
Received: from BN6PR02CA0043.namprd02.prod.outlook.com (10.173.146.157) by
	BLUPR02MB1122.namprd02.prod.outlook.com (10.163.79.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 20 Sep 2017 22:05:32 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by BN6PR02CA0043.outlook.office365.com
	(2603:10b6:404:5f::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7X-0000eR-Qw; Wed, 20 Sep 2017 15:05:27 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7X-0002LI-N1; Wed, 20 Sep 2017 15:05:27 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5N7G003815; Wed, 20 Sep 2017 15:05:23 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7T-0002KY-6Y; Wed, 20 Sep 2017 15:05:23 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:44 -0700
Message-ID: <37d4c6fb8fb41bd8dc04c61c5d604ec8302ed545.1505929556.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1505929556.git.alistair.francis@xilinx.com>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23340.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(199003)(189002)(50986999)(47776003)(36386004)(356003)(76176999)(106466001)(2201001)(2906002)(77096006)(316002)(39060400002)(54906003)(50226002)(5003940100001)(9786002)(63266004)(305945005)(230783001)(118296001)(48376002)(6666003)(4326008)(16586007)(575784001)(50466002)(110136005)(189998001)(478600001)(36756003)(81166006)(2950100002)(8936002)(33646002)(5660300001)(81156014)(8676002)(107986001)(2101003)(309714004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1122; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT008;
	1:BceH9UksX8vZWMgFRH4anIzOHYiPjl7KUd54/iURSjSQwXYWDD307w9v7cR6XvJDqcmpDXXVKeyI1JtGgicWbMkbEHFmrAYBQrB4MTYQ5BbSCt3gV4lryztidabDW42c
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b17423-cb15-412e-e935-08d50073b4a2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR02MB1122; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	3:1L4sPbGTAn3UHL1KEhnLvoao6Ctin50l6s3vg0DLkPKYvLaJnm3lPPQP6FMHWpDiFRZkAGSxhdr+QvQGaI1s7GOX2WadMmau45l/VRm070XE9e37bkoG1lGoMp8C+yM6ohE0uj0270nEeWL1CZEYNMOAjLDyDjWQB6KuCxzOH7llNr4Jj7KACH2GY8+0PGEBMxdLGC4vtHneH8UuawS5Ka4EO9CQCV/zwK8ewgvPMecynDhIX1/g6NMCEVzuItQcdIlvvpmJm8UF339A822aIfHz/H6iYY++WRzmSu1SNZmz+IVhxwL3wU28FGfFlB94eeqBL8EYnjjcLaGFWk1XK53cr0qK93QWETSggwGuxv0=;
	25:tYYREE4BoZCdYSnNnINt/0JjBKxjS+AJr6bhQqtCW0J/FcTdv/AubaQ2i6/BV7A0cAZ3d0z31XgHEtfNlXKyBmtjLXS6bNjzZ6VZBM4i9Q6kmj3GNf1ls0CJtqJjP44CEM2R57Kt1SUShHSaS+WSSqxGO8jmWa5DvhAu5YMxiudee6Hp3fcHumhxOISA26b88UOsPRslnFxpROONXMzuIWpToRdVCMseqG+IhOcyiN4JzzXrL1EN/NRLJ+BkxzVf6RSWUpI8PocSMUem8m143snzUEk3KOInJ+/M0T0humXShaXA7xXk/lsvOGK3gswD/NOqBUIByLFSaKf8Razcjg==
X-MS-TrafficTypeDiagnostic: BLUPR02MB1122:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	31:zxVDVRzPhzQZ89CC7GMmKiFoTuiQpdzNLRw/pM1oQfPzbauebpllRLmDAnA2K9KJvHdKlH6mJDihPGYqHKy7kxkBX3dUmINrmeudm3Kw2uWodtTP436NfqXaydqCbngxsWTcBUS4drGTWLew/C2e1+FDyOSTm2xxh3FAuKWCZIRuEnGOpSXCV426zfGY4wcHt59+q5lg9sYNS1zavFE1KpXzom86+tRIj8hI+Co0KMo=;
	20:OnszwSerLkQiPUvd9fjaJnjgTqIeN1fdL9nmkQ3jcmSC5qyuUGREjlda+k+j7xXJ3bX32Qp1xEjT3iamYfsUiC1GuXYeKI1LMw8JpwzmGDN1wplupqrSMg3DxcU2YqOYVpzz3kjGAvfsFokMxiKVZBoxQ6RdGeERz6491qeeOm16WvO0zALfOkhevMA6ysHxL7Gz50NU7Fat1l8teijDrDedh/znhBjF9DbuJLCvbtSkUE6sRkkkJo/B3d9McOmJM9B8/GsREsU1Z+KzAOO1zWiHz6KrEVeUcamcB3Fx6Sw3UmgBSR+/bal7QoubKWA5sl1RzhJHO8NP8SUHczqUjldLwk9gYfJ05X30876PJuhuo+CQrbolbrDALPbxFK/g5lt7KKUFoKN1Q1r+j/QdmI0iH3v/cJwHeDaXKG1wBlBmsIhn4cG+lXuzjsEgS0pC0v91XV3KsEfPzUUm6tc7iXphUjOJHWxJVSdcWwH2/PMiMfwlDfy0O3psXfLgB1sP
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BLUPR02MB1122D4EBDF5B956738C6E2FEDC610@BLUPR02MB1122.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR02MB1122; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR02MB1122; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	4:N1sBeAoistP1PKxJc9+weOZk2MGdbGhibxn3siz8WqG5SD7uqb/r6C09e3/u/pS8IfuLXdyx+lqA1/2MykuVCUsDEZBQSeECIpssOfENuKEFNvlKPrJBn5uFVOno9G3WFTNlVjgfaedQShN8MHDLmrbZqx8xshBWyp+CTCBwC7bSmKX84FYI3CMpESecKVzh6vo0lcKn7B5l9y5ckzLWaP0m82bwT486+4Kug6VhHmxNH6jiozcWvISBEKgugbnDdzQ6GUxu9/vuVDqakgdx1Sw7u67flLg6jkvjElKWBcg=
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1122;
	23:3UPNfSJ/OMVq/HPt9RQimZuWyJqB4n3yWEkUQyX+G?=
	=?us-ascii?Q?Awhx9cyAXTet8qGSD402FPuo6cR/9EUCGHru1zm+EcRlS3+EiaNE2/ZE8iQ5?=
	=?us-ascii?Q?zsfpdpP8a6PoJrd/t3GrBMwr4RHb6Tn50sY+CbDfnnAYNq3132NkAlOderPZ?=
	=?us-ascii?Q?V07blPH8ydKemisgTdvHcAYQb3AMwHArbSyz3zLeLtKGca1VnJV1tiphL/Gk?=
	=?us-ascii?Q?SJusgfTCr6/l7HjYv9H2PIW1u72Zpri4qVw4Ny9pgUXIKy2ugA4xoqB5FbDh?=
	=?us-ascii?Q?+8HRPJRcp0CeJ3hyi1AISvOeMEHysNbOJCQokmm9+blgAgACsbEroy3q0wm0?=
	=?us-ascii?Q?FfEnDVP9xQCp2UAuHaqTyDH86eJMAz8xO8vdwizMTAISJqFvPMV3dScsaXOK?=
	=?us-ascii?Q?G7uoyFQbAcLB1bpqAaFKnlT8Ae0iPe3jGcmLWquq4p/0Eoi4gp0z3N7wdSzi?=
	=?us-ascii?Q?GVGeUaOjBaU1YaduAHq+/e240A64cUmLOp8Ru70ajfUJZHPkwKuKTHNVbNmf?=
	=?us-ascii?Q?4HR58742Ak6u053CDcxgO1rn+WoxoJva+Um6GTpL5hC7YJ80iJyHLXM9kVr8?=
	=?us-ascii?Q?kt0mJ9AOYmTEcyMMwPvsNJ8KAZwiJQDcCC7nuHMnEnGvA7cUSpD3OSLhXYBk?=
	=?us-ascii?Q?g/3GtsuWfaojFJN5tSd/bHxyDtH9Z2X3GF9Z/jjLw2dGrGqyVrvjhA5qIvUf?=
	=?us-ascii?Q?QInuVAtwjS+zpSqHvJMIauiQmV1duS1qZo6VzwL+K7aZ8ieCwv02mCY70LJl?=
	=?us-ascii?Q?uM40bzQyV4WrHi2o8h7V4aawygc83ZVyqcBzH82OSdmjv2+LrQmbpLIHeM1Z?=
	=?us-ascii?Q?NEzjmCEIkoQF0K/K73uBsgn8ct3OZulbWNIb9SCEJ1tyS8e+K8+OBViz9WGR?=
	=?us-ascii?Q?cuIcxZ+Tz1O/4L2beOO4KpDszsr1Gt74s7pwd+cHh+My++bzBhhXzuyY20Fx?=
	=?us-ascii?Q?FsRdGECc91xZzNoHzocvK3+X/BcqRf/x5/6IK9T8ws+j1xeTD5+WEKNlNZ5a?=
	=?us-ascii?Q?4snzr+zhIE++I2ojYHbYuK4MBrMFOreq5YqVE4ZojuhdmkttUFMaIL+TjH+O?=
	=?us-ascii?Q?/o1C8jhEbUWcvMQLZ7HHWpbLKoo7whQ7lx4FMxCZHrvpouimdZrJUdwR9V7E?=
	=?us-ascii?Q?Xv4/siJQBM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	6:VezH5n3A9xVl76Jyu5209wPHgRvE0bhSHJhfBtW2JHmdphuXXB0HM3jqjSwlRZc6U1jICN0xRdvukNtH5XhN979KGYvkgORVEG8owHG9eUdx9rZ43kVwbvWBxmOSV6s+Yrd165RcPK+onRg1dIWWJoGbb0fthG+wfpDG1THRINJlt6tQhP2KdJOK1E8lybjB4V98ZuA8UULfRyJy/6PAVZnbemHH4ClfQAlU2Zy4VansAsQhryMz09VrxBEZ/2YRVQlA6zOEcpejXIS3pCv+N4A0RYehCIUWxyZzvYfwSvP+AIZhx6twINaKweF5RvFmiTB27nYS8RegbfOI4MfuOg==;
	5:WBYS1hMevKvBPpgnP6OtOQEJn+ORLnV2wUQiBoDFTHRnjQ1ckQf8rsdsfSV36Tyr4+ER19kX/GhNwwm9n9Gf8bg6JTvnchKv6OdFlQi3ebnT0UnENQ9MtS75bb9gPF8Hcam48qn/lLoCc0ZixbHZ3w==;
	24:4YPHa4aQnDgNIXtTbQ0LUh9FCMFQkc6Zl/LzLHsGlKQczSmK16l8he3GYGnPAcRn3Pfz/uuGceTEeara+VDfsDHQdMQVgQKJTxKFczoRy6o=;
	7:kGSGJninRT8l2ULnVUepfnvo0dqppi4i7t06RvVq1F7Gt2Nkb32B46VPVdg7iRdEy7AS8jpk9Yr8eUESwcYkSVgGNx7JOGMqb8kR92PWlKEaZ8/xFPY7275WIimQyfde8XFS8Lgd7Yz6Oiqu/vv2NwKGFEt/G91XCCDbREWX/YiZRuZOgCyy9AQ1o6dyMEiqLjTAGIkN/pAFeMjGxOkO5nr01jkhQvrfBzieLtrHE38=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:28.8982 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1122
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.41
Subject: [Qemu-arm] [PATCH v3 4/8] xlnx-pmu-iomod-intc: Add the PMU
 Interrupt controller
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
X-TUID: YdNrLtTxXNck

Add the PMU IO Module Interrupt controller device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 default-configs/microblaze-softmmu.mak |   1 +
 hw/intc/Makefile.objs                  |   1 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 4 files changed, 614 insertions(+)
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h

diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/microblaze-softmmu.mak
index ce2630818a..7fca8e4c99 100644
--- a/default-configs/microblaze-softmmu.mak
+++ b/default-configs/microblaze-softmmu.mak
@@ -9,3 +9,4 @@ CONFIG_XILINX_SPI=y
 CONFIG_XILINX_ETHLITE=y
 CONFIG_SSI=y
 CONFIG_SSI_M25P80=y
+CONFIG_XLNX_ZYNQMP=y
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 78426a7daf..0fce61e2ce 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_I8259) += i8259_common.o i8259.o
 common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
 common-obj-$(CONFIG_IMX) += imx_avic.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc.c
new file mode 100644
index 0000000000..4ec7991f4f
--- /dev/null
+++ b/hw/intc/xlnx-pmu-iomod-intc.c
@@ -0,0 +1,554 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
+ *
+ * Copyright (c) 2013 Xilinx Inc
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
+#ifndef XLNX_PMU_IO_INTC_ERR_DEBUG
+#define XLNX_PMU_IO_INTC_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do {\
+    if (XLNX_PMU_IO_INTC_ERR_DEBUG >= lvl) {\
+        qemu_log(TYPE_XLNX_PMU_IO_INTC ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(IRQ_MODE, 0xc)
+REG32(GPO0, 0x10)
+    FIELD(GPO0, MAGIC_WORD_1, 24, 8)
+    FIELD(GPO0, MAGIC_WORD_2, 16, 8)
+    FIELD(GPO0, FT_INJECT_FAILURE, 13, 3)
+    FIELD(GPO0, DISABLE_RST_FTSM, 12, 1)
+    FIELD(GPO0, RST_FTSM, 11, 1)
+    FIELD(GPO0, CLR_FTSTS, 10, 1)
+    FIELD(GPO0, RST_ON_SLEEP, 9, 1)
+    FIELD(GPO0, DISABLE_TRACE_COMP, 8, 1)
+    FIELD(GPO0, PIT3_PRESCALE, 7, 1)
+    FIELD(GPO0, PIT2_PRESCALE, 5, 2)
+    FIELD(GPO0, PIT1_PRESCALE, 3, 2)
+    FIELD(GPO0, PIT0_PRESCALE, 1, 2)
+    FIELD(GPO0, DEBUG_REMAP, 0, 1)
+REG32(GPO1, 0x14)
+    FIELD(GPO1, MIO_5, 5, 1)
+    FIELD(GPO1, MIO_4, 4, 1)
+    FIELD(GPO1, MIO_3, 3, 1)
+    FIELD(GPO1, MIO_2, 2, 1)
+    FIELD(GPO1, MIO_1, 1, 1)
+    FIELD(GPO1, MIO_0, 0, 1)
+REG32(GPO2, 0x18)
+    FIELD(GPO2, DAP_RPU_WAKE_ACK, 9, 1)
+    FIELD(GPO2, DAP_FP_WAKE_ACK, 8, 1)
+    FIELD(GPO2, PS_STATUS, 7, 1)
+    FIELD(GPO2, PCAP_EN, 6, 1)
+REG32(GPO3, 0x1c)
+    FIELD(GPO3, PL_GPO_31, 31, 1)
+    FIELD(GPO3, PL_GPO_30, 30, 1)
+    FIELD(GPO3, PL_GPO_29, 29, 1)
+    FIELD(GPO3, PL_GPO_28, 28, 1)
+    FIELD(GPO3, PL_GPO_27, 27, 1)
+    FIELD(GPO3, PL_GPO_26, 26, 1)
+    FIELD(GPO3, PL_GPO_25, 25, 1)
+    FIELD(GPO3, PL_GPO_24, 24, 1)
+    FIELD(GPO3, PL_GPO_23, 23, 1)
+    FIELD(GPO3, PL_GPO_22, 22, 1)
+    FIELD(GPO3, PL_GPO_21, 21, 1)
+    FIELD(GPO3, PL_GPO_20, 20, 1)
+    FIELD(GPO3, PL_GPO_19, 19, 1)
+    FIELD(GPO3, PL_GPO_18, 18, 1)
+    FIELD(GPO3, PL_GPO_17, 17, 1)
+    FIELD(GPO3, PL_GPO_16, 16, 1)
+    FIELD(GPO3, PL_GPO_15, 15, 1)
+    FIELD(GPO3, PL_GPO_14, 14, 1)
+    FIELD(GPO3, PL_GPO_13, 13, 1)
+    FIELD(GPO3, PL_GPO_12, 12, 1)
+    FIELD(GPO3, PL_GPO_11, 11, 1)
+    FIELD(GPO3, PL_GPO_10, 10, 1)
+    FIELD(GPO3, PL_GPO_9, 9, 1)
+    FIELD(GPO3, PL_GPO_8, 8, 1)
+    FIELD(GPO3, PL_GPO_7, 7, 1)
+    FIELD(GPO3, PL_GPO_6, 6, 1)
+    FIELD(GPO3, PL_GPO_5, 5, 1)
+    FIELD(GPO3, PL_GPO_4, 4, 1)
+    FIELD(GPO3, PL_GPO_3, 3, 1)
+    FIELD(GPO3, PL_GPO_2, 2, 1)
+    FIELD(GPO3, PL_GPO_1, 1, 1)
+    FIELD(GPO3, PL_GPO_0, 0, 1)
+REG32(GPI0, 0x20)
+    FIELD(GPI0, RFT_ECC_FATAL_ERR, 31, 1)
+    FIELD(GPI0, RFT_VOTER_ERR, 30, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_23, 29, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_13, 28, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_12, 27, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_B, 26, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_B, 25, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_B, 24, 1)
+    FIELD(GPI0, RFT_MISMATCH_STATE, 23, 1)
+    FIELD(GPI0, RFT_MISMATCH_CPU, 22, 1)
+    FIELD(GPI0, RFT_SLEEP_RESET, 19, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_A, 18, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_A, 17, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_A, 16, 1)
+    FIELD(GPI0, NFT_ECC_FATAL_ERR, 15, 1)
+    FIELD(GPI0, NFT_VOTER_ERR, 14, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_23, 13, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_13, 12, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_12, 11, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_B, 10, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_B, 9, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_B, 8, 1)
+    FIELD(GPI0, NFT_MISMATCH_STATE, 7, 1)
+    FIELD(GPI0, NFT_MISMATCH_CPU, 6, 1)
+    FIELD(GPI0, NFT_SLEEP_RESET, 3, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_A, 2, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_A, 1, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_A, 0, 1)
+REG32(GPI1, 0x24)
+    FIELD(GPI1, APB_AIB_ERROR, 31, 1)
+    FIELD(GPI1, AXI_AIB_ERROR, 30, 1)
+    FIELD(GPI1, ERROR_2, 29, 1)
+    FIELD(GPI1, ERROR_1, 28, 1)
+    FIELD(GPI1, ACPU_3_DBG_PWRUP, 23, 1)
+    FIELD(GPI1, ACPU_2_DBG_PWRUP, 22, 1)
+    FIELD(GPI1, ACPU_1_DBG_PWRUP, 21, 1)
+    FIELD(GPI1, ACPU_0_DBG_PWRUP, 20, 1)
+    FIELD(GPI1, FPD_WAKE_GIC_PROXY, 16, 1)
+    FIELD(GPI1, MIO_WAKE_5, 15, 1)
+    FIELD(GPI1, MIO_WAKE_4, 14, 1)
+    FIELD(GPI1, MIO_WAKE_3, 13, 1)
+    FIELD(GPI1, MIO_WAKE_2, 12, 1)
+    FIELD(GPI1, MIO_WAKE_1, 11, 1)
+    FIELD(GPI1, MIO_WAKE_0, 10, 1)
+    FIELD(GPI1, DAP_RPU_WAKE, 9, 1)
+    FIELD(GPI1, DAP_FPD_WAKE, 8, 1)
+    FIELD(GPI1, USB_1_WAKE, 7, 1)
+    FIELD(GPI1, USB_0_WAKE, 6, 1)
+    FIELD(GPI1, R5_1_WAKE, 5, 1)
+    FIELD(GPI1, R5_0_WAKE, 4, 1)
+    FIELD(GPI1, ACPU_3_WAKE, 3, 1)
+    FIELD(GPI1, ACPU_2_WAKE, 2, 1)
+    FIELD(GPI1, ACPU_1_WAKE, 1, 1)
+    FIELD(GPI1, ACPU_0_WAKE, 0, 1)
+REG32(GPI2, 0x28)
+    FIELD(GPI2, VCC_INT_FP_DISCONNECT, 31, 1)
+    FIELD(GPI2, VCC_INT_DISCONNECT, 30, 1)
+    FIELD(GPI2, VCC_AUX_DISCONNECT, 29, 1)
+    FIELD(GPI2, DBG_ACPU3_RST_REQ, 23, 1)
+    FIELD(GPI2, DBG_ACPU2_RST_REQ, 22, 1)
+    FIELD(GPI2, DBG_ACPU1_RST_REQ, 21, 1)
+    FIELD(GPI2, DBG_ACPU0_RST_REQ, 20, 1)
+    FIELD(GPI2, CP_ACPU3_RST_REQ, 19, 1)
+    FIELD(GPI2, CP_ACPU2_RST_REQ, 18, 1)
+    FIELD(GPI2, CP_ACPU1_RST_REQ, 17, 1)
+    FIELD(GPI2, CP_ACPU0_RST_REQ, 16, 1)
+    FIELD(GPI2, DBG_RCPU1_RST_REQ, 9, 1)
+    FIELD(GPI2, DBG_RCPU0_RST_REQ, 8, 1)
+    FIELD(GPI2, R5_1_SLEEP, 5, 1)
+    FIELD(GPI2, R5_0_SLEEP, 4, 1)
+    FIELD(GPI2, ACPU_3_SLEEP, 3, 1)
+    FIELD(GPI2, ACPU_2_SLEEP, 2, 1)
+    FIELD(GPI2, ACPU_1_SLEEP, 1, 1)
+    FIELD(GPI2, ACPU_0_SLEEP, 0, 1)
+REG32(GPI3, 0x2c)
+    FIELD(GPI3, PL_GPI_31, 31, 1)
+    FIELD(GPI3, PL_GPI_30, 30, 1)
+    FIELD(GPI3, PL_GPI_29, 29, 1)
+    FIELD(GPI3, PL_GPI_28, 28, 1)
+    FIELD(GPI3, PL_GPI_27, 27, 1)
+    FIELD(GPI3, PL_GPI_26, 26, 1)
+    FIELD(GPI3, PL_GPI_25, 25, 1)
+    FIELD(GPI3, PL_GPI_24, 24, 1)
+    FIELD(GPI3, PL_GPI_23, 23, 1)
+    FIELD(GPI3, PL_GPI_22, 22, 1)
+    FIELD(GPI3, PL_GPI_21, 21, 1)
+    FIELD(GPI3, PL_GPI_20, 20, 1)
+    FIELD(GPI3, PL_GPI_19, 19, 1)
+    FIELD(GPI3, PL_GPI_18, 18, 1)
+    FIELD(GPI3, PL_GPI_17, 17, 1)
+    FIELD(GPI3, PL_GPI_16, 16, 1)
+    FIELD(GPI3, PL_GPI_15, 15, 1)
+    FIELD(GPI3, PL_GPI_14, 14, 1)
+    FIELD(GPI3, PL_GPI_13, 13, 1)
+    FIELD(GPI3, PL_GPI_12, 12, 1)
+    FIELD(GPI3, PL_GPI_11, 11, 1)
+    FIELD(GPI3, PL_GPI_10, 10, 1)
+    FIELD(GPI3, PL_GPI_9, 9, 1)
+    FIELD(GPI3, PL_GPI_8, 8, 1)
+    FIELD(GPI3, PL_GPI_7, 7, 1)
+    FIELD(GPI3, PL_GPI_6, 6, 1)
+    FIELD(GPI3, PL_GPI_5, 5, 1)
+    FIELD(GPI3, PL_GPI_4, 4, 1)
+    FIELD(GPI3, PL_GPI_3, 3, 1)
+    FIELD(GPI3, PL_GPI_2, 2, 1)
+    FIELD(GPI3, PL_GPI_1, 1, 1)
+    FIELD(GPI3, PL_GPI_0, 0, 1)
+REG32(IRQ_STATUS, 0x30)
+    FIELD(IRQ_STATUS, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_STATUS, INV_ADDR, 29, 1)
+    FIELD(IRQ_STATUS, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_STATUS, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_STATUS, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_STATUS, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_STATUS, ISO_REQ, 24, 1)
+    FIELD(IRQ_STATUS, FW_REQ, 23, 1)
+    FIELD(IRQ_STATUS, IPI3, 22, 1)
+    FIELD(IRQ_STATUS, IPI2, 21, 1)
+    FIELD(IRQ_STATUS, IPI1, 20, 1)
+    FIELD(IRQ_STATUS, IPI0, 19, 1)
+    FIELD(IRQ_STATUS, RTC_ALARM, 18, 1)
+    FIELD(IRQ_STATUS, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_STATUS, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_STATUS, GPI3, 14, 1)
+    FIELD(IRQ_STATUS, GPI2, 13, 1)
+    FIELD(IRQ_STATUS, GPI1, 12, 1)
+    FIELD(IRQ_STATUS, GPI0, 11, 1)
+    FIELD(IRQ_STATUS, PIT3, 6, 1)
+    FIELD(IRQ_STATUS, PIT2, 5, 1)
+    FIELD(IRQ_STATUS, PIT1, 4, 1)
+    FIELD(IRQ_STATUS, PIT0, 3, 1)
+REG32(IRQ_PENDING, 0x34)
+    FIELD(IRQ_PENDING, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_PENDING, INV_ADDR, 29, 1)
+    FIELD(IRQ_PENDING, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_PENDING, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_PENDING, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_PENDING, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_PENDING, ISO_REQ, 24, 1)
+    FIELD(IRQ_PENDING, FW_REQ, 23, 1)
+    FIELD(IRQ_PENDING, IPI3, 22, 1)
+    FIELD(IRQ_PENDING, IPI2, 21, 1)
+    FIELD(IRQ_PENDING, IPI1, 20, 1)
+    FIELD(IRQ_PENDING, IPI0, 19, 1)
+    FIELD(IRQ_PENDING, RTC_ALARM, 18, 1)
+    FIELD(IRQ_PENDING, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_PENDING, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_PENDING, GPI3, 14, 1)
+    FIELD(IRQ_PENDING, GPI2, 13, 1)
+    FIELD(IRQ_PENDING, GPI1, 12, 1)
+    FIELD(IRQ_PENDING, GPI0, 11, 1)
+    FIELD(IRQ_PENDING, PIT3, 6, 1)
+    FIELD(IRQ_PENDING, PIT2, 5, 1)
+    FIELD(IRQ_PENDING, PIT1, 4, 1)
+    FIELD(IRQ_PENDING, PIT0, 3, 1)
+REG32(IRQ_ENABLE, 0x38)
+    FIELD(IRQ_ENABLE, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ENABLE, INV_ADDR, 29, 1)
+    FIELD(IRQ_ENABLE, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ENABLE, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ENABLE, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ENABLE, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ENABLE, ISO_REQ, 24, 1)
+    FIELD(IRQ_ENABLE, FW_REQ, 23, 1)
+    FIELD(IRQ_ENABLE, IPI3, 22, 1)
+    FIELD(IRQ_ENABLE, IPI2, 21, 1)
+    FIELD(IRQ_ENABLE, IPI1, 20, 1)
+    FIELD(IRQ_ENABLE, IPI0, 19, 1)
+    FIELD(IRQ_ENABLE, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ENABLE, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ENABLE, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ENABLE, GPI3, 14, 1)
+    FIELD(IRQ_ENABLE, GPI2, 13, 1)
+    FIELD(IRQ_ENABLE, GPI1, 12, 1)
+    FIELD(IRQ_ENABLE, GPI0, 11, 1)
+    FIELD(IRQ_ENABLE, PIT3, 6, 1)
+    FIELD(IRQ_ENABLE, PIT2, 5, 1)
+    FIELD(IRQ_ENABLE, PIT1, 4, 1)
+    FIELD(IRQ_ENABLE, PIT0, 3, 1)
+REG32(IRQ_ACK, 0x3c)
+    FIELD(IRQ_ACK, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ACK, INV_ADDR, 29, 1)
+    FIELD(IRQ_ACK, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ACK, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ACK, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ACK, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ACK, ISO_REQ, 24, 1)
+    FIELD(IRQ_ACK, FW_REQ, 23, 1)
+    FIELD(IRQ_ACK, IPI3, 22, 1)
+    FIELD(IRQ_ACK, IPI2, 21, 1)
+    FIELD(IRQ_ACK, IPI1, 20, 1)
+    FIELD(IRQ_ACK, IPI0, 19, 1)
+    FIELD(IRQ_ACK, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ACK, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ACK, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ACK, GPI3, 14, 1)
+    FIELD(IRQ_ACK, GPI2, 13, 1)
+    FIELD(IRQ_ACK, GPI1, 12, 1)
+    FIELD(IRQ_ACK, GPI0, 11, 1)
+    FIELD(IRQ_ACK, PIT3, 6, 1)
+    FIELD(IRQ_ACK, PIT2, 5, 1)
+    FIELD(IRQ_ACK, PIT1, 4, 1)
+    FIELD(IRQ_ACK, PIT0, 3, 1)
+REG32(PIT0_PRELOAD, 0x40)
+REG32(PIT0_COUNTER, 0x44)
+REG32(PIT0_CONTROL, 0x48)
+    FIELD(PIT0_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT0_CONTROL, EN, 0, 1)
+REG32(PIT1_PRELOAD, 0x50)
+REG32(PIT1_COUNTER, 0x54)
+REG32(PIT1_CONTROL, 0x58)
+    FIELD(PIT1_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT1_CONTROL, EN, 0, 1)
+REG32(PIT2_PRELOAD, 0x60)
+REG32(PIT2_COUNTER, 0x64)
+REG32(PIT2_CONTROL, 0x68)
+    FIELD(PIT2_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT2_CONTROL, EN, 0, 1)
+REG32(PIT3_PRELOAD, 0x70)
+REG32(PIT3_COUNTER, 0x74)
+REG32(PIT3_CONTROL, 0x78)
+    FIELD(PIT3_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT3_CONTROL, EN, 0, 1)
+
+static void xlnx_pmu_io_irq_update(XlnxPMUIOIntc *s)
+{
+    bool irq_out;
+
+    s->regs[R_IRQ_PENDING] = s->regs[R_IRQ_STATUS] & s->regs[R_IRQ_ENABLE];
+    irq_out = !!s->regs[R_IRQ_PENDING];
+
+    DB_PRINT("Setting IRQ output = %d\n", irq_out);
+
+    qemu_set_irq(s->parent_irq, irq_out);
+}
+
+static void xlnx_pmu_io_irq_enable_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(reg->opaque);
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_irq_ack_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(reg->opaque);
+    uint32_t val = val64;
+
+    /* Only clear */
+    val &= s->regs[R_IRQ_STATUS];
+    s->regs[R_IRQ_STATUS] ^= val;
+
+    /* Active level triggered interrupts stay high.  */
+    s->regs[R_IRQ_STATUS] |= s->irq_raw & ~s->cfg.level_edge;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const RegisterAccessInfo xlnx_pmu_io_intc_regs_info[] = {
+    {   .name = "IRQ_MODE",  .addr = A_IRQ_MODE,
+        .rsvd = 0xffffffff,
+    },{ .name = "GPO0",  .addr = A_GPO0,
+    },{ .name = "GPO1",  .addr = A_GPO1,
+        .rsvd = 0xffffffc0,
+    },{ .name = "GPO2",  .addr = A_GPO2,
+        .rsvd = 0xfffffc3f,
+    },{ .name = "GPO3",  .addr = A_GPO3,
+    },{ .name = "GPI0",  .addr = A_GPI0,
+        .rsvd = 0x300030,
+        .ro = 0xffcfffcf,
+    },{ .name = "GPI1",  .addr = A_GPI1,
+        .rsvd = 0xf0e0000,
+        .ro = 0xf0f1ffff,
+    },{ .name = "GPI2",  .addr = A_GPI2,
+        .rsvd = 0x1f00fcc0,
+        .ro = 0xe0ff033f,
+    },{ .name = "GPI3",  .addr = A_GPI3,
+        .ro = 0xffffffff,
+    },{ .name = "IRQ_STATUS",  .addr = A_IRQ_STATUS,
+        .rsvd = 0x40008787,
+        .ro = 0xbfff7878,
+    },{ .name = "IRQ_PENDING",  .addr = A_IRQ_PENDING,
+        .rsvd = 0x40008787,
+        .ro = 0xdfff7ff8,
+    },{ .name = "IRQ_ENABLE",  .addr = A_IRQ_ENABLE,
+        .rsvd = 0x40008787,
+        .ro = 0x7800,
+        .post_write = xlnx_pmu_io_irq_enable_postw,
+    },{ .name = "IRQ_ACK",  .addr = A_IRQ_ACK,
+        .rsvd = 0x40008787,
+        .post_write = xlnx_pmu_io_irq_ack_postw,
+    },{ .name = "PIT0_PRELOAD",  .addr = A_PIT0_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT0_COUNTER",  .addr = A_PIT0_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT0_CONTROL",  .addr = A_PIT0_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT1_PRELOAD",  .addr = A_PIT1_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT1_COUNTER",  .addr = A_PIT1_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT1_CONTROL",  .addr = A_PIT1_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT2_PRELOAD",  .addr = A_PIT2_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT2_COUNTER",  .addr = A_PIT2_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT2_CONTROL",  .addr = A_PIT2_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT3_PRELOAD",  .addr = A_PIT3_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT3_COUNTER",  .addr = A_PIT3_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT3_CONTROL",  .addr = A_PIT3_CONTROL,
+        .rsvd = 0xfffffffc,
+    }
+};
+
+static void irq_handler(void *opaque, int irq, int level)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(opaque);
+    uint32_t mask = 1 << irq;
+    uint32_t prev = s->irq_raw;
+    uint32_t temp;
+
+    s->irq_raw &= ~mask;
+    s->irq_raw |= (!!level) << irq;
+
+    /* Turn active-low into active-high.  */
+    s->irq_raw ^= (~s->cfg.positive);
+    s->irq_raw &= mask;
+
+    if (s->cfg.level_edge & mask) {
+        /* Edge triggered.  */
+        temp = (prev ^ s->irq_raw) & s->irq_raw;
+    } else {
+        /* Level triggered.  */
+        temp = s->irq_raw;
+    }
+    s->regs[R_IRQ_STATUS] |= temp;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_intc_reset(DeviceState *dev)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const MemoryRegionOps xlnx_pmu_io_intc_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static Property xlnx_pmu_io_intc_properties[] = {
+    DEFINE_PROP_UINT32("intc-intr-size", XlnxPMUIOIntc, cfg.intr_size, 0),
+    DEFINE_PROP_UINT32("intc-level-edge", XlnxPMUIOIntc, cfg.level_edge, 0),
+    DEFINE_PROP_UINT32("intc-positive", XlnxPMUIOIntc, cfg.positive, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xlnx_pmu_io_intc_realize(DeviceState *dev, Error **errp)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(dev);
+
+    /* Internal interrupts are edge triggered?  */
+    s->cfg.level_edge <<= 16;
+    s->cfg.level_edge |= 0xffff;
+
+    /* Internal interrupts are postitive.  */
+    s->cfg.positive <<= 16;
+    s->cfg.positive |= 0xffff;
+
+    /* Max 16 external interrupts.  */
+    assert(s->cfg.intr_size <= 16);
+
+    qdev_init_gpio_in(dev, irq_handler, 16 + s->cfg.intr_size);
+}
+
+static void xlnx_pmu_io_intc_init(Object *obj)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_PMU_IO_INTC,
+                       XlnxPMUIOIntc_R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), xlnx_pmu_io_intc_regs_info,
+                              ARRAY_SIZE(xlnx_pmu_io_intc_regs_info),
+                              s->regs_info, s->regs,
+                              &xlnx_pmu_io_intc_ops,
+                              XLNX_PMU_IO_INTC_ERR_DEBUG,
+                              XlnxPMUIOIntc_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    sysbus_init_irq(sbd, &s->parent_irq);
+}
+
+static const VMStateDescription vmstate_xlnx_pmu_io_intc = {
+    .name = TYPE_XLNX_PMU_IO_INTC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxPMUIOIntc, XlnxPMUIOIntc_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_pmu_io_intc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xlnx_pmu_io_intc_reset;
+    dc->realize = xlnx_pmu_io_intc_realize;
+    dc->vmsd = &vmstate_xlnx_pmu_io_intc;
+    dc->props = xlnx_pmu_io_intc_properties;
+}
+
+static const TypeInfo xlnx_pmu_io_intc_info = {
+    .name          = TYPE_XLNX_PMU_IO_INTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxPMUIOIntc),
+    .class_init    = xlnx_pmu_io_intc_class_init,
+    .instance_init = xlnx_pmu_io_intc_init,
+};
+
+static void xlnx_pmu_io_intc_register_types(void)
+{
+    type_register_static(&xlnx_pmu_io_intc_info);
+}
+
+type_init(xlnx_pmu_io_intc_register_types)
diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xlnx-pmu-iomod-intc.h
new file mode 100644
index 0000000000..3478d8cf6c
--- /dev/null
+++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
@@ -0,0 +1,58 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
+ *
+ * Copyright (c) 2014 Xilinx Inc.
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
+#ifndef XLNX_PMU_IO_INTC_H
+#define XLNX_PMU_IO_INTC_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
+
+#define XLNX_PMU_IO_INTC(obj) \
+     OBJECT_CHECK(XlnxPMUIOIntc, (obj), TYPE_XLNX_PMU_IO_INTC)
+
+/* This is R_PIT3_CONTROL + 1 */
+#define XlnxPMUIOIntc_R_MAX (0x78 + 1)
+
+typedef struct XlnxPMUIOIntc {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    qemu_irq parent_irq;
+
+    struct {
+        uint32_t intr_size;
+        uint32_t level_edge;
+        uint32_t positive;
+    } cfg;
+
+    uint32_t irq_raw;
+
+    uint32_t regs[XlnxPMUIOIntc_R_MAX];
+    RegisterInfo regs_info[XlnxPMUIOIntc_R_MAX];
+} XlnxPMUIOIntc;
+
+#endif /* XLNX_PMU_IO_INTC_H */
-- 
2.11.0

