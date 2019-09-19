Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp584919wrp;
        Wed, 18 Sep 2019 22:54:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIIjpPUQ4uCnWmb/230IZMEBd0fFis4zVA3N0FT9c/+K469zbU4RHrAgBqcQz09vWRveis
X-Received: by 2002:a17:906:3294:: with SMTP id 20mr12620267ejw.19.1568872492341;
        Wed, 18 Sep 2019 22:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568872492; cv=none;
        d=google.com; s=arc-20160816;
        b=ygH1ViEHnS8ZDz5d6PO+JAqEToB9e2aanFUVlOSGvcCfJnc3BXBgLua7yoKrxtZ161
         FBlgF5HsgZc7tA3nE+OpW8v2jxpR/VV+1ruCMI4urNLb2H64cfoGUm4egVDk4MXT6NLQ
         NZFkEIPxsUJZ5cjtntuW95y5r2XTCGAxiMfGPo+iWz8deBSTL1a2bKy3SNc5zV6UEWO7
         WTPN0Vx6MkO0Z8HgEm8uTdHelvS6k+WQTX2hLuemCicnmB362N/bXmYzwjyvT33AfF5V
         TnjDexM3QtQYgdkQkFgUo1wySmGJyjk+e8kbOkeWerXMwYrzMNOKf4AA4puassq7pYYt
         s3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nW2C18FkgQ9c4w/krfzCdXTSMKQaw3VWH7MDPk+9O8M=;
        b=zElyP2O2qS3ZzerSz8TcyrXpUMojUcQXDFwshaEvSmdTUZLRP4EAAUsAG/NMEFpdpr
         gZJtS8DFrgZrlNXelxM0rw/5RGN7k91OOsE+k6JhB6v3zPi8TWVSd7dTt3O1ZMHlp3/u
         iCguLTAHlkaCI2WDzYc3wRybl5fuIuhihA5VgbNc1+DCL1S6jta8NnbfWI7Ml6/4YqC9
         FnA8v52oJmzGH5r5fbIA+SSADW4QG2M0GZkTubcYxySioUXf8vPL6LjLIdaiMwDMLTTS
         um/AcNW6bVrzQbfOEsX9w/2jX6Ri9R66Kv2gRle/byROUiuVxJ/Z6uak6Ro2OId+vYAp
         3x2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si4292683ejq.243.2019.09.18.22.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 22:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iApP0-0005er-MT
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 01:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApLg-0001av-0J
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:51:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApLe-0008DE-Af
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:51:23 -0400
Received: from 16.mo6.mail-out.ovh.net ([87.98.139.208]:47482)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApLe-0008C5-2F
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:51:22 -0400
Received: from player788.ha.ovh.net (unknown [10.108.42.88])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 4BB1A1E1249
 for <qemu-arm@nongnu.org>; Thu, 19 Sep 2019 07:51:20 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 8E9269F174A3;
 Thu, 19 Sep 2019 05:51:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:49:51 +0200
Message-Id: <20190919055002.6729-11-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1682094464071207697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.139.208
Subject: [Qemu-arm] [PATCH 10/21] watchdog/aspeed: Introduce an object class
 per SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dJ7ZGPe12rE0

It cleanups the current models for the Aspeed AST2400 and AST2500 SoCs
and prepares ground for future SoCs. It removes the need of the
'silicon_rev' property.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  18 ++++-
 hw/arm/aspeed_soc.c              |   9 ++-
 hw/watchdog/wdt_aspeed.c         | 122 ++++++++++++++++---------------
 3 files changed, 86 insertions(+), 63 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index 8c5691ce2047..796342764e2e 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -16,6 +16,8 @@
 #define TYPE_ASPEED_WDT "aspeed.wdt"
 #define ASPEED_WDT(obj) \
     OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
+#define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
+#define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
=20
 #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
=20
@@ -30,8 +32,20 @@ typedef struct AspeedWDTState {
=20
     AspeedSCUState *scu;
     uint32_t pclk_freq;
-    uint32_t silicon_rev;
-    uint32_t ext_pulse_width_mask;
 } AspeedWDTState;
