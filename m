Received: by 10.223.188.70 with SMTP id a6csp3348687wrh;
        Mon, 21 Aug 2017 03:52:05 -0700 (PDT)
X-Received: by 10.55.106.67 with SMTP id f64mr22013225qkc.15.1503312725687;
        Mon, 21 Aug 2017 03:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503312725; cv=none;
        d=google.com; s=arc-20160816;
        b=zsRkA50foyBja8fOFxBfUdFCSpPZxc4Nh/t0kiPlMGaqrj3rP2gyWgNNPghTBJ9gfh
         p0qLTL5BB7iOplkFGwwvqi/nh+PWvMp6C8k7hNz7ZEG8MxXvoXzlCpYUyembhIOOjy1q
         xjgcpZexXEN45VO/m2zX6gI6YuCqRIhRBVWycpuvFqivuGMN+iFgmGiMNlT+4e76/958
         c2lbrAguLpkAREFMZJf5bFFMlPJXdj24D7h/m6KxchC3R94U24pqBy41XqHfpzc7OCrA
         8PZRgYYtdFt+yWd6+wtd5IZkdh62mnm+SJBSftNfrACzARjetk8bO321GTFgJSD6Btc8
         24dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=u4lnxkl8tFCVSbIWD0qGl0bpZ9tA2T/0o1j/2kxciGE=;
        b=CIuVkG7DDpUiRS1JhUo1+cwM3kt5dM0ol0wS2mDR+PErazF0zZGl/JoHEXAazR9uvr
         xaIHdgA1CoLbX49i8ORj44n4gbSyFXZ8J2f8wr6yiBK5aUt8M5GAAY2kI6jSE+bP/+m9
         zknePymejK5ftafgvD6rODCxYtbxI9smgFiapE7LH2TzibGCpFp6DjsyQNeaeD0AcIWT
         SQYhHC1VzBuVb036+S78nBsV/R18/QMd1JZy6cFKKP7HY90UZr7EPZDHIRP2WLjrftTj
         +nAU/aZsw5idb3Hg/cDVRMVvGDLZSLmrVmGNpa/7a9dQpZJ4ddsalfJuHMyuhttgw54V
         bz1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si10927021qkk.420.2017.08.21.03.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Aug 2017 03:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:33112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1djkJP-0006HT-6r
	for alex.bennee@linaro.org; Mon, 21 Aug 2017 06:52:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1djkJC-0006Eh-A7
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 06:51:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1djkJB-00025t-Ep
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 06:51:50 -0400
Received: from mail-cys01nam02on0065.outbound.protection.outlook.com
	([104.47.37.65]:35424
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1djkJ5-000214-0f; Mon, 21 Aug 2017 06:51:43 -0400
Received: from BN3PR03CA0065.namprd03.prod.outlook.com (10.167.1.153) by
	MWHPR03MB3327.namprd03.prod.outlook.com (10.174.249.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1362.18; Mon, 21 Aug 2017 10:51:39 +0000
Received: from BN1BFFO11FD001.protection.gbl (2a01:111:f400:7c10::1:114) by
	BN3PR03CA0065.outlook.office365.com (2a01:111:e400:7a4d::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1362.18 via
	Frontend Transport; Mon, 21 Aug 2017 10:51:38 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD001.mail.protection.outlook.com (10.58.144.64) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1341.15
	via Frontend Transport; Mon, 21 Aug 2017 10:51:33 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v7LApQtC004847; Mon, 21 Aug 2017 03:51:27 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Mon, 21 Aug 2017 16:18:52 +0530
Message-ID: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131477862988839364;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39380400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(105606002)(39060400002)(6306002)(48376002)(54906002)(8656003)(50466002)(106466001)(4326008)(2906002)(561944003)(53936002)(498600001)(36756003)(50986999)(97736004)(305945005)(47776003)(68736007)(72206003)(5003940100001)(7416002)(189998001)(85426001)(8676002)(77096006)(104016004)(50226002)(8936002)(356003)(81156014)(81166006)(86362001)(6666003)(626005)(5660300001)(2201001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR03MB3327;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD001;
	1:w/Qg5Jjt0dcjiI+TaxzR8NiGbEsQgyKhAs221kesquHL4cC15jP88DJuSSVMQ/FPrAz4PvnGXWLl2Z5Oge2Lqe34vyRl7Uf9NuSgrq1KojLsMNXidjpy/gxi14e0XbnS
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 807f4123-2fcf-46ef-9863-08d4e88299bb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR03MB3327; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB3327;
	3:+rkaqU+CI6nTH7+MYDtu1mY6ehElGeiy51R0GDfob9GwE2up+tgO0hzdz/4teB4r0PqStihUhn2P7ISAqWFoHfpRkJdlfBcxGg2BGrcp5WMGkROZ6ASV3orvZiZadjt2KXo7h7dF8R4v8qeyp+EfMu0KA9ouE4hENF6zSIX+41BTkhJiulY1ySFgER6iH4PfFk7QiicQ4n4jZ53hvwYO+uxuMpRFqv7uIivsW+t0SMuTJtIS8VFjTbQMnBVXIyXY44dEWmB9UWoKjeZduzwo0af66m53crKBLeqOJS5U7JBfpAmKzL7Qd7zMNJEOaTr8cdcVPCg6KOdJ+CnDWVGtTcZ94gTKtspLSFLFNVOr0lI=;
	25:WM1Fqf2DKQvq2XFZHgulpXePqFKnu2OXeR//r8/jrnZJnzYH9dR6DtjPrx1WkZwF7MbjHHTYjV72yJDA+U+PraS5K6bAgjoj/Q1tFA7xbQiLqIIA6mObHsDFWsxdv3imZex6eZYpJP2XnJ2a+bDPS7Z0jlfuffpcf1X05H2MZ/6NVnkMCAPMWUcZMPThmJpyX3j1KQF0DjHkMqmRZnXLP01WY06tWCnqrlpS5Od3lVrZ2Qje+LGG+2A5p41qBfjdXkX2Pzd1t7KnJuxuOlBFx7uzuvn6ZsGv/Hg7GuEJ3umLWF21D5MvcQD5CKIdJTJUiBMQpqxUx/fDqwbRfN49wg==
X-MS-TrafficTypeDiagnostic: MWHPR03MB3327:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB3327;
	31:3Suc7fdUnl2LNiAv0GCUzVPiCjxNjgYIDMMAQRqdxYvygbJFh/q0D/BP8FekWEfSZ21pcY92kqm3rtFP80dc38bTCqApUTS+dDdhv0N/sixpzptYXf0UvhAuZ65hzJw+jqtYfotU5bUR8KfnlHe7JX+Y0TbHNpgWH+NCWyuRvKcDcu9d7pnfP5Gh+LPmYuFGurEknRyw2nFmowjO8kAKQBVB0ekfPqLg1Nz97K26Law=;
	4:kVgS8VM4QF1LGsIFP1PJvXcf63rvlpVgT/GIgPHtsMvh6X4SRr/Uppapeolte7KwbFDgvGzLEk2BtZ72vlrCOnI/DKy6OdudjvRmChg9IIPBejNLXJ5Y1FEhgz2NJoU8AUriJNQnIPI3SBjSKqxTw+ljAx6U5RUAnJjZ/8mMhlSI/z1XClRAQVtLILMNH73ITWpjUaeoAT1tBh/tLhNZ/s77+NSnQHP/Ri4D3b5Nw1VwysG+/STxJoJIFmO/6S7x/7bsIR+avjHR/79GdlY52+4DuBSJoRU79IBNNdKBoIQUKcN5OaPGyYbzPcLeRtdGCQgOLj+Zo6JXTIFP6RMjTQ==
X-Exchange-Antispam-Report-Test: UriScan:(226959686518644)(22074186197030);
X-Microsoft-Antispam-PRVS: <MWHPR03MB3327914C019A31B16D9FA2BF9A870@MWHPR03MB3327.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(8121501046)(13016025)(5005006)(13018025)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6055026)(6096035)(20161123565025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123561025)(20161123563025)(20161123559100)(20161123556025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR03MB3327; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR03MB3327; 
X-Forefront-PRVS: 040655413E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB3327;
	23:tTuF4ghbLqK9axij5nE+8c/s3G+Q1JHcRYkAYLinS?=
	=?us-ascii?Q?ri/t6KPSscvv/mCtTu8QQc51T5Eq4ViiZbkUgiN8Y8X0EWhGiCYDZ9sOTj7E?=
	=?us-ascii?Q?O0PNbjhDjKlVsAGEFhNU8yrVXC8wRhqEMxn3Kke2v/ZugE4LmHLJ/6JiR2+Q?=
	=?us-ascii?Q?9UgZsi+afvad6i+ODgq6qCTZ+4MyWAZSUh915DHgbcqwn/DDjwFAKXpyKX9W?=
	=?us-ascii?Q?yxKlQ0niUErf2ulWrc3r+lIvlixQKfXWx6H1Fgk2+R9Ky5CDNISI6h/C/1qq?=
	=?us-ascii?Q?L21v9anJH5okpgQPI67uLb7nnqEtnSRTa/SSdkYru4f75OgQcZiqoQ3hvQzS?=
	=?us-ascii?Q?FTW/Vfc1sMXm9HofNUIDrvcN2rmCHMRur5SKgjHg1AE/vsmicLFbrIF94OAM?=
	=?us-ascii?Q?uD257ZlcT4AF5iClLsQy7evrOVHDMCH7VINAs6yuKIJ1+t3vW0uzNTwuu/vF?=
	=?us-ascii?Q?L8LLnQ0MjderL1H00UrqeJAtgvlYIDCy0VTd+Z/iTp+rVyqYa7PZIrPPYQxt?=
	=?us-ascii?Q?fOIQc9Vfc1m7/fyn5Pi4J3IDx4VgYrtIi+jgmW+utS4x0meGdKNeNkaewor6?=
	=?us-ascii?Q?Znp5COCtk55n+XL6l5Neaee3dZF2Fmtel0lE8OrRV5m28e+Eeho4MJxU0X0+?=
	=?us-ascii?Q?hnFYhFloHl1pJptrqktO6De5GuZA7rhFMZOkIA+85BAVr+ih+blQNrSwliUQ?=
	=?us-ascii?Q?kbrAL00bjco01EIYL3DwLr3X/cZtJH6T1g0h0OJJI09Mz+8CtRdH/SrNvVxs?=
	=?us-ascii?Q?IatU8VYHF0HBrwULBIdRpYdoEOjHrIYMZ3AkZcxyYWX44O48mEcwGNxfZfro?=
	=?us-ascii?Q?xVKAu1k8/nW2y3Iik6G8EqCBcZ2J5Od8WPEPyS3qNtPzvQw00AptdxMQtCB3?=
	=?us-ascii?Q?Jyst3IzSO2FWNIYPKELh+ZvVTp9ObPhqNAG3VmoDD+JxtXxNzJMMOawjjz8x?=
	=?us-ascii?Q?ZUY/gDX+lArtxOLpkr+mNvyHbAXhx2KtqpF5m91lcgfEQY3OvjfGrXCnfk5j?=
	=?us-ascii?Q?DttIn1qx36IkAA4hcyWzxICeuZjToqWckKOjpEwIU+ynE673peHZGX2RzEDB?=
	=?us-ascii?Q?vFBf7zpgPCoV/6s9/huFxZXCt8VshjEiIObOkeDWu+BCddyPJrhAWdd9Dtr3?=
	=?us-ascii?Q?HTOM+VxqWV+ExZS/+XFCowOzlrBfwPukOEyiX8EmgtVGnqOCLDWeg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB3327;
	6:eMDLS0Y1dvY1PipVyof1grduxnoMIJOgbyb5jvWaxcwQN0kkofyFaoweVNUd4YvwxxqLHFB7Hh67AsihthXvn5EDKQpeEoUuoGaWrhYK4ibYbda8vLvYdoR83FWVEamI/HH7XKVBx0X4baZp5dyOGflfHIWQOQ6sG9kXoJn7FJB80PPKq9tx1XGO2iY+hRKeV/xtcMH060gcQ/VdXxrtNUY4ha2Z2tawvdwE6OT2F0uYEAlPiCj78k36+SD645i/6Vq8R1+IzKh7QVllB0Q5hXAGqE/HnCSj14yIsNozd0oBBaMR2hA7uD7Xpy4JM0VeTyv/WIQevfmLvaJhsH0zQQ==;
	5:+9G4FVI3BPGhooVDZ+RC9GAM7RhNWaCyLoHM4Rfwt2mt++332/VS7SSn/NOtZFLLs57LI8Y3AojAzeD8lyMyWdPh6hobE9HXYrXYADBXtbQUoa3Obde5UBVV/QQYr2187XapCXVjPsxKedIbzoOfdA==;
	24:TBqLOLwn7fkH+JMGuirFtffOEe9qHW/DHLFKVVBSSnzxshd1VKl6X7DXvrkgwHCkhgI/xNjh5boMr+MwLnqCHvdQMz9CUz0FvDQ9FtRgaog=;
	7:cG+vaWDOzhpAJGjOp9zBZQLuLJXos7ktG4oAZMMBl8YxI4usoQlwYqZe1Z1gUeBkemmLcsbTcgGnTgUv+cDC/sv/H6ZHTGoX2D3W4J2/JXEjuCVJoc6aA+GFI2SBAidZVr/2Zmqu77hvtVh2OIjI1i8Tqzwp9TykoLUnDN/mZys0Ig8tj+aXAqmu6pNXVGZB5mOJVGteZS7Trq+YAETmfzClfZ4qVdpsyK3BuJBT17M=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2017 10:51:33.5487 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3327
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.65
Subject: [Qemu-arm] [PATCH v3 0/2] virtio-iommu: VFIO integration
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
Cc: kevin.tian@intel.com, Bharat Bhushan <Bharat.Bhushan@nxp.com>,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HXqJQ5JrgnTP

This V3 version is mainly about rebasing on v3 version on Virtio-iommu device
framework from Eric Augur and addresing review comments.

This patch series allows PCI pass-through using virtio-iommu.
  
This series is based on:
 - virtio-iommu specification written by Jean-Philippe Brucker
   [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
 
 - virtio-iommu driver by Jean-Philippe Brucker
   [RFC PATCH linux] iommu: Add virtio-iommu driver
 
 - virtio-iommu device emulation by Eric Augur.
   [RFC v3 0/8] VIRTIO-IOMMU device

PCI device pass-through and virtio-net-pci is tested with these changes using dma-ops

This patch series does not implement RESV_MEM changes proposal by Jean-Philippe "https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01796.html"

v2->v3:
 - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
   Which is based on top of v2.10-rc0 that 
 - Fixed issue with two PCI devices
 - Addressed review comments

v1->v2:
  - Added trace events
  - removed vSMMU3 link in patch description

Bharat Bhushan (2):
  target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
  virtio-iommu: vfio integration with virtio-iommu

 hw/virtio/trace-events           |   5 ++
 hw/virtio/virtio-iommu.c         | 163 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   6 ++
 target/arm/kvm.c                 |  27 +++++++
 target/arm/trace-events          |   3 +
 5 files changed, 204 insertions(+)

-- 
1.9.3

