Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4993514lfp;
        Mon, 17 Feb 2020 03:53:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhs9j/VH0AMWVzDXUI+ca4qEuNfTmbbNg7RKHJap3d0ArYb6rSOxRuh5SpppI+L+JVD/KH
X-Received: by 2002:ac8:1ac1:: with SMTP id h1mr12604540qtk.255.1581940411258;
        Mon, 17 Feb 2020 03:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940411; cv=none;
        d=google.com; s=arc-20160816;
        b=rq1gYZBm/W/Yl7OGJDrXG9B4tEvf10cZu0eb12go5x76dl7L5s5oH/Glmmunex+8IO
         KHgqxD8/A8ABTYK8uu7ov40mHAGiW5WcfN8sQPeN0xqU/H4nCkZvdl5+09hteTD5pKDx
         6DSdUjhQKAp8mSVq2/KrF9CJ9bIUjPz4LRlwv4tKaQDpfYULjzaPe/VxExoenFl+d4ur
         +Jn86ibiSFL6X8CrKIXRRzJjz3o0RnkvXiA309+qlt/adSvsALUU6hwmYxZa/VRt5aVT
         s3K26TMKeKh4IP4K3/ThDioxAlqQjCGmHgy+xt3PaFnd8J7S8yA8HHLtnLEO0YxXCZi4
         Pepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pPEcldfHD5OEhzQuYmprGj9+p4+mZQlzGRO9gMQy3Os=;
        b=glGWf+UFULo30RwmYKKMa2RxqjKBeMgPUdxBaCY/jJ3OQNnCc8CPLCw62vZptohptG
         Rj95oyX4QY/+grCLREjZgyHRUsF83pyo/T34mUlKrHP0qssZ87xEBISpwoSGf0OMjCJ8
         04ctRXHw4bXlDfgFLB2ClKJlcKtShQk+9hSJciX2tyY+LUSjUYUBqFkYO6YHCWgShgBI
         4Kqu5VDM29LBIHDaXoImwjD8gWMCA9/MTRFbc3ha75sKo185cGMILlBYSP6tnzY2zNJ9
         NpAUCVJMilnEJpTO0FowkiBimsWk1k+6EcFDehK5MSPEQp7a6F8zFVvS8dnZw8JuV0BY
         irVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qrj8GGLK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si197301qkk.137.2020.02.17.03.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qrj8GGLK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3exu-0000pH-JO
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqS-0006fm-6k
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqQ-0002Su-KY
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:48 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqQ-0002S8-DS; Mon, 17 Feb 2020 06:45:46 -0500
Received: by mail-wm1-x344.google.com with SMTP id b17so18119939wmb.0;
 Mon, 17 Feb 2020 03:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPEcldfHD5OEhzQuYmprGj9+p4+mZQlzGRO9gMQy3Os=;
 b=Qrj8GGLKFR7uM64GuIhrtbZBoNRel8Grj4mZMXE531KxCMkBwaQcgnv6wBLKSmO4Jk
 8MGUrI6XOB/DHdsIqUQqGWnHpWqr/VPzZ4ftJRgt+1I3cWq/iUkObdcwzdo+McTWVqY/
 WNGE7AlrVS3UnBu3mzY7BoqsICtLGj+SIPqVaHovdLrxIrYhytGzGK4RgVroLWNbMEVx
 nXspmElSS2D+x+LF2KB0rHPK9bqdEQ0cLkyJv52RX3v89aNp9FCsNeQee3Uv9FbvuxSS
 iJRC7blPV6EBHjI043qJvoJPwd4pGHeCph+OIcJJy0UktMFofI5e2Bt4Uc9NK7o0EqiV
 nUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pPEcldfHD5OEhzQuYmprGj9+p4+mZQlzGRO9gMQy3Os=;
 b=fmaJH5Pocbr+xyNsQRUnNRIXoRpHP5HlVVWwEOfO3E/hxp/bbpBE3Q2h6f4RYKohcY
 4YjrbOdySZZV05g2trjpv4bhdPoxc5aL8IZvQFe+bUZwzm5ICxaVRuSLhIa/OK9Rlvo4
 or+M4QeZ2IzkXbkx2BuKZBum3IQe2dzBkXnUyWiPot8ozdf8OD5ZYmGe95mIOv5/EodQ
 S2l90Hwd4m4vflHVYEXsCJM4bRfLxNsOzX+FpylOyFWIbhPS6hat2pp57ClqGmN48Uq9
 pRQL9pZQegyfoLtFjpvpXvgWjzvEj47UWyIfVjGHNjt8g7D+CQePYYhywADWvL+FDkCl
 h5xQ==
X-Gm-Message-State: APjAAAUELAwUcD8uu53Vdqr+gA8bXBiV7++HhLb1qSzkButISay+WqDX
 PcbpBXdh1iFRM6QTjRE8RRcub5FDsw4=
X-Received: by 2002:a1c:a404:: with SMTP id n4mr21935617wme.186.1581939945081; 
 Mon, 17 Feb 2020 03:45:45 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/13] hw/arm/bcm2836: QOM'ify more by adding class_init()
 to each SoC type
Date: Mon, 17 Feb 2020 12:45:27 +0100
Message-Id: <20200217114533.17779-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jaXfZ/vTgF1E