=20
+#define ASPEED_WDT_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AspeedWDTClass, (klass), TYPE_ASPEED_WDT)
+#define ASPEED_WDT_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AspeedWDTClass, (obj), TYPE_ASPEED_WDT)
+
+typedef struct AspeedWDTClass {
+    SysBusDeviceClass parent_class;
+
+    uint32_t offset;
+    uint32_t ext_pulse_width_mask;
+    uint32_t reset_ctrl_reg;
+    void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
+}  AspeedWDTClass;
+
 #endif /* WDT_ASPEED_H */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index aaf18d3e42f1..5c5fcb810944 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -214,10 +214,9 @@ static void aspeed_soc_init(Object *obj)
                               "max-ram-size", &error_abort);
=20
     for (i =3D 0; i < sc->info->wdts_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
         sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
-                              sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
-        qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
-                                    sc->info->silicon_rev);
+                              sizeof(s->wdt[i]), typename);
         object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
                                        OBJECT(&s->scu), &error_abort);
     }
@@ -384,13 +383,15 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
=20
     /* Watch dog */
     for (i =3D 0; i < sc->info->wdts_num; i++) {
+        AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &=
err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->info->memmap[ASPEED_WDT] + i * 0x20);
+                        sc->info->memmap[ASPEED_WDT] + i * awc->offset);
     }
=20
     /* Net */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index f710036535da..fc0e6c486a70 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -54,21 +54,6 @@ static bool aspeed_wdt_is_enabled(const AspeedWDTState=
 *s)
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
 }
=20
-static bool is_ast2500(const AspeedWDTState *s)
-{
-    switch (s->silicon_rev) {
-    case AST2500_A0_SILICON_REV:
-    case AST2500_A1_SILICON_REV:
-        return true;
-    case AST2400_A0_SILICON_REV:
-    case AST2400_A1_SILICON_REV:
-    default:
-        break;
-    }
-
-    return false;
-}
-
 static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned si=
