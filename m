Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3349178wrd;
        Fri, 21 Sep 2018 09:41:29 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbqhdjTzKr1KMfUP85NbMG8Hp264EvokiZuf0+zHHj0xuKZLko2aeZRQezHELONg8qzImgb
X-Received: by 2002:ac8:2db3:: with SMTP id p48-v6mr33277360qta.238.1537548088961;
        Fri, 21 Sep 2018 09:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537548088; cv=none;
        d=google.com; s=arc-20160816;
        b=r3X5zTGMSCyZ09P4Kr+RnvUcXt8AwDfpVJo7x51xnqef8Varffbzz7HxYHV0Fd7QhD
         dcxN13jQXlCFhnwPV2BjldLYcBItD74IR+LlSTV8pHnxF5cLsLikrHa+DhHE0WQqlOKj
         hKl7wwM1zkvtPRSFAoSFSguapGQs38AMMzo4BCSik0a5Z/vmQuNMqoMfV0CeGNQTwRJP
         SqwuOwF+gY0dFUTz25f8qGt9QYnSggkp9QPoSfrm5NMYh2Z9kPuKKXFpBJ2Hl+hyYQER
         TImLlTZQTdhZw+L1cRkHziGzUUml0H/iUr7pVRpJFaCVqLAPLIz0RoW5B1RwQ9lGK4XO
         KFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=U/0Q5IevpHN1+VZ1HVS0b5fmlpOvEhrUi26JMbmWVf4=;
        b=wq6qm3w1oMK9ElXLls0ssej1QM2aEK9zIrp34r4KiZGwKlmWxCMFvEudhQqmQOr64s
         yADd1aInf8PtYenL/4q5GAVlsuOvB8aNL7kPXqTyObYFQxeGN17omBA9T0xIYnOdmb80
         Cokfz0sWvglH6tm5+1FqQabs+ogFggr/MRIPb2+S+iBAcb/9Diw7wXu+JSYbdNn34wK/
         Z/WgZEnOtLapIW9ns+PL9mLIIPPPy+obc7WCBSyipQsp8rKxkIhZbQ3Rx7+Zo1Tyw6Ce
         ++1Ex3PCfYRjrYmYihpzwn5Ii6yIEe8trkK3yELYOhTHu4fIUlGK1cwB5nAkliP+2G3L
         eoKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v17-v6si5298927qta.297.2018.09.21.09.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OUi-0006Gj-GZ
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:41:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OQp-0002Rn-De
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:37:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OB3-0004Q2-1d
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:13 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:42722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OB0-0004Me-EM
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:06 -0400
Received: from player799.ha.ovh.net (unknown [10.109.159.222])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 13D121D7720
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:21:03 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 9FF5A520093;
	Fri, 21 Sep 2018 18:20:53 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:35 +0200
Message-Id: <20180921161939.822-8-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1904459693030738752
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.178.58
Subject: [Qemu-arm] [PATCH v2 07/11] aspeed/smc: add a 'sdram_base' and
 'max-ram-size' properties
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ttyWHcD1ew1

The setting of the DRAM address of the DMA transaction depends on the
DRAM base address and the maximum DRAM size of the SoC. Let's add a
couple of properties to give this information to the SMC controller
model.

Also, move the SDRAM Memory controller realization before the other
controllers which need it.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  4 ++++
 hw/arm/aspeed_soc.c         | 28 +++++++++++++++++++---------
 hw/ssi/aspeed_smc.c         |  2 ++
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 1f557313fa93..d7090bb5e9b7 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -97,6 +97,10 @@ typedef struct AspeedSMCState {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
=20
+    /* for DMA support */
+    uint64_t sdram_base;
+    uint64_t max_ram_size;
+
     AspeedSMCFlash *flashes;
 } AspeedSMCState;
=20
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 2cbacb4430bb..bbc05d172fe1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -209,6 +209,14 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
=20
+    /* SDMC - SDRAM Memory Controller */
+    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
+
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
     if (err) {
@@ -252,7 +260,17 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
=20
     /* FMC, The number of CS is set at the board level */
-    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
+    object_property_set_int(OBJECT(&s->fmc), sc->info->sdram_base, "sdra=
m-base",
+                            &err);
+    object_property_set_int(OBJECT(&s->fmc), s->sdmc.max_ram_size,
+                            "max-ram-size", &local_err);
+    error_propagate(&err, local_err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_e=
rr);
+    error_propagate(&err, local_err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -278,14 +296,6 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                         s->spi[i].ctrl->flash_window_base);
     }
=20
-    /* SDMC - SDRAM Memory Controller */
-    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
-
     /* Watch dog */
     for (i =3D 0; i < sc->info->wdts_num; i++) {
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &=
err);
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6045ca11b969..500de6d16d09 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -800,6 +800,8 @@ static const VMStateDescription vmstate_aspeed_smc =3D=
 {
=20
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
+    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
+    DEFINE_PROP_UINT64("max-ram-size", AspeedSMCState, max_ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.17.1