Remove usage of TypeInfo::class_data. Instead fill the fields in
the corresponding class_init().

Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 109 ++++++++++++++++++++++-------------------------
 1 file changed, 51 insertions(+), 58 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 24109fef1d..683d04d6ea 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -16,57 +16,30 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
 
-typedef struct BCM283XInfo BCM283XInfo;
-
 typedef struct BCM283XClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
-    const BCM283XInfo *info;
-} BCM283XClass;
-
-struct BCM283XInfo {
-    const char *name;
     const char *cpu_type;
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
-};
+} BCM283XClass;
 
 #define BCM283X_CLASS(klass) \
     OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
 #define BCM283X_GET_CLASS(obj) \
     OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
 
-static const BCM283XInfo bcm283x_socs[] = {
-    {
-        .name = TYPE_BCM2836,
-        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a7"),
-        .peri_base = 0x3f000000,
-        .ctrl_base = 0x40000000,
-        .clusterid = 0xf,
-    },
-#ifdef TARGET_AARCH64
-    {
-        .name = TYPE_BCM2837,
-        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a53"),
-        .peri_base = 0x3f000000,
-        .ctrl_base = 0x40000000,
-        .clusterid = 0x0,
-    },
-#endif
-};
-
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
     BCM283XClass *bc = BCM283X_GET_CLASS(obj);
-    const BCM283XInfo *info = bc->info;
     int n;
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
-                                sizeof(s->cpu[n].core), info->cpu_type,
+                                sizeof(s->cpu[n].core), bc->cpu_type,
                                 &error_abort, NULL);
     }
 
@@ -85,7 +58,6 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 {
     BCM283XState *s = BCM283X(dev);
     BCM283XClass *bc = BCM283X_GET_CLASS(dev);
-    const BCM283XInfo *info = bc->info;
     Object *obj;
     Error *err = NULL;
     int n;
@@ -119,7 +91,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     }
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
-                            info->peri_base, 1);
+                            bc->peri_base, 1);
 
     /* bcm2836 interrupt controller (and mailboxes, etc.) */
     object_property_set_bool(OBJECT(&s->control), true, "realized", &err);
@@ -128,7 +100,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, info->ctrl_base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, bc->ctrl_base);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
@@ -137,11 +109,11 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
         /* TODO: this should be converted to a property of ARM_CPU */
-        s->cpu[n].core.mp_affinity = (info->clusterid << 8) | n;
+        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
 
         /* set periphbase/CBAR value for CPU-local registers */
         object_property_set_int(OBJECT(&s->cpu[n].core),
-                                info->peri_base,
+                                bc->peri_base,
                                 "reset-cbar", &err);
         if (err) {
             error_propagate(errp, err);
@@ -190,38 +162,59 @@ static Property bcm2836_props[] = {
 static void bcm283x_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    BCM283XClass *bc = BCM283X_CLASS(oc);
 
-    bc->info = data;
-    dc->realize = bcm2836_realize;
-    device_class_set_props(dc, bcm2836_props);
     /* Reason: Must be wired up in code (see raspi_init() function) */
     dc->user_creatable = false;
 }
 
-static const TypeInfo bcm283x_type_info = {
-    .name = TYPE_BCM283X,
-    .parent = TYPE_DEVICE,
-    .instance_size = sizeof(BCM283XState),
-    .instance_init = bcm2836_init,
-    .class_size = sizeof(BCM283XClass),
-    .abstract = true,
+static void bcm2836_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    BCM283XClass *bc = BCM283X_CLASS(oc);
+
+    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    bc->peri_base = 0x3f000000;
+    bc->ctrl_base = 0x40000000;
+    bc->clusterid = 0xf;
+    dc->realize = bcm2836_realize;
+    device_class_set_props(dc, bcm2836_props);
 };
 
-static void bcm2836_register_types(void)
+#ifdef TARGET_AARCH64
+static void bcm2837_class_init(ObjectClass *oc, void *data)
 {
-    int i;
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    BCM283XClass *bc = BCM283X_CLASS(oc);
 
-    type_register_static(&bcm283x_type_info);
-    for (i = 0; i < ARRAY_SIZE(bcm283x_socs); i++) {
-        TypeInfo ti = {
-            .name = bcm283x_socs[i].name,
-            .parent = TYPE_BCM283X,
-            .class_init = bcm283x_class_init,
-            .class_data = (void *) &bcm283x_socs[i],
-        };
-        type_register(&ti);
+    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    bc->peri_base = 0x3f000000;
+    bc->ctrl_base = 0x40000000;
+    bc->clusterid = 0x0;
+    dc->realize = bcm2836_realize;
+    device_class_set_props(dc, bcm2836_props);
+};
+#endif
+
+static const TypeInfo bcm283x_types[] = {
+    {
+        .name           = TYPE_BCM2836,
+        .parent         = TYPE_BCM283X,
+        .class_init     = bcm2836_class_init,
+#ifdef TARGET_AARCH64
+    }, {
+        .name           = TYPE_BCM2837,
+        .parent         = TYPE_BCM283X,
+        .class_init     = bcm2837_class_init,
+#endif
+    }, {
+        .name           = TYPE_BCM283X,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(BCM283XState),
+        .instance_init  = bcm2836_init,
+        .class_size     = sizeof(BCM283XClass),
+        .class_init     = bcm283x_class_init,
+        .abstract       = true,
     }
-}
+};
 
-type_init(bcm2836_register_types)
+DEFINE_TYPES(bcm283x_types)
-- 
2.21.1