ze)
 {
     AspeedWDTState *s =3D ASPEED_WDT(opaque);
@@ -124,6 +109,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr off=
set, uint64_t data,
                              unsigned size)
 {
     AspeedWDTState *s =3D ASPEED_WDT(opaque);
+    AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(s);
     bool enable =3D data & WDT_CTRL_ENABLE;
=20
     offset >>=3D 2;
@@ -153,24 +139,13 @@ static void aspeed_wdt_write(void *opaque, hwaddr o=
ffset, uint64_t data,
         }
         break;
     case WDT_RESET_WIDTH:
-    {
-        uint32_t property =3D data & WDT_POLARITY_MASK;
-
-        if (property && is_ast2500(s)) {
-            if (property =3D=3D WDT_ACTIVE_HIGH_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_ACTIVE_HIG=
H;
-            } else if (property =3D=3D WDT_ACTIVE_LOW_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_ACTIVE_HI=
GH;
-            } else if (property =3D=3D WDT_PUSH_PULL_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_PUSH_PULL;
-            } else if (property =3D=3D WDT_OPEN_DRAIN_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_PUSH_PULL=
;
-            }
+        if (awc->reset_pulse) {
+            awc->reset_pulse(s, data & WDT_POLARITY_MASK);
         }
-        s->regs[WDT_RESET_WIDTH] &=3D ~s->ext_pulse_width_mask;
-        s->regs[WDT_RESET_WIDTH] |=3D data & s->ext_pulse_width_mask;
+        s->regs[WDT_RESET_WIDTH] &=3D ~awc->ext_pulse_width_mask;
+        s->regs[WDT_RESET_WIDTH] |=3D data & awc->ext_pulse_width_mask;
         break;
-    }
+
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
         qemu_log_mask(LOG_UNIMP,
@@ -226,9 +201,10 @@ static void aspeed_wdt_reset(DeviceState *dev)
 static void aspeed_wdt_timer_expired(void *dev)
 {
     AspeedWDTState *s =3D ASPEED_WDT(dev);
+    uint32_t reset_ctrl_reg =3D ASPEED_WDT_GET_CLASS(s)->reset_ctrl_reg;
=20
     /* Do not reset on SDRAM controller reset */
-    if (s->scu->regs[SCU_RESET_CONTROL1] & SCU_RESET_SDRAM) {
+    if (s->scu->regs[reset_ctrl_reg] & SCU_RESET_SDRAM) {
         timer_del(s->timer);
         s->regs[WDT_CTRL] =3D 0;
         return;
@@ -256,25 +232,6 @@ static void aspeed_wdt_realize(DeviceState *dev, Err=
or **errp)
     }
     s->scu =3D ASPEED_SCU(obj);
=20
-    if (!is_supported_silicon_rev(s->silicon_rev)) {
-        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
-                s->silicon_rev);
-        return;
-    }
-
-    switch (s->silicon_rev) {
-    case AST2400_A0_SILICON_REV:
-    case AST2400_A1_SILICON_REV:
-        s->ext_pulse_width_mask =3D 0xff;
-        break;
-    case AST2500_A0_SILICON_REV:
-    case AST2500_A1_SILICON_REV:
-        s->ext_pulse_width_mask =3D 0xfffff;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expir=
ed, dev);
=20
     /* FIXME: This setting should be derived from the SCU hw strapping
@@ -287,20 +244,15 @@ static void aspeed_wdt_realize(DeviceState *dev, Er=
ror **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
=20
-static Property aspeed_wdt_properties[] =3D {
-    DEFINE_PROP_UINT32("silicon-rev", AspeedWDTState, silicon_rev, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->desc =3D "ASPEED Watchdog Controller";
     dc->realize =3D aspeed_wdt_realize;
     dc->reset =3D aspeed_wdt_reset;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->vmsd =3D &vmstate_aspeed_wdt;
-    dc->props =3D aspeed_wdt_properties;
 }
=20
 static const TypeInfo aspeed_wdt_info =3D {
@@ -308,12 +260,68 @@ static const TypeInfo aspeed_wdt_info =3D {
     .name  =3D TYPE_ASPEED_WDT,
     .instance_size  =3D sizeof(AspeedWDTState),
     .class_init =3D aspeed_wdt_class_init,
+    .class_size    =3D sizeof(AspeedWDTClass),
+    .abstract      =3D true,
+};
+
+static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedWDTClass *awc =3D ASPEED_WDT_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2400 Watchdog Controller";
+    awc->offset =3D 0x20;
+    awc->ext_pulse_width_mask =3D 0xff;
+    awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
+}
+
+static const TypeInfo aspeed_2400_wdt_info =3D {
+    .name =3D TYPE_ASPEED_2400_WDT,
+    .parent =3D TYPE_ASPEED_WDT,
+    .instance_size =3D sizeof(AspeedWDTState),
+    .class_init =3D aspeed_2400_wdt_class_init,
+};
+
+static void aspeed_2500_wdt_reset_pulse(AspeedWDTState *s, uint32_t prop=
erty)
+{
+    if (property) {
+        if (property =3D=3D WDT_ACTIVE_HIGH_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property =3D=3D WDT_ACTIVE_LOW_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property =3D=3D WDT_PUSH_PULL_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_PUSH_PULL;
+        } else if (property =3D=3D WDT_OPEN_DRAIN_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_PUSH_PULL;
+        }
+    }
+}
+
+static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedWDTClass *awc =3D ASPEED_WDT_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2500 Watchdog Controller";
+    awc->offset =3D 0x20;
+    awc->ext_pulse_width_mask =3D 0xfffff;
+    awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
+    awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
+}
+
+static const TypeInfo aspeed_2500_wdt_info =3D {
+    .name =3D TYPE_ASPEED_2500_WDT,
+    .parent =3D TYPE_ASPEED_WDT,
+    .instance_size =3D sizeof(AspeedWDTState),
+    .class_init =3D aspeed_2500_wdt_class_init,
 };
=20
 static void wdt_aspeed_register_types(void)
 {
     watchdog_add_model(&model);
     type_register_static(&aspeed_wdt_info);
+    type_register_static(&aspeed_2400_wdt_info);
+    type_register_static(&aspeed_2500_wdt_info);
 }
=20
 type_init(wdt_aspeed_register_types)
--=20
2.21.0

