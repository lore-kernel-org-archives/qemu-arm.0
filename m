Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp584039lfc;
        Tue, 19 Nov 2019 06:13:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqy6Jt8rh23odUiCl7gAbMua1B8/sK5+PzSlMgGaasz6+7Uf5+A9EnX9fV/+cpx7lbeREROv
X-Received: by 2002:a0c:ee8c:: with SMTP id u12mr17353436qvr.170.1574172787120;
        Tue, 19 Nov 2019 06:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172787; cv=none;
        d=google.com; s=arc-20160816;
        b=XkdS61MH0+p5xGJ5ZYfrgoGDEFRKu4k8MfgU25AzUuwcxlOKU8Vb8GmEstGke2DMxS
         qaxdw6RkFnZ0FEMDcRYHagaWpgileMpRfd0giReb4tOlk5SMoFkDmXJZcFNAr9HDG6v8
         MD/AUoitw+1YDJD7VuCl3EFMSYwUVWzC4H4bSa6MZ5YUwfeGp38f4F3kWJLwXNFELoHY
         aUjUD8F32G/QkWELHW7yinH13sAqfAJoW2p661Tw2Q3fgxfxJPvBoplDT+MsgGhrjEBu
         r7sZaIuvKhgHIQjdhmJ0moYvaW7VIgdQlZ0jSZL1QXGcHqlZZEOE7GFheF+LsMjYmYeK
         PZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=92BaX+zwKRLI8IsgX6pLlRW03ksxd4WkiEdxYZIDrxM=;
        b=D4/m5EU4JQ2yvXd6t/LzO8NDCNAVCkl4maEOOpA2U95hl5R1l7gI5oquqtRpaeM6N/
         LZBVYxQv38XlOnp+p59GGi5ynojXG7BjCMNmEqTbTAh61iiyJaKsHKKWAMMuV289eHeJ
         X9giO6EfL/0PwitFkExbPCLOuP2GG2UsdwaZtVoTqLMv/cuY/PHWLVC+R2LsaUllCfIx
         g4kc26Sl0Rnlb/EjBvEhipubiGmNZ3RAVcDWVgcY1GnjquuU2j4faXCHqL+nCTrH7TXH
         Ez7EptPovSVeTSd4P6V2YoXq5ywdpIHk/6yvBVDUI4sAGXgwXgYTli55pab/WMDIfhjy
         FKKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u56si13538607qtb.323.2019.11.19.06.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:13:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4Fd-0005en-Px
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4FN-0005Yv-Ss
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:12:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4FM-0005B1-KN
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:12:49 -0500
Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219]:57047)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4FM-0005AL-E4
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:12:48 -0500
Received: from player795.ha.ovh.net (unknown [10.108.54.94])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id C10B314CCAF
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 15:12:46 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id F1282C18A87B;
 Tue, 19 Nov 2019 14:12:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 03/17] aspeed: Add a DRAM memory region at the SoC level
Date: Tue, 19 Nov 2019 15:11:57 +0100
Message-Id: <20191119141211.25716-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17896741971556928273
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedv
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.74.219
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0hy2Xd/eMSfQ

Currently, we link the DRAM memory region to the FMC model (for DMAs)
through a property alias at the SoC level. The I2C model will need a
similar region for DMA support, add a DRAM region property at the SoC
level for both model to use.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast2600.c     | 7 +++++--
 hw/arm/aspeed_soc.c         | 9 +++++++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 495c08be1b84..e84380984f7b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -40,6 +40,7 @@ typedef struct AspeedSoCState {
     ARMCPU cpu[ASPEED_CPUS_NUM];
     uint32_t num_cpus;
     A15MPPrivState     a7mpcore;
+    MemoryRegion *dram_mr;
     MemoryRegion sram;
     AspeedVICState vic;
     AspeedRtcState rtc;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 931887ac681f..a403c2aae067 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -158,8 +158,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
                           typename);
     object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
                               &error_abort);
-    object_property_add_alias(obj, "dram", OBJECT(&s->fmc), "dram",
-                              &error_abort);
=20
     for (i =3D 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
@@ -362,6 +360,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     }
=20
     /* FMC, The number of CS is set at the board level */
+    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram"=
, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_int(OBJECT(&s->fmc), sc->memmap[ASPEED_SDRAM],
                             "sdram-base", &err);
     if (err) {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index f4fe243458fd..dd1ee0e3336d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -175,8 +175,6 @@ static void aspeed_soc_init(Object *obj)
                           typename);
     object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
                               &error_abort);
-    object_property_add_alias(obj, "dram", OBJECT(&s->fmc), "dram",
-                              &error_abort);
=20
     for (i =3D 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
@@ -323,6 +321,11 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                        aspeed_soc_get_irq(s, ASPEED_I2C));
=20
     /* FMC, The number of CS is set at the board level */
+    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram"=
, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_int(OBJECT(&s->fmc), sc->memmap[ASPEED_SDRAM],
                             "sdram-base", &err);
     if (err) {
@@ -429,6 +432,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
+    DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.21.0

