Received: by 10.28.173.206 with SMTP id w197csp4577681wme;
        Tue, 16 Jan 2018 15:34:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBovVu3NWnelkfjKdrSlV8yj2Rfm0RAJC+yi7UabrWJ1zDyIYYGpYtXw8PZ8Ta0a2Rkc31/oh
X-Received: by 10.37.61.194 with SMTP id k185mr13872211yba.301.1516145691637;
        Tue, 16 Jan 2018 15:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145691; cv=none;
        d=google.com; s=arc-20160816;
        b=EeI8vrRQeh+Ll3wk2og+pc78cCkfggwATw3NWZD0fjKgebDvP3EeoBa9nOHo3tuXm1
         UdfKQC3SrPdGBSHG4u2pkmKZq3wBFHhk40YPCOq1QtC5DpcCu/U8T9zpfGmAlOF3pTRO
         tqAvB7sJhTFP0Rj5/cJo/42mDb7jKz1rixMQsCLg+jxGBVx9vvrI5jOKg3GyMtAqXpu4
         f1TSq41SDvTGgRRZyqQJExlX2Ai5+OBjNE5O9ulCnkQOUrCcTVEv95GNxHwax1uC5QmG
         r0flKGw+EpQZzkbVQEUy2AK7peW2bsq0To+EPSnBciMq2UgMKmldjnR7ffeAxqfqfgpl
         XtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=2s7rlJdJaEnsoEZle9199FBi14M1+2v79x/reo8m8nE=;
        b=m3RDhRkNeszlF5fcWxgB3BTjrrk/wspOFZpUqrVjg/+D5R9Zcl4Qfjy1UgGDKk3pBS
         e0hLHaHYuvvTPQ0LVB/G2DG2wodOeP4czFFDbXkFcJsTdkjVqjldVoZTlcc9zcJay5W7
         JZtJISq+SSk2t1zfojyb7/+R88VlxNX7hXfu/G+TnxNHEpVYPCAlEiCDdfp1gNzDk1rs
         OmKDGKq5Iod4myLIUmUhzh2vopFut6Exe0AzVl2KYKr2uVG1UqWukmiza8/dE1lCc1bc
         BdLj7nY41mKnQCDibK2fs+bEaJeTxhZEXY4L4P4B5e6vMMnnGMf0v/iiXsLg5W0Zw0SN
         zN7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=3BiK9Kde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si770897ywd.543.2018.01.16.15.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:34:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=3BiK9Kde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebakl-0001yT-2t
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:34:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadM-0004QS-Oi
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadJ-00028v-Ha
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:12 -0500
Received: from mail-co1nam03on0058.outbound.protection.outlook.com
	([104.47.40.58]:36359
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebadJ-00028Q-8X; Tue, 16 Jan 2018 18:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2s7rlJdJaEnsoEZle9199FBi14M1+2v79x/reo8m8nE=;
	b=3BiK9Kde9BL64rBN0Nx1akSu7+Pg57D+0q1o1gzd+Eax4ljstJ8PqfuRx/Qw5bolcvOAJQ3NzC+Hiq7Dk9Bqicsix4TXuj/Y6GTviWXPz/5xfghUJk8qOEz7UnjJkhTSXm6WEY+xufFTuGQEdH5Yf1mfOPHshGEU7laicnx3+cA=
Received: from MWHPR0201CA0076.namprd02.prod.outlook.com
	(2603:10b6:301:75::17) by DM2PR02MB1340.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7;
	Tue, 16 Jan 2018 23:27:06 +0000
Received: from BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by MWHPR0201CA0076.outlook.office365.com
	(2603:10b6:301:75::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:27:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT049.mail.protection.outlook.com (10.152.77.118) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:27:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56010
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0004Nz-Dy; Tue, 16 Jan 2018 15:27:02 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0003M3-Cg; Tue, 16 Jan 2018 15:27:02 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNR0kv031071; Tue, 16 Jan 2018 15:27:00 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadA-0003Lm-5K; Tue, 16 Jan 2018 15:27:00 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:39 -0800
Message-ID: <78ad4020fc887be02bcd4b0147da131f3a95ed47.1516144891.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(376002)(396003)(39380400002)(346002)(39860400002)(2980300002)(438002)(189003)(199004)(2950100002)(6666003)(39060400002)(81166006)(81156014)(9786002)(118296001)(50466002)(48376002)(230783001)(478600001)(106466001)(63266004)(106002)(356003)(36756003)(54906003)(47776003)(110136005)(53936002)(2201001)(305945005)(77096006)(8676002)(4326008)(5890100001)(316002)(76176011)(50226002)(8746002)(7696005)(59450400001)(51416003)(97736004)(5660300001)(2906002)(8936002)(26005)(36386004)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1340; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:ErrorRetry; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT049;
	1:xXxN5D2T7gP3bcbgfX2B1SDiMWAPSViZeIEio3i9G2lpg5bDCENHGttMlCHTi5OlWO3eeODClauQsZrj0PRDgax/N6Zm/cCgpSnLj0DNU6YouTwXq8NG2Pu2anx1M9Kh
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfa77c9b-4f36-440f-b24e-08d55d38a64a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1340; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	3:SyQ36DuN8RXjZu8rAsM4ndi6S9U8jCDNpqCP6rRKafPI1YBSKmy9SMaZtf/LrbFV+fd2Y+jGf36deuOZNjQpiBqoINFhEiXjUpb5R4q+j+uhLLC2q3V3IUSBK+U7mLmm3vuH1k9dTFiDzNvXJjmyOETcOxyEhV9wmjkKAIWzwY0/pgAitfmfKtjoOY9m2/jxxkCersd27wS0d//neqxHYZuqVxijDOB0ATFluA+wPF3USKT0IL40aqVDW3JVOZZWcOecx6aMNVGhb+WR38NdPRKgnOpjfEjqIQYk5l8j0safiCyl6Y3vnXm2yeZcUVDfQ1erJBwjn0VM3r/mQ4/PoNCfNdaXlbbEDUfiMk6oVfY=;
	25:RYXnqKpCiBz/8oIj+Vat9UmcZIKqkT8pveMaAAr8AfJOtmNJJqiuZ7NxWH2WpCp8ma7fIHCsKPVfxKT6IajeVrPBYhT5pqOlshp4vIE4uUWA7HwsuUKmXyLDk2wBL8vydvRDTGejZFxnHTUcsH3nyHvG7FMId2Jv1g9rylfE39qvpLvb0Kx/aGq453ZmgauEvZmCSynrmZtYvIbaEPadBEKufRVTxzke3BJvnHUhEWYCtOH9747JPivHmb6c/iaRdg93eZ5ReGjgV8hNlKxd0xZx0SoGjRl3fDi7qLPrUaKV4iPN9cEMuf7HibagKMVQIZD/wabNN2CQK4AFPluTn4203CM2/28ccRhVHdh3e1E=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1340:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	31:OrtIOHUpIy0EVIvhv3CcciiJPKBLg4HVnJ5UtxBKvAeiW2Q8ReUYw/YRzveysmtBvU1I+SRH3ZTY2cLGRaiGfmrH+QgtiwQ/BEa1ZcdR+SLNRZFJE5JOkWdMluhuE+1bLWxZRxVVJQHpp0nhN5H38S8x3ekuUr1BMAG3S5ZqpcKccarhUi06mbZAdrOVvMSyIcK81nHYsTs7S7zIWtAd9loLZks1yl/4wa5oaVEQHlc=;
	20:ELeE51zIqDbGXw8Q6/q8pZjnM0uoUhQwl6/NXYktdvYuzc0DNx+0bBFZAjUV9+OkpCcMNohY3NvVfZJN6m7a5CNuldTTBw1AIZ7zVNIe/qUz4n3NZvAuz++YdO4zuMy/5VjKqwL6YL4nnReozOw5X9oIif2FsLswlV3bmMxigl1Prl73sW6dT8rAhdYBHnNjLO+FlDCOuojd5vUB5v6lc4r5rRjseIrEKB9i+m69LIeSTVK2y8FgfACrffrprUsVZX+jH5S8GdOthiZ320C8MCY9CnXWMuIz3vN/EZGKzcAGv3v3NWfpVVmBKcjBUlHTGFm4zXB6k9sKFpsoYnQH7/8r59O/nre8/0sOqAx/bStWzIlZk+5AsNCKdunp//60COxSM+nUlmPnU1hguhimI1dTFaYIALVLPqKey7DAmEvZBU7wotwmEPGaGAVoP15rOzdZUgUNPP02rqKG5sKw8JH0iyZgRcgZoY+PeEuWBuQKbqdVHMR95VsI2anY4fSL
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR02MB13401C065A28F440651484FFDCEA0@DM2PR02MB1340.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3002001)(3231023)(944501161)(6055026)(6041268)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR02MB1340; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1340; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	4:Gdta5ki6e5siL5NexwddN9KwvAXGazEOd0iu0NANVQt2vJapXzLy2lgwQbMxy8rHjbKi1IMwQXMNYR5vIx9+GHFFMHa3VvhEDO1vwy3/aszRJTlNbsz7BAHGmuuaKd3jSRS/8L1png4lq9xOL/IdO58Kb+zgSt6hsrBwEWIHPMAgyo5cWYAmqXdZ7c8c6VKD0fASfEWK9KHjH0piPdOW4B52R9pDksUeoQeHY2ZH013WWTHhsRmKxjjzU6XbJYstgpyDJXHWr+i2HGynQLafMy/qj0bYmSL8mTjB21TOQrdPOvFIHvdcuKasBgJU+75ZoiXZ7p05pFmAn6DW6tA56MWuo57myYI217H0/jXmGdU=
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1340;
	23:/7jFG6hkzFkJvN01yqH5zMQ8zYpwL/5azaliHZy//?=
	=?us-ascii?Q?k1x92fsVzQCqK28dzP/3JYSslyuafNMbi5keEn7/Pf3ZWF8ZWNwsnp1TEB92?=
	=?us-ascii?Q?2YGjazDT76FW0nYrlQVoajNOQxMVIhNZF5owWrbD5munLDtec3H+FWwQ7Jyo?=
	=?us-ascii?Q?TQfwg3degeZn5+F5jfbDSXk+37a2Oq5FbvMIeYnUwPFxyKZjFfd5u/gyDdvt?=
	=?us-ascii?Q?hWImiLL2sUsodaiGZQUZQFlodogI1QlKQX8PLX/LbmaZukAnDWUaNVohD9U3?=
	=?us-ascii?Q?0yG/VFV+h7o4kuNwc3AxKKdB3N4HOb8lR2eqPaJqz9alyVvA/61hy+/3BanT?=
	=?us-ascii?Q?pPa0063pGoQay6PfNLmtGABkHE4Xv/2tNrrCJNr9k0wNW+T7wcJQc019bQH1?=
	=?us-ascii?Q?3o+ZVxs/6j4ODGnxN8AR0LTEAT6K2/ov7j1AQKdOxcJ2KwMVofbYetGOgQEq?=
	=?us-ascii?Q?TY7+irpFiEYESC8FUvA/Dl/s4LFQ6SE+z608XYLeai9Z2u6WOfq1j/yc5Pz4?=
	=?us-ascii?Q?r+JKCV7N2poga6gBABmyfELQHqNXtVTInNDONT52qm6/qTtY09HI9BeuIn4a?=
	=?us-ascii?Q?BllFYHeQAIIzHbBKGuap6ZCoIdg9cIzOfNu7rn3Dk4SLnWj4ScMxSiC28EmY?=
	=?us-ascii?Q?5r1wxmjK1gA4J+BhaoSzmlzcjkEdUERQG5zmgHUpJEn4dAOBgkh0+2k2CFXA?=
	=?us-ascii?Q?FlnybFFV7xCeCwoOygJFiIqy053OHRKcX9kOgSs2/uqHz0zkJ2qLnhUf3dax?=
	=?us-ascii?Q?ZXvlc52oqbj2F4gAsvixLT9Crc6TWiLLJI7kOqN9Hp2kI9V6eOusdJzl5MtC?=
	=?us-ascii?Q?iePGrWH5pTsNXtDRTsEAfvPBltqvkDACtGA+NXq/G5zW/FuuYvIFI4kbmn7S?=
	=?us-ascii?Q?1GbYSNe7Dc1u0XL2ueK1fxx2wdRNUvlXOpDOT8av2HJnsME45XYdnhp0u0m/?=
	=?us-ascii?Q?oTacm9ytwhdzstnhgFtQGspn4GnQNPlA8rJrMiMIRVAzuguloBWK6PKHVrtk?=
	=?us-ascii?Q?lGp82YzBkjnbKwH+6VmzYuI3UrYoTylLCnMKfBP7T0Y0YWqLkDvYYhZDhgYo?=
	=?us-ascii?Q?ZisQzscJYyo3hSpQ2tpqPUddgapLIks2GcEdQ7EiWJGO50mLVPQ+bG9zSBOy?=
	=?us-ascii?Q?YiHWDEH8b93qxsxJ5bktzvin1GsYQVJ3odRtREz9bZQdL/Gqhuf1A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	6:9y5tsEQwjzQ6i2Pn/nM+snQvoEyd50VX1dBYEFGWRpXDPqx62vNDYRi+nXQE7ZZ/+K/Z3vEwKdwOoARGmpaMCTQo+8pls7mdyh7zbUUiGvDg54XPwustWNxTqHm5XnTE4pCAnMEWpR0UwmYkcIi7HD/N29rMtf4vG3zh56iYi3E6ZNV43sXjAFp/5/YLfiJFBqsZYk8GtVkLua9h9yw+ZCIZEkCgO157Cd4g/C+bqJfYParxk5zl808NDjl7c6yUATlmodbIHt6UxznmBGRL/dsyxEfX98C/hodey0xlTfBPuxWQe6dxgkvsyv96D9WV+wyPGKdSsI1SANybkLKx2aL7YV2ZkXI9YxiD1gyGIz8=;
	5:j1MT/MzUMAzPPb8em/qj0Ioye/8TQAvPPUT+Qqh1rmRKXU0ASz/W9gc1swMohVN4QXRF5S9nICdSvSKsyML9hG0Wdncwhn2s8Tbe3MS7Ix3FVvBOCRJnnUVbWo+gNFkFbwxiffwYwkcjlwy3QLF655/1mlkYqVT4/0tdUF2zzrY=;
	24:bgMLyRAmzZrZCnJfD6h03jXsIBr8wsqTfDnqfwNjnJqWhZ2cEpPUTzW69jDTioosG0kISsxt7svmHargnZN4DxuzxK+10a8mfmrnT6/9vpo=;
	7:BUhDS8Pk9VwUOJOwSmWaIRZ+STEvgYs3cVrw/7KBfcFamrP9WH4WWWXJ3fPbarTGMswC0wjBehTUaZewb3aWYbkUcubZ58TnfGENf3aqEFco+LUwgZWtudHBKHLBcUHjIP3Q7do0ahmjJfe8zICe6pF4rAgUWQgR20V0wfLQeCgoT5sFWn/vPDkiOR2oHSOmxikB8sddq4FGqbgDwBVj0G44jqEjDgwaZbw5V2I5pK8RgNC8cxOBPX9W6HUEP1kd
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:27:03.0383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa77c9b-4f36-440f-b24e-08d55d38a64a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1340
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.58
Subject: [Qemu-arm] [PATCH v5 8/9] xlnx-zynqmp-pmu: Connect the IPI device
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
X-TUID: 9jpHFpZkbsJ/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
V4:
 - Move the IPI to the machine instead of the SoC

 hw/microblaze/xlnx-zynqmp-pmu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pm=
u.c
index 828eeedc9f..14b8ed4a43 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "boot.h"

+#include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/intc/xlnx-pmu-iomod-intc.h"

 /* Define the PMU device */
@@ -38,6 +39,15 @@

 #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000

+#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
+
+static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] =3D {
+    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
+};
+static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] =3D {
+    19, 20, 21, 22,
+};
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
@@ -136,6 +146,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *pmu_rom =3D g_new(MemoryRegion, 1);
     MemoryRegion *pmu_ram =3D g_new(MemoryRegion, 1);
+    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
+    qemu_irq irq[32];
+    int i;

     /* Create the ROM */
     memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
@@ -155,6 +168,24 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine=
)
                               &error_abort);
     object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);

+    for (i =3D 0; i < 32; i++) {
+        irq[i] =3D qdev_get_gpio_in(DEVICE(&pmu->intc), i);
+    }
+
+    /* Create and connect the IPI device */
+    for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        ipi[i] =3D g_new0(XlnxZynqMPIPI, 1);
+        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_=
IPI);
+        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
+    }
+
+    for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
+    }
+
     /* Load the kernel */
     microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
                            machine->ram_size,
--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
