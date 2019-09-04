Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp355521wrp;
        Wed, 4 Sep 2019 00:08:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyiteP7g87QGjoTUcWqkQOd2CBCxCRouZqJPkrYvZ9k2L1mX6t2hQ3nuscOopVt1qr0Apje
X-Received: by 2002:a17:906:185b:: with SMTP id w27mr31763480eje.203.1567580907779;
        Wed, 04 Sep 2019 00:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567580907; cv=none;
        d=google.com; s=arc-20160816;
        b=CpfRbxD1kn8Pxk879xNkrieYcKneKZ3UrzZmwxeYF1ciHZi60ACBBjZgtukKG3dAzc
         ga1hOasLL7c5+HjGjZkePuIiMJTvsdmKcVjzXkcZgSwmnZ+Sw5NwuRNPnpfFKj2Ink7/
         27tIyGMDj80+yESGP5GYTUOmAcxo7cvDO3aB6o2C3q/d6f3deUu4nyu2Zpxf4EY5kk12
         J2kZwnVSzBzeesMiuz1pTgbWavoSPEVQa7Kx14zcicS3WtB+rRKklJnd3LpTqKtPFxuk
         /ObJT7JluuC2HxpR9x1nzlUDk1+dK1IyZ1+LDhyvLui7meLmD5MzSleDdddSzSDE8gpS
         iUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uAlh3bVDuyz1KbqyMpHj466DRvzU3zKXvLyYwIqJYyA=;
        b=GDS+EbMc75/lJagg3VlfsZinCYTx5AkYTZS1/Ejhf+8Z1TgPecpucOPw7fonRidgzK
         9w4AZL/Md1UTA+8NBa6Rzc1++gBkXFpqNi3EcpQcGLBEIFCVPlRSx7sHeYBokxH94a81
         KFXOphFw72B2X8DfG7fQMmGcBMJgg1lIQ5eFnVi6pKD2LH+V/Z3KGNJlVR3X6KHSA1PM
         8c/wtyAKDLbqtZbETVQN49LQfZL9uhDReRf1eJl4kGeNeOuwV6s9EOvceZHmB8PwyRna
         n8923WupQbuI0K7yKPJsOh+t6Gxljru+Auy6GwN323m7sNr59zsiUnm2Izt4tXuq2fvy
         IIlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hh2si9334821ejb.211.2019.09.04.00.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 00:08:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5POz-00036Q-U2
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 03:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PMK-0001LY-Sq
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PMJ-0006En-8t
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:05:40 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:45917)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PMJ-0006Cl-1c
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:05:39 -0400
Received: from player690.ha.ovh.net (unknown [10.109.143.145])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 5F5F313FBC2
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 09:05:36 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 728F994DC791;
 Wed,  4 Sep 2019 07:05:27 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:04:58 +0200
Message-Id: <20190904070506.1052-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
References: <20190904070506.1052-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7079658615204514577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.76
Subject: [Qemu-devel] [PATCH 02/10] aspeed: add a GPIO controller to the SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lN0tMSyRRZt7

From: Rashmica Gupta <rashmica.g@gmail.com>

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_soc.c         | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 976fd6be93f6..a56effebc16e 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -23,6 +23,7 @@
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
+#include "hw/gpio/aspeed_gpio.h"
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  3
@@ -48,6 +49,7 @@ typedef struct AspeedSoCState {
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
+    AspeedGPIOState gpio;
 } AspeedSoCState;
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -61,6 +63,7 @@ typedef struct AspeedSoCInfo {
     int spis_num;
     const char *fmc_typename;
     const char **spi_typename;
+    const char *gpio_typename;
     int wdts_num;
     const int *irqmap;
     const hwaddr *memmap;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 9ee81048326e..04480875d0d8 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -125,6 +125,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .spis_num     =3D 1,
         .fmc_typename =3D "aspeed.smc.fmc",
         .spi_typename =3D aspeed_soc_ast2400_typenames,
+        .gpio_typename =3D "aspeed.gpio-ast2400",
         .wdts_num     =3D 2,
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
@@ -137,6 +138,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .spis_num     =3D 1,
         .fmc_typename =3D "aspeed.smc.fmc",
         .spi_typename =3D aspeed_soc_ast2400_typenames,
+        .gpio_typename =3D "aspeed.gpio-ast2400",
         .wdts_num     =3D 2,
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
@@ -149,6 +151,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .spis_num     =3D 1,
         .fmc_typename =3D "aspeed.smc.fmc",
         .spi_typename =3D aspeed_soc_ast2400_typenames,
+        .gpio_typename =3D "aspeed.gpio-ast2400",
         .wdts_num     =3D 2,
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
@@ -161,6 +164,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .spis_num     =3D 2,
         .fmc_typename =3D "aspeed.smc.ast2500-fmc",
         .spi_typename =3D aspeed_soc_ast2500_typenames,
+        .gpio_typename =3D "aspeed.gpio-ast2500",
         .wdts_num     =3D 3,
         .irqmap       =3D aspeed_soc_ast2500_irqmap,
         .memmap       =3D aspeed_soc_ast2500_memmap,
@@ -247,6 +251,9 @@ static void aspeed_soc_init(Object *obj)
=20
     sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma)=
,
                           TYPE_ASPEED_XDMA);
+
+    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpio)=
,
+                          sc->info->gpio_typename);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -426,6 +433,16 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                     sc->info->memmap[ASPEED_XDMA]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
                        aspeed_soc_get_irq(s, ASPEED_XDMA));
+
+    /* GPIO */
+    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->info->memmap[ASPEED=
_GPIO]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
+                       aspeed_soc_get_irq(s, ASPEED_GPIO));
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
--=20
2.21.0

