Received: by 10.223.197.9 with SMTP id q9csp4840572wrf;
        Tue, 17 Oct 2017 10:34:08 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SA8TyH8o/u7/Zf4I5s8+n6aCr9slFkBZ2d13jo5gEU+HsGe656KFiqlGj16oLtAoasTzEd
X-Received: by 10.200.48.199 with SMTP id w7mr4793211qta.54.1508261648142;
        Tue, 17 Oct 2017 10:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261648; cv=none;
        d=google.com; s=arc-20160816;
        b=UJ2s8b/SJHrRLxqbkNpR4Gv/qWOlfcZwGtZga2Gnwi26qOGtEexFwinQqxoGzs67AW
         Yzdp0OjP4bnp9mbQf/Geb47XxBiuBVJsn6qCnBtQMJwFhlx+Lc/7q/b3BGUZF9HijOG7
         eSelngu96eLsGmiLngqS9YQ+QYoELyXkLP6/dUTG4hh3AyPpmnr2Z8vCHe0wHGaP/ES4
         lFL8frh47wbV5zQ5tmREiVIP1740Inx8AOkokYQ1Iji/2HxP2i4NkMTGG2I5kQTDuNKx
         a3qw1/Ea6rfMe1D9nte2nk/YaJrmEHGpsxtwVdg3jRRO0p8NNv4ld8DLWK0VS1fV8Z9E
         Bx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=My0CbJPt8YG43bGUOn+/zYe/NiJoAKZT+h3DL539q/o=;
        b=OTFqTdfLKsH2jx4SmvpY1/GqM//MfLDt8/ZQRwnZuFqsQzYn1myyfC5UJDrBaFydHY
         1WeBQFYrXfBEvVL2wgLyffI5FiTfSlnd8kzL+0ikfPFmr3FBWteqMPnsayDg9oQRD6RN
         n8ivXknaNAcVzxsoed0pSIEMVFl8tEbGaoXPf9gfNIONawB2qfcTScaKlQYde2RJhcE/
         YunXWkM5SFOwfly2nfglIknAxlOUJjwmdBLmNVQK0siYOaazaQqvWiijP35N7Wk7lKQN
         3yFPi29GZQnp3QX8nkTu4JtN4T4CwNk+cUC293p6P7D9BXpEbw58qRDL07KCFMBcHHqR
         9FhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=x1EmD6dk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w185si3920081qkc.84.2017.10.17.10.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=x1EmD6dk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Vkj-00053e-Or
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:34:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkU-0004ws-Lk
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkT-0006L9-P3
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:33:50 -0400
Received: from mail-by2nam01on0073.outbound.protection.outlook.com
	([104.47.34.73]:29520
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkN-0006GS-F8; Tue, 17 Oct 2017 13:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=My0CbJPt8YG43bGUOn+/zYe/NiJoAKZT+h3DL539q/o=;
	b=x1EmD6dk3HN1NoG4cjFzDbDO7uowxDlcmYv95E2SQRgWfN9OC+LJhAo4KUs+wfFvykQsS5bam9f8zgFFWuOLUbaEC+WDnTy69urM7DncC3pdE+doEfVhMMAQTm4Yy35ZCFz1G+5Rcg7/9tstUbzl5BpDcsnL3KUrRKUkc3ym2Gk=
Received: from SN4PR0201CA0001.namprd02.prod.outlook.com (10.161.238.139) by
	CY4PR02MB3384.namprd02.prod.outlook.com (10.165.89.155) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 17 Oct 2017 17:33:40 +0000
Received: from BL2NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0001.outlook.office365.com
	(2603:10b6:803:2b::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.77.21 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT048.mail.protection.outlook.com (10.152.76.109) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55847
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkJ-0003j1-Dr; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkJ-0000mb-88; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkA-0000l6-8S; Tue, 17 Oct 2017 10:33:30 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:41 -0700
Message-ID: <cover.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(36386004)(6666003)(36756003)(189998001)(9786002)(48376002)(8676002)(316002)(8936002)(81156014)(16586007)(50226002)(305945005)(356003)(81166006)(50466002)(5660300001)(54906003)(110136005)(33646002)(106466001)(106002)(63266004)(50986999)(39060400002)(77096006)(4326008)(2906002)(478600001)(47776003)(2201001)(5003940100001)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3384; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT048;
	1:/tGxe/A61T4wNFSFgNW04jssJY8OhrJkKrkXZ0jwgnsgoAIv7x1vQYsFMZXDaIYE/V3izqL5RMmIFyv07EkcjazSjTYDFt+TucHARtq0u7UgLPMqU47r5cBZgDqYZ37y
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9192986e-2dc7-430a-3b53-08d5158534b7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	3:oofTtkZxGr29FGC4AriaQbZM6LtpSE7Wg5AXIg3QCPEsIOd0nC+Kjz8HqAYdOsjEzDnMgEh3zaJFqGrIyI3P6MRX1+g5viX7mMMPJYpnJStXTFmpnB+vkXXZoVi4ZGy/D597tyqzV8uTheOESlx8+/r5qs9b8fYrAa9CZ9Orb2TCjNCf6NQnqoWdvFOq+PXtstWMdB54D9uR15YpeDvAIWqGVsg5pDE3mJs38hUC8O340ZPqs+c/MF6G/z3a3POtBCAh2kb7NMGrOX7shDp2XlUuWZENBLaFJYnTcPmQrDu6kpLRAo/IzWCYTZLGB2ZJJ/hs9Q64Uq1pj8ba0P0yWpezMGqv28U7gPWevXcIscY=;
	25:/BN7DzkQyhEGruYHh9fxJE6DbWPH1q/gwl7OvCZvO5uD9HYQGxVk8pdyTjcAs0WfSteGmmg5USq3azRhliFiEyZNoLmDiim8Zlr4GJ7fusZIr6aBmyXZdj1FXVplAO+EOxzeTBqyo9nVufThOgiAJne9qRxk62eJlTYAeO1HPvfsRqip//gO6tWnZqjmSLTec2CJnseJ+YFE6Bw7fyNkhDPTgBGpsPpH3nc/UptJHE/rmJVtZa7CzaGWdGa4j21OBRVJRYD5KncbtmdtIrOIpb2GpnnfLwq/zFDilwBGBNNqlkc+R7ZhcSirdV162z7eZW8cF4+pGOJNXkrpZ86JEw==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3384:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	31:b9tUiw6CP4klukvqLjCjcgG0gUjgCf+iPvP6FCNn/xgag8UVM9wky5CC/yBNZ43k5DEEDpF3gKUPkaxm0Hjrlf/7/h97QGOkX7P4eYeZGj4lsrysGMZKeOLdWTHXJnyjqDM06o/uXx54tjeFBRNrMRz9m6jzhATfTiPdAZWZx9TtqhAlXVYTkQgfzN/lre2jYVT5Otqn305rNZm8iKg2VFyBPVBv0Zq2hOfoMcyMYQ0=;
	20:UrqeQ0dHiuLarBSQr+6UtmN+Kk1x3sCacJDYQEXMOR8wxFmRGkrFo6c11Ns9IDF8VeUZ8kb2dhrtQ6Oyk+0MGhay/GRAH9jEwwrqV4zEvmnGTOKcQ4kLnuhARgfijVrilQfGsKL4xSTjQfr8Lpbpl7Pzs5FKIknKe+a/HhrZcrGnPiz4ww8tjYYU512nRKOfGLgPzjVuzyxMAp2D10ltqdotDrPR84udmin6CSFMQDXfgTog1mMiFTVnuwDD5f4zxbFqMF1N9nZNlTQDcyTGmDnOax11XU0EBZud9GQFUoDeFoOEfC0qT4NDKV4443tZjh5Vxg+q9Yr7SlffoCnwVDTpsO6IhUidt8MsymCkgdeP2RFJYtUdxtpISfAifHSm0Vjh5WO/xaLe2mddIimWjGVKdx2mE0XeRRujvhHhYmKoWWvS8Y06rCVpgbEq+Qy5/z11c/fEYxwcOqyaodZBppcDX703y/FebJTiL3rEVA8YxqCDNlvJNFhnjjnWOr/a
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(21532816269658);
X-Microsoft-Antispam-PRVS: <CY4PR02MB3384E55CAAA34AF84DCFB7A2DC4C0@CY4PR02MB3384.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123564025)(20161123562025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3384; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	4:XOQfhfDdEM20QFGNpt32jDddOfUZFvEqlrbx7cG31dmIxkfW/Gk+ON0eKm2bQISGpgGq3fgetNu+JWZPqelDtB6FYjGZZTxJBSsAvi+wn27vSIwO/mS01IhxW46jqBlIuUjPUSYfI5T8fVitXrHIvleTIU37KrnUMBRzzH3PSr9Zvtk7EOq2VNr+OklYHDjA0DF7MoK+mYqHq/htv67CYxlmflglAnYLqW1ylqrZYixZMSvuhf4BtapICpZw8eDGABUqV3ZaRpIyGh+fDo0BbYctY2T4ImqfV2IzCLDLRRXDkRpnXkc+OGNiN1qmoSgrWgaHLZpzn0YF7dzP9X5DXw==
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3384;
	23:yI/o1BRgqp18q8/uk89BFwtKR+tXhLrRKVTMK6HGF?=
	=?us-ascii?Q?3/NLrjPLaqzEUQKzFetcgpE+jlVa6FT25OSQXtrJCKXq1UKKWuNwlDMj4QCr?=
	=?us-ascii?Q?+ELI7pUd9nLZPKAct6172hivGui858qacV4FYfsj1ln2c9SggZHf18BA2ofo?=
	=?us-ascii?Q?wdONgZfI/ElK3twVre30c3tRqlLlXlYEfk0HyS/hwaMFEWdyP2I2IWyETbnn?=
	=?us-ascii?Q?v3pLgilvsF29/KwUCt49OqqKhTIvIb+MQ6Wd5DmYF/3XAWw7xUzk/EYeVNuW?=
	=?us-ascii?Q?DcMzoLhwD4JBvDfk2EzwJMHNS90wdUbHgyYouhCRC7V+S3IV2F/SxsU2z79i?=
	=?us-ascii?Q?Xq4JBlR9BIxYXTHXz6h7Fv0UOJji+qSaivKVvtx92AmaiMrnBkEO8IWyr58t?=
	=?us-ascii?Q?cv3cliSL+x3U6+wQown2w6IL8wqCBCb2GUusMDpN4Z7weqvBdaPMAdg5SW5x?=
	=?us-ascii?Q?/wBEFrBPGfelY8ZP/zwBVx4Mn7GBL9B6lS4Vug2rUUwsipQW6CEcbzUZP98H?=
	=?us-ascii?Q?lj9vuI1gOuZ2fp3X83/DoLutcGcR0Tz++XRSx869uWe/N9lPsR/ZHP5GXkDZ?=
	=?us-ascii?Q?58PjCa19qYTuZtpT6qeu+gtCy1+4X4Is8R8t+x2Ozv6sJFOprIsMjzDV7nPg?=
	=?us-ascii?Q?lpO6M2ueXa5mN/SD/IC52zEPGAvpcTEltdncWfWXhgT8XQDCN6SaikdtcwA3?=
	=?us-ascii?Q?isg3F9jPKhxRtYOECB7G5Kj2Qb7IQQtP7zKkceCOKIIeb8D+sinx9pTVOrfV?=
	=?us-ascii?Q?zGEazTypmlq9UTcj5M4Qt3IsIuSSszWkOjch8zNH8Fz4VGdnbTJ8Z6ThAcLY?=
	=?us-ascii?Q?nS+B82QWzz5yr3TVDR4gFbul6KUENRkyMkIGZzzSF7IkC2YHEO+K2R3AAubD?=
	=?us-ascii?Q?Pw72jx+uWT9MYA8IbbraWoEf4qNnhR8d/+UuaT23yzzxHEADBiFlI0fo5fKu?=
	=?us-ascii?Q?MxdSGp2/XLmjc+UsuhOEBnvOs9cJaBgMIY5emNLrL+Ygxbk+VFIOBF9WQBOy?=
	=?us-ascii?Q?cN3GiWRGgOzH751nfnEVI0euV1Unqx4B9RDdQXygEBe1Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	6:74I6dSKC18jlgnFpmyEPYFgn15Gxv+gFFYEub37vJac8nMbecL4cNzX35N2dbAcIvDNsVI6YoddzMHe5VfR1pDnvSqIB7nzTgO6DnBJF6g6eBQg1S0gR4T0zeRmjz6ZfgEvPlLTo+fZi490fgrgubwdGsUvj2/+hoTZiuz6Gx3GJGBQP4GElmh0Bn2ptIAa/0/GYvlt/ePKektAB0NlUW0X4wTLpMS3QgG4m5imJRk3WqPdnxVClrG9M4nwO8JG01EqpLw/tDRetUHEASnDvie+sYvdfSjJkzka0BRypcnBcWnjfyKy9Aa8C8o8EP7DiRYZ+MpPrv1rhY5UsRTYCjw==;
	5:pHiZERKVCnj8dbMaD+bz/lcKiws0tGPYwBefbu5800hKAxFXUObgsZZlanku03HsQ7KqI6DXfT7C0WI/6fmuDayjouOYMBNUTUfKOVqPm5GGaR8rhKvraM6SJBe4opuZUPNBBkeulGrlMFatGDiW89lxEZbYuiwuXzzhvBQ0Oaw=;
	24:izdmUQz+BowbvndHP07krajcCnAstZ5JwBk5cE2XyB8pl//Gpe0s1zBw7MGjyI8111Re0DBH2sbEDU+3w1EEB1uYn1GlHn5PJBU7cCP6tsE=;
	7:O4yYlnfOg2C/yRNEMlZ3H5K3CLfCEYqU15VFYBD8JogfMKjoCxSsRC5nAdMCcrbJUQTQhyl7ZqZDpCPpW+T+7Jjs5xGKX6ASdQ3hbFQ4D348V7HWZxg091gpwYHVEix12r+AF9iYt/Jl/zTpEsKpRsoUIc988ADJ/9NTj3BOY8pwxQxP55xdecdfVvIs1P3y/k9xD0BEaFndlEDp+kBzjTIMVeGvC6e3Cub5MVVyv14=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:40.0331 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3384
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.73
Subject: [Qemu-arm] [PATCH v4 0/8]  Add the ZynqMP PMU and IPI
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
X-TUID: B1zPeFFPuduw

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

V4:
 - Rename the ZCU102 machine to just ZynqMP
 - Rename the PMC SoC to "xlnx,zynqmp-pmu-soc"
 - Move the IPI device to the machine instead of the SoC
V3:
 - Add the interrupt controller
 - Replace some of the error_fatals with errp
 - Fix the PMU CPU name


Alistair Francis (8):
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
 hw/dma/Makefile.objs                   |   2 +-
 hw/intc/Makefile.objs                  |   2 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
 hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
 hw/microblaze/Makefile.objs            |   1 +
 hw/microblaze/xlnx-zynqmp-pmu.c        | 204 ++++++++++++
 include/hw/arm/xlnx-zynqmp.h           |   2 +
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
 14 files changed, 1274 insertions(+), 3 deletions(-)
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

-- 
2.11.0

