Received: by 10.223.172.38 with SMTP id v35csp4370842wrc;
        Tue, 26 Sep 2017 23:38:55 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBMMzNj0KlL//BUcGhu3o2i8JtqgD3DPi6e7cIDg0cBiz28JmJyPaAigOXYS60G7GEpt0CC
X-Received: by 10.233.235.66 with SMTP id b63mr966006qkg.41.1506494335095;
        Tue, 26 Sep 2017 23:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506494335; cv=none;
        d=google.com; s=arc-20160816;
        b=zZNbyAQI1yUns5rUTV7o+P/5F5ZWnlBEk5uKM4ZtpDqhL8s5VTOT3G/I6qCO9sN0+J
         t0O7iGrUAduIAC+e5XNJkFjm+427YFOqFFFaG1BI49w8b5vd5hEp5N98/48wZsTRBtS0
         Goov45rbFrJ4nHUvUd7tnrQup1rABy9qrGVJzRKMpqKmdvTXUmQ1x4uCJBUmO2DLMEaX
         l5TEhYtsXpuo34HvTs8wPSkp+POuhFS0HRqQOL0tG5oLolQSkfBdva1s+uC2ncGVcu50
         CVJ3RFeN5Kj0BhPBfW5x6kV8lF8TyRIvYYtL2k41hMGDYGK+lSfzJbEJTOf46eW4weRm
         AQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=wcZzRlomD04Yr4i8g7i4Wn7QbFLdy18ZsFQ/Jd3euD8=;
        b=VbuOBlxl5vi/b8ddQA9M982nmqBxpCQopvLL1DQMf9MvOg45NEY9GUzJQQ2AjB7XNz
         6tjd0bOPh6v0/df0yYEidRTaKgyQaSG4qaVvhJ18Hix7qU5K8i4lTaqtNwDi7k4W+4if
         fO35Hw7bf6Xx8ipLKSaleY4OYHLp4cUIqP+3TQa5emWPUj3hK72Zwp9DCV1QJ7xp1KCn
         wbaINJ7lgiH5hUh2l+TUFIPsanlXdBW9twpQHhYsvX1wvRXfIdAvtEhbxHSXCCJuvq21
         bO6d/o0sMkX1U9yXZ6Lmd0hF8744F0ZpgyNK0gBUZtx5yulcSpXBWVRaFZ88DvuNXkF7
         NOaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25si308896qkq.257.2017.09.26.23.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 23:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx5zg-0002mK-O5
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 02:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xf-0001Mc-DP
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 02:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xa-0008Kl-Ok
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 02:36:47 -0400
Received: from mail-co1nam03on0085.outbound.protection.outlook.com
	([104.47.40.85]:6976
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dx5xP-0008Ca-3J; Wed, 27 Sep 2017 02:36:31 -0400
Received: from CY1PR03CA0032.namprd03.prod.outlook.com (10.174.128.42) by
	DM5SPR00MB235.namprd03.prod.outlook.com (10.173.215.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 06:36:28 +0000
Received: from BY2FFO11FD007.protection.gbl (2a01:111:f400:7c0c::153) by
	CY1PR03CA0032.outlook.office365.com (2603:10b6:600::42) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.35.12 via Frontend Transport; Wed, 27 Sep 2017 06:36:28 +0000
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD007.mail.protection.outlook.com (10.1.14.128) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Wed, 27 Sep 2017 06:36:27 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v8R6a2NB027330; Tue, 26 Sep 2017 23:36:22 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 27 Sep 2017 12:03:18 +0530
Message-ID: <1506494000-31982-4-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131509677880055720;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(346002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(39060400002)(2201001)(356003)(305945005)(104016004)(2906002)(81156014)(105606002)(8676002)(106466001)(68736007)(77096006)(53936002)(86362001)(81166006)(8936002)(2950100002)(50226002)(6666003)(189998001)(5003940100001)(50986999)(76176999)(16586007)(36756003)(97736004)(5890100001)(50466002)(48376002)(72206003)(498600001)(7416002)(4326008)(5660300001)(47776003)(54906003)(110136005)(8656003)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5SPR00MB235;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD007;
	1:3T+o325eX1e7lfq9VKHtAFlg5++qDqwEObeTWe4XT/rYjTqrHOJk06feIEJxJFEqUeQ2xS2bVVMZ0LpqZEcQ5Q4/IiUTtbwZCAcr+W+Ho1uM2x4YHMR9ftQ1QtFk32b4
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8726c41-f005-4548-b646-08d505721505
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017052603199)(201703131430075)(201703131517081);
	SRVR:DM5SPR00MB235; 
X-Microsoft-Exchange-Diagnostics: 1; DM5SPR00MB235;
	3:a/FfWwWuYGWJ9Ir7QgMobZPDkVLuPUFk0erP8rhIu1swhTgHDQ9bdf1PDL6+/VnVwrMCizZykWjbQ6OFX4N/rSdpeF1xZF6q3gMtmiyl4APRN8A5ZDc6+1AecENcLiEWNw/CDfXYLNH18jwmU1ekUKw0lGT3Wrsf+IX0w17j29FBT0kmIQiOQETLTq4mM3uDHkIckIsh9QO3TM506t0RAjBxauzpLr6SKUtyUa5lIpu5gCpJM9sBF5UffZ38u9WTUhY7KQRi8YVWCt7TVSyPuXtv6ZanZVcHhTTRVNtsZKX3q/mkW7sRqyIme44KNC4+yP6C4gUZt/0s2unuzjterFHNo99RDoLJtHVML+HAtlY=;
	25:6s1+Mx8SLfY7xexEBcSOconfqEXJkmHNUI6km9k6UwtRDO/s27PgxfiGLx3B//dMLGUhbRSnOdQajTay0e7ZggZ/FWIYHNFNNblQlhkoQwcebho10gfvg+nbIj6bI/ftEE8N+GKxzLDVlJcTJDhpUvRu9TRWu44SOdIRp8EAUk4EyoDNyHowzkXp5brUzzldRwf+lrYWTJYpZvdHar3x4gpdNUU35fbRLjfOwYuDYJD8EeM1GfOjVs6aXwTS8bv73L8G0flGgds1ARCT3U9kHfRQuez5Ivqy715zbu5hSjuTfsarIdsHrz8GAHxaIj1VK7FcAnMT5PN7fYnSgMzRgw==
X-MS-TrafficTypeDiagnostic: DM5SPR00MB235:
X-Microsoft-Exchange-Diagnostics: 1; DM5SPR00MB235;
	31:hsHXtjXrjWPuRy/ZBp66KgKk3857s3XXrP2TZn6Cwsu2MvBLNu7zK8I/OPP0M3tJU+2hCKJjiwCK1FPRXYdSiMN27pSPrVzXUzwBk8f5ATKZFz9yXAKoVMSomLodX4iSujXM3P2X1ODGX2HdXUfHS73haa8q0JnL2Jrs4kQkVrRJ4f0jjwhRdFBElNE4lA/KFvRb8spFDj8d2fltqfMsXdgXWCPBW90mhkspbgUP3j8=;
	4:p9He79lJuLaeV/zg44osjlC7oNgTC+0usZXSDHXCDMSYvwv3UN05qreUWtgphnZ5Qb/76QliNiAPbGU/jdy/EuIvR6l2RRolfyBkQSCBA+9AFo9ke3GA0nwotpBOBpM/0EbGsnDUymTZsqblLyH/fOilz/WuWYOCYo0snllKSifhXvnZBPgzr0TPTeRmY6j2agP8qaX0z4ZKsgl3KP9tPHHzgFFugkN7moWVe2zF3UcjxAZBA+M/qdz8uJfqwizhNfwZDrtiej4jzfomSXW9akSBwdsmcZcvZqRZPyFU478=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <DM5SPR00MB2350266C6AA6A9A72822EED9A780@DM5SPR00MB235.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(6096035)(201703131430075)(201703131448075)(201703161259150)(20161123559100)(20161123565025)(20161123561025)(20161123556025)(20161123563025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5SPR00MB235; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5SPR00MB235; 
X-Forefront-PRVS: 04433051BF
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5SPR00MB235;
	23:AJ+TUAP7Gdzb/e6NzLGU9Xt9zYB3tpLR6BQG8AFWe?=
	=?us-ascii?Q?OFsmiNxhslgYfdxBukPTWy31MGC4d9uccGuOm2uwHGvB24oSj/Rbbx/4efFZ?=
	=?us-ascii?Q?7V+KMEn1BnzaIzPbK3uKuMGzldP4l81p6ew7LtflUhCxBnVSYxWyYShst1NX?=
	=?us-ascii?Q?YP8FdwHqG8JV6q4C0v7zffwtebAUofx+JfjsSgFs7vYFDORm0zYVvGKEEwhJ?=
	=?us-ascii?Q?Rodo6vWBOVObuR5FHPTyoLqhNucub14fncOr9DZM4qnTuGvnYlTCCS3KRxUc?=
	=?us-ascii?Q?MraOkPPbgOA3oOXNlTnbq3IgZjvQ7exLKu5KZfIWpwgkGo23GqQ+OK+kPUzM?=
	=?us-ascii?Q?hzs72oz3qXzB6LEbMswxteaVahHoe9nHfwiX6KFRQ23tD/Re5Z/SP1VDsusG?=
	=?us-ascii?Q?t13OFRGtap/myJ0BANixdA7rLUB3BHXc8AsFCCFXk15UJ3FeoNxgxE2u/hsA?=
	=?us-ascii?Q?H5iHqS6NMz0BFGx0qB+PwDGAVAFq4XmKMGPthrc6W91ieVL0WWc9PYszwZY4?=
	=?us-ascii?Q?GwaED+8JR8Y1Rs0crDbzOffu/mAThgm1dtN7ATVKx6UFAEb8aV5sf1MbFpSw?=
	=?us-ascii?Q?UCgrG6d04kNusTatGmLfzhARsP6/sQbjURZcWw9kDKWCIAqhI6m3v1d9hT4j?=
	=?us-ascii?Q?iIot0gucUIuqwjZc0Q63XjTTqhTjvh+TgtAT6DZuQFOHoul1O/7R6DP8dRIr?=
	=?us-ascii?Q?ga+j1lccv3d3FnJblXxarRjrzL+yeqofmuUdxJ1H3xn99Vgxchpi+pL39N9W?=
	=?us-ascii?Q?kSuYlDkkYjyC+yAMtS568IIBbS/NS+pAGoegTKwhGL6JIJU9+VGmZHOiKEw9?=
	=?us-ascii?Q?EzYiQZrhOoLxL+U9t3k3l9qM2tBna1jE0IXkVpXQbVXctZybtDR69NhWqv5v?=
	=?us-ascii?Q?NI7VYbRYZ77+E+c5Ihq2vPELGRyLD5uNViJ0AEg268IBcXVHJ5PQ62vZA+E4?=
	=?us-ascii?Q?OTmsrH027b4kQrcelhoc9hsdEWLb2xzIZdbVaqyil2Yy/P/hK7X4NaYTplaS?=
	=?us-ascii?Q?Hy841nkaPNq7KarAeIDuiusth8GXCmSsVWTjfyfbPzty5D+ZS9ig+gxyhQcS?=
	=?us-ascii?Q?a0AR+YBHBNmgquvUwcTkX51g21RjfWUvTEBLJgHK/wi/7l63ebnrdlStvkKp?=
	=?us-ascii?Q?zWIcagBh+V7F9VVnhZquq5c2I25AUHZ?=
X-Microsoft-Exchange-Diagnostics: 1; DM5SPR00MB235;
	6:TTIzAALgRZ5GS1ywPS6BOf0w3DmVmNTPXJbSYPKmS3e0wsaXOLXFTfcgPzi6J3vHiJVWOJaDLDJUW6QY9j8HW8o89QSD7G3KhwyhBP3sJTjtfPy3iFmqhpmqTB92tjX1dapkcSPRYnCkuoLmmVN0/O0c6zDwJNVrtgJKvxUH/NI276FzS6Z1VuzM9/tYOy3ZHKR4DrZxOH51nHuOA9mry14mkNIlYQ7TD/k7/s5nIDfdx9L9fr7AtjGKFp3VXLRa55QA7hBa85JYW97ZyZtMKUKAidOA6w2kyDAJTiee0wIZHbaVthRWiZr/9A5fKelwIphKJ9d0nbyI5Ea7VA8sjg==;
	5:AP/TKN9mo1xLKcJHCZaZWCJy5qrU5PlwbJkiAcS43d2IcJ5vj1561Bm3Z/D2XGXnZanjBgy16C1CtqctAR3hMrWA0c1GiXtosw4DOkoGzsBgJNz4waLQv+eGosKqEUJWreTvn0trhsLZuMxGvhv9JA==;
	24:9RpAxiqUjTLfqAVq2VoRz8c4XNxT+gjbOy5m87dVdiiBPOiHO++JWbZErxt4z+V1vLIfl1loNqY1OfurGtbRoLROny10vZpaNDCte67tlmo=;
	7:SSRpSFYh4UTig7TqbmprVDjCiXs1UgpK1FGdWkUggs25GV4K0WCu/Fhu+hOQLbP2Vm5vVcCgR2RmKM7AWVixLIQ6/dO4b/yYe8INwYhNPxEBCNI+nvtG+q1hQdQ+rs8+FlVUTUI9JtR6LDOdilO72x1a26CGEKxgeojbCCmTQAU49UKKIhn+zYP5j+VcuPkpADAQBqojcKfXPcfsQ1/sWK57vDKEeh7mnQiwZj6VnLE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 06:36:27.7559 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR00MB235
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.85
Subject: [Qemu-devel] [PATCH v4 3/5] virtio-iommu: Call iommu notifier for
 attach/detach
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
Cc: wei@redhat.com, kevin.tian@intel.com,
	Bharat Bhushan <Bharat.Bhushan@nxp.com>, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org, bharatb.yadav@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x34rPiURMku8

iommu-notifier are called when a device is attached
or detached to as address-space.
This is needed for VFIO.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
v3->v4:
 Follwoig fixes by Eric
 - Return "false" from virtio_iommu_mapping_unmap/map()
 - Calling virtio_iommu_notify_unmap/map() for all device in as

 hw/virtio/virtio-iommu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 085e972..ff91bce 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -127,8 +127,42 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
     memory_region_notify_iommu(mr, entry);
 }
 
+static gboolean virtio_iommu_mapping_unmap(gpointer key, gpointer value,
+                                           gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_unmap(mr, mapping->virt_addr, mapping->size);
+
+    return false;
+}
+
+static gboolean virtio_iommu_mapping_map(gpointer key, gpointer value,
+                                         gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_map(mr, mapping->virt_addr, mapping->phys_addr,
+                            mapping->size);
+
+    return false;
+}
+
 static void virtio_iommu_detach_dev_from_as(viommu_dev *dev)
 {
+    VirtioIOMMUNotifierNode *node;
+    VirtIOIOMMU *s = dev->viommu;
+    viommu_as *as = dev->as;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        if (dev->id == node->iommu_dev->devfn) {
+            g_tree_foreach(as->mappings, virtio_iommu_mapping_unmap,
+                           &node->iommu_dev->iommu_mr);
+        }
+    }
+
     QLIST_REMOVE(dev, next);
     dev->as = NULL;
 }
@@ -260,6 +294,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     uint32_t asid = le32_to_cpu(req->address_space);
     uint32_t devid = le32_to_cpu(req->device);
     uint32_t reserved = le32_to_cpu(req->reserved);
+    VirtioIOMMUNotifierNode *node;
     viommu_as *as;
     viommu_dev *dev;
 
@@ -284,6 +319,14 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     dev->as = as;
     g_tree_ref(as->mappings);
 
+    /* replay existing address space mappings on the associated mr */
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        if (devid == node->iommu_dev->devfn) {
+            g_tree_foreach(as->mappings, virtio_iommu_mapping_map,
+                           &node->iommu_dev->iommu_mr);
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
 
-- 
1.9.3

