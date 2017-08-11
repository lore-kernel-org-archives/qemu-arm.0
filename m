Received: by 10.25.221.202 with SMTP id w71csp1448847lfi;
        Fri, 11 Aug 2017 15:21:23 -0700 (PDT)
X-Received: by 10.200.43.177 with SMTP id m46mr22629831qtm.189.1502490082968;
        Fri, 11 Aug 2017 15:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502490082; cv=none;
        d=google.com; s=arc-20160816;
        b=u5LcUvVY4Z0V6ndvdIKbyIf7mFFUO4Y/+izTDlwYGtBsjZASQBxbRXoWfI7uZKLV0c
         cXWZiqXNeKs+gGhkfYkW0b+jIgs0PRSqFMkjkmbAD3TbvEuKYkdb5m1pD+mKKvppKZl3
         4n53AW0enXS0Kh6nGyqB0++v/800OxgHW33QiIwZyNPWbuV2BBoKfq1dMil8lDccgTmn
         xw5wRiyqH2r9ALbnwEhpBRd4X1A+z06aQWeN0F9KzX3LEWrTq+PtHHb/WElLAjM5BSom
         zZifI3rEOvbxDkD06Mn90fnbcLmwQwk/InCYk+8xsowV+comGe/oyvJkCBOKgEJF/yaH
         35jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=Wt+fNsqYfWUHmkJKikDE4K+XcxnSTDHeCSkQ+wA2Dv8=;
        b=FR4XiGW84Idaobg5dNW1Bjifag6NMHLSDZQeAEpIyAOxoPQyMHJSidrty0D1ZSUZx1
         wZZ9XTVRle293XqIp0PNpG9EJgDIeC4u8MJo8DeCcS4l7FIocYTqlqAeqPmpJSITjOSn
         q3L8rE3XDdDMg0gXeDoOv1PFcjDRg8OenhJc6135eoOCXtocEnUe2BGddwa/9tCkQJoR
         MtdT6J0P+huNPipzfU8Q0i0lLnBCILTXym2OUE0IOUbehrWsXRfylgfERl05dep2aJur
         9JPXrEHR66Yai5n0tKXrYJCjC7At3/3dv2GfLi6UR37hJh6RB7yiOi8BADDjGCSVR0Rg
         e3jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=tgVR+rWR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19si1646491qtc.338.2017.08.11.15.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 15:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=tgVR+rWR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgIIy-0008RN-8I
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 18:21:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIIt-0008PZ-Ey
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIIq-0007HZ-AS
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:15 -0400
Received: from mail-by2nam01on0040.outbound.protection.outlook.com
	([104.47.34.40]:3861
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgIIp-0007H3-Vs; Fri, 11 Aug 2017 18:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Wt+fNsqYfWUHmkJKikDE4K+XcxnSTDHeCSkQ+wA2Dv8=;
	b=tgVR+rWRoh4IUKab6mi+JlLLvcxkZGsKX+JxdYj2X+PwKumsruluWjpY04zAYO5bwTPlan3P2Xt760c+uDPiCtg5m2nqZfsd9iuJG3H9bC1qNaJUMUUdw0FvMF9JBTLq+8/csnbAPk9s/U/w+18j8rDR2raTkqxGHqx56dg0XSA=
Received: from BLUPR0201CA0041.namprd02.prod.outlook.com (10.163.116.51) by
	MWHPR02MB2254.namprd02.prod.outlook.com (10.168.243.136) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1320.16; Fri, 11 Aug 2017 22:21:08 +0000
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by BLUPR0201CA0041.outlook.office365.com
	(2a01:111:e400:52e7::51) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 22:21:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 22:21:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45656
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIi-0006oO-0V; Fri, 11 Aug 2017 15:21:04 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIh-0006Ib-SR; Fri, 11 Aug 2017 15:21:03 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BMKxrB005128; Fri, 11 Aug 2017 15:20:59 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIId-0006Gk-Ik; Fri, 11 Aug 2017 15:20:59 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 15:17:36 -0700
Message-ID: <e554047d3a8376721ab5b33dbe8e4162f2b14475.1502488636.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502488636.git.alistair.francis@xilinx.com>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(50466002)(48376002)(36756003)(36386004)(106466001)(77096006)(2906002)(15650500001)(63266004)(47776003)(39060400002)(626005)(54906002)(189998001)(478600001)(5660300001)(2950100002)(6666003)(5003940100001)(118296001)(4326008)(81166006)(50986999)(8676002)(8936002)(356003)(50226002)(76176999)(33646002)(9786002)(81156014)(305945005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2254; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT056;
	1:yXohW29bwJcG8OJ688qe/HljeBtbWW0I7DssFTByQa4YmOOuMpjql0h2SSGVR47wyLF4xrXkHg7lKBA42uG8ik2wEc5Cwf8WMtpYiFnHvODhpBvI8f5qh2QZqax3MrWWS9nmruvBo+4yBbK3br0QDV3wWiHObkk0jnKUxYpQKKOEicF1f3l6JRpK3dfc+zL+ENBz07htq0JpHVza3EMM1toLKlW8MqvYu3QxByOfw3Xkd4gGcyAptNk/TEK1IZkgeNSyVqgW54SUKNU9OnliiwF/tfWtVaeYy0c0uMCUszO+W/E8/c/cVLoAX5KNRwbV8872BxZjdLXZWwqzFFmw9Z59RFphg5KBW58dmk6qHdzCm1dMZsJeoBndaU+E8Wx+3dnc/OQMwyUwZhjzHojGTzLyk+xnpjMgDexmnsYOmvF2JZ3lK3ya19ijqZOQUZKyG4nOoNUwHjm3aXaPjz1rgPdGFJPid20zAKZsmlmB9OBwRY//bBdC9bTXxs0oil3oUe474TvBYvGt+oltfglVlDUnWFB7zn76SkvC95dLIWf3axrKl87H8/KfGNz2GnGjC/U1yrN3rBtQbB8G65ibb9Pma7YwSGvfHqnfr8QmzR4FutlT5TPzW4pDkal6kxHQibtk7eUaJIt9dyQc6QhMGJSzdnk5Yw+/Gf79zpzNoCZiIWMM5xdb2L9LCRxTQVob31IlM+7b7qJANZM88DMcce1agvW4/sIfG3bQX0A37QPVRIs+MtDmScJO5UtRoKoS6afqUQMgGhzm7TCgtE128OcqmT9GIBX5dPUk+w0f4ea9I//BEct3xeH6ZpFfMk+1s6aECvfk4XqFKK4+KTvX6w==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a33ba970-4fd9-4f68-d4de-08d4e1074302
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR02MB2254; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2254;
	3:aNaFSglBWW3/FxPj+qbXYDp5zjOhvt6X2W4/sS6SgUkeMGVLFKkPu2U/JVnTpyXlLtLumYN02arvA7URIo2SdzMuCkl1AE3KW3fCob5RTI1hfh4E0JWyg+lzxPPp8XBP+iIYARe4Buh+1emYEZyyedrid0RcoLh0ARxAhG3OLp64sHZjDr5mi6qSN0boXCngQOMzb4Opt6HEJE5TiAraIjJgo0ZMrn3yLMGYwIHuarI9Ektta1yBQVCB5Td5H3zHqEHwVPJKZkxnq0Dbl2n1N00UDa6MRCVTrI+JiDaDzdM5JUJeQoKjBy3cyZF8oLBY0juGc6tLQXT4gpyizKCHY2dU2o/SC8BWRxgT8yfqmO4=;
	25:O3tE16OpTTPESuCUcX+9KMsaj4xi1z2Ixz6Q1uTTBwSVNhSFXUAcTB1AVoswqBautd12jVYR0lYKl+cxCaVaYziEziJWCX42UPgL5loYYAEBstUhbQuK5u8Lf0ST/5khZshPlMqq+4PvwyEyf7wxQMVCnttPKPnClmLwTo2skdzw9ic+/VbP513CYltnLXpWkKV1ZmATTk15xmxsYtHcSyE9jHUjRleMTMxQ3Ay6PSJho/r+zQVkxdcyjTZ7/70BhZGnuRBd7e2QHuVsAE2eh/tS+vXzQr7hyw10KnQ+MP2m0Zk5/F1EdS5k1SCVsVYHcyPcKOuzaaJ5cblwR28hgA==
X-MS-TrafficTypeDiagnostic: MWHPR02MB2254:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2254;
	31:dclRRegIa45PGanpM9XtcUam6HjbFeGx5KpsSHKbvin59IkfVKdnlyQGbG7WU5loq/WeZY/ISrDYSz7B2P1kYmHOclI9JNfgoNZUusV2EX8X3eYyqJ6xagkesCTIRsEG03peEzWe2Fw284ULS3/fz/M2r1LKZCYxbnhs4jc67bt6JpJn0GWXoydfAiocyn37iWGIeQo8XsPr3YK9KveKwSJpVt6DVO4oLaj2vuGDooY=;
	20:KWaq4W4Pj4VvOFb/YE2kj/kpm+ExEYtIBKnx9t26oO6GvxLLpcmBU0HnSQHcowT9TL6g1SuSISLrYBsLAxfmS5Y8OETcakTIq9AHRKaJY9G8q49wACrBaKDqOib5YlCHt0WRDqrWUILTvbE2xlGhcrZZq92vex2mlDsuewD8i7pS0WKyBr8kEitNFXJuC30gk9Dx5DC3bk09D4WlmI55UXVaYwBxb6sUpVfJk8eZfyFoX+uPh4w1zFl4brGMn/2BMrOwMKtEQZoluR+2/ZqTl4OK021Us3YGvwp4pv/B75IGL6W4NF19R2hSpoYOzoLmeVP84G2hH+rKYkcVo+9fYpsQVcQLnQTwWbma0SGK8zI0WFNzFUfAjVuK9bKe4iQsxY2GrtxzV57EstHv1eVF+T0F1NzSYL7QiCZP+2g9w6kwvXyk0tzRlSjfMp5ElLG2jK5wOvTJPzGymoDM30LYU1is/U6tUfsCA+2AdVUsVSbaw1LSYClTAcQgeMf/PsF/
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <MWHPR02MB2254847480D350040055544DDC890@MWHPR02MB2254.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(13018025)(13016025)(5005006)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB2254; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB2254; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2254;
	4:dyI5aOoDJBpI41vxhKYj2bFxt8lSfHP/YXOnxVKdn3EFc5uQ+8NujzfnMz6jZCEy4B7SwT+2y5fC8v4uOie3x1keyPMACQCM51K0eE7Tj3PhENMdojYLuhv2zd7ZgtV/n7QIt0/oWcdV00TzVhRM6gKiy7vINmgxu4oyWeojkKVvT7f00oWL2wHyyf/KW0Pckt5y9W0hw53VFSXgVP/6/MKCr10yDl7PX+ak9KjeJbU79+nr6SBNikl6xlY9ejQP22TyxMPFyM8XbNID6TEFlkqWj94BJtJBdmYW3D9Bizs=
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB2254;
	23:uO9Y4b44yR6TbZ3GH7RZJ4mAVDvww7nSBphBFSza8?=
	=?us-ascii?Q?EUZuFb20bR/YkjfTEr12CrLz6fkg3n9BcDqAEbJ+MknlJ5zahTPxhfBMaR3c?=
	=?us-ascii?Q?1z2DrAoJ4rbDGYAAD9GD4Q0FSVMfv0JUcyfW6cT1Mj1B61ce6z1T0p8j31au?=
	=?us-ascii?Q?GEj5s99MrmHS1ccUXX4JdB4vKVOjQTJZ/SdPIStCPtISaOgjnYmpJACDpRVo?=
	=?us-ascii?Q?Jc5lCuyKZ7Yhyg+VeHL8kmgDKq5m+KsSGfsVExehVtbThcRcAFG7P8xgNUNS?=
	=?us-ascii?Q?6jPB3mM6SrCQbslWfDgnWhgRDhnn0b8PhdOVU3jioECdyM0ZBrD6q4eC0IvB?=
	=?us-ascii?Q?36LK3XajESBe+ZTKVB77ym7zS2DaFDia9LM1QesMzbwjc0x71kht8Et7Hv55?=
	=?us-ascii?Q?//nGQyKqtBMLOy6Tq/iVE8nXhY11OgT4FxO6eP6W7s0JzyoUrW7BTGYeRAqz?=
	=?us-ascii?Q?aF9wytb27HQbRiGdXatWdpDpzYFwFHs8UAROcgRq/GvmkzTulJE9X7mhB9c5?=
	=?us-ascii?Q?vnbauCrgxKbnsczVfZw5LGPhTitiqyzht0iLhkFGQCCiu7UHYeYYy1K5NYNR?=
	=?us-ascii?Q?r5IGPWxiDdzzB2Csi3yqSmiutNX3gM7FRXMd2lYnKlLXektgoEcewEaG1l3i?=
	=?us-ascii?Q?Nn2CFCW1Dn/C7zK6hlx26IkhpAMsGyNwkWb2sVNNQa3glx0Tzv3srrHE4ObF?=
	=?us-ascii?Q?O2kR/FQVfA068R5vd61nvJLsmb0J2TyBGdqu/A+EqbrlgKnWl0IeCIuZEUfi?=
	=?us-ascii?Q?wFX9vv+sLHGrt+9ufGsdbrjg+mBC++HZdgnjwxNYv6/hHENJqXFyTE0bhikn?=
	=?us-ascii?Q?2KuWmdMcTkMj1YCv0l9l315P89boJXW9x2F2aDmKm9dUm4XRda4rZZTkBwsG?=
	=?us-ascii?Q?xCKadD/GObqqFA8eRPIfFdq2dSifKks7bUwqTs3p/jpVRyzzSwUeUNWxu/we?=
	=?us-ascii?Q?gUA5nBCNbwtepV2UGrZp2dc4Z0XPk/9XQaq+utkyZd90iKJQVmqoQyuf2Ac3?=
	=?us-ascii?Q?ZfxLzDwIXoUdDJsk0MlwWEM?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2254;
	6:gOlHBO/wFiaWGxsVaOED1bte+sOnYWARVWO3lPGC3em9nC+YW0ZpbGQmIwM9z2TqrhuYU3M2Oo1UnUTURN0xNfevsegaVc2ljU/zbvHKe1oiFmUdwz2gFPR0mtzi0c2h9faDgy5bANn0gki2SzgzN9tGqxkVHnboIrQ+bkFUNGk9GOmDkWRUme1NTcOPeqSkLhZwtkPMQubbZkoxubPDwJ8xWkBQalsiqqI8A2GHMLjTT+ae6/sxMZPTowA0hjsbcRsxxyfFrcvGQMkvj+p6FdSaUGFBMqhzbjsllP9NWSO8+ZZPqo1/MfcjbxS5dH4ph2E4P763ZdSha4eI7fCZEg==;
	5:+6venRUaIfUbmZ1/zGMa5Q0K528YN3Uue2JuBPTYLlrz7+uSDhB8batO1jXxxqJvNNMRcj2Xtv7Qlq8eYjxu/nkwFeX+n6HfKoTw28iuEysmqEaNm/VG/FA9akq/L264igvsUvppOPbtrXjNZMytsA==;
	24:f/A51f6gPfP7zBBu8wotLSaym0h9JVYciwhbIuNFlXNY636iF42kL9HyUNVHH/Z9AIQ8oWHNylk1xAytesrYwoFPPAxwRzdec2Ikz4Ee+MM=;
	7:osH2E/IwOpq/H32JcbWzuck3xlbhvMfbAMpwMH3v718wG31pHKL+4FwWGhAfVGbgGHEVsHYtmGlG0wGJLoCZL2Ja1eisZnBHc83hBVFnKg82Jb19Jf8oe+22oTDO4svgb4vyRnx077NIhpYtWuArIK9kQQ1ksfeZ2pz5fyQz6KtTlz+x2GnImCXvn2TGj7Wyza/DWSWVN89Ce7c7It7U7slAa80jWhlfUXsV0ftbx6s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 22:21:06.4174 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2254
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.40
Subject: [Qemu-arm] [PATCH v1 1/3] target/arm: Update the memops for
 exclusive load
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwVzmx3IolJc

Acording to the ARM ARM exclusive loads require the same allignment as
exclusive stores. Let's update the memops used for the load to match
that of the store. This adds the alignment requirement to the memops.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 58ed4c6d05..245175e2f1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1854,7 +1854,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGMemOp memop = s->be_data + size;
+    TCGMemOp memop = size | MO_ALIGN | s->be_data;
 
     g_assert(size <= 3);
     tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
-- 
2.11.0

