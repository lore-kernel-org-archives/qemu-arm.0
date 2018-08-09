Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1880576wru;
        Thu, 9 Aug 2018 06:09:01 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwAomr0eKqd3kix6FV1A91ifb8F6JPlqmjXW6qWhClvXBH550iyhWReEX8djFMSHNKnpCsK
X-Received: by 2002:a37:11aa:: with SMTP id 42-v6mr1762284qkr.149.1533820141721;
        Thu, 09 Aug 2018 06:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533820141; cv=none;
        d=google.com; s=arc-20160816;
        b=rAeE0v8/GerRHLw9j6GRq/mtwx1A+UmS2KO47AvmHXCUGE9WC9/fDU6kDpHdHlk+Go
         21IG6zzSam9skxJq6CqmRKMXg7mCZTSc6juNCCOILV/TZmbzwPSxRy3Ldu1sDyeu6wYR
         GAV1OuMU4PDRG4ne1U1lsTdGaGWVoDYyG52veUeBs6ziwxd1uVpOT9bGQBGZLBzlF6nt
         s48uVjwBUe7XOejrkY1Vp7nw5BQpdLHED36kdZlJcpyRefvFg4+krxOjYAnFq5bFe9Np
         KulfDPHk2meqCXVHGd1QGQugwZS2/hQDb8aSQE/Nz5G/46iNmx+iQMDuPD+/WKgJF+9f
         sRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0Jz+Eb8e6otRJbbxXrmPYDc1XCYA80Yv63sZDnWMjYY=;
        b=fM/KghSCE2NpxhDkruaHJ7ea3DvztQXt+zV9EFCXe2EZN7vo2Gzfo6xHdac5g/IuZz
         S/TBAXLsTf0klnWI7LruwFcPj01TrnErhrtUmyHTv2Sep9f+cD4RfJURM27tQUdyC581
         wYD9Wtg4/dW3NZFg0fwdEfIlm1vHlTOoiMdlbIq4VZ44pRyXrW2WUXmV0w7L0v1zB7v1
         Amv9542Q1CCve7S4wJYaza1cxPkzBgDhTUz8yrACefAWvRWZt6f1nB9z/QmnnAO7LbNK
         Sr/6y/nr26Y/YHsKU3DFz7smti2y/zHe7iZ7dn0l2jVVRfZPYZrJm8/lTIrNXj+jh5aT
         NvIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17-v6si6918782qta.399.2018.08.09.06.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkgX-0004G8-6H
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:09:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZR-0005yU-Ie
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZH-0003Ic-Ka
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZH-0003Hp-AF; Thu, 09 Aug 2018 09:01:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZ7-0003G1-Lf; Thu, 09 Aug 2018 14:01:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:02 +0100
Message-Id: <20180809130115.28951-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/16] hw/arm/iotkit: Wire up the watchdogs
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MJbB2CiOFGCs

The IoTKit includes three different instances of the
CMSDK APB watchdog; create and wire them up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h |  6 +++++
 hw/arm/iotkit.c         | 58 ++++++++++++++++++++++++++++++++++++++---
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 3e6d806e352..776d0497087 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -57,6 +57,7 @@
 #include "hw/misc/tz-mpc.h"
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
+#include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
@@ -87,10 +88,15 @@ typedef struct IoTKit {
     SplitIRQ ppc_irq_splitter[NUM_PPCS];
     SplitIRQ mpc_irq_splitter[IOTS_NUM_EXP_MPC + IOTS_NUM_MPC];
     qemu_or_irq mpc_irq_orgate;
+    qemu_or_irq nmi_orgate;
 
     CMSDKAPBDualTimer dualtimer;
     UnimplementedDeviceState s32ktimer;
 
+    CMSDKAPBWatchdog s32kwatchdog;
+    CMSDKAPBWatchdog nswatchdog;
+    CMSDKAPBWatchdog swatchdog;
+
     MemoryRegion container;
     MemoryRegion alias1;
     MemoryRegion alias2;
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 130d013909e..5cedfa03570 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -19,6 +19,9 @@
 #include "hw/misc/unimp.h"
 #include "hw/arm/arm.h"
 
+/* Clock frequency in HZ of the 32KHz "slow clock" */
+#define S32KCLK (32 * 1000)
+
 /* Create an alias region of @size bytes starting at @base
  * which mirrors the memory starting at @orig.
  */
@@ -140,6 +143,15 @@ static void iotkit_init(Object *obj)
                           TYPE_CMSDK_APB_TIMER);
     sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
                           TYPE_CMSDK_APB_DUALTIMER);
+    sysbus_init_child_obj(obj, "s32kwatchdog", &s->s32kwatchdog,
+                          sizeof(s->s32kwatchdog), TYPE_CMSDK_APB_WATCHDOG);
+    sysbus_init_child_obj(obj, "nswatchdog", &s->nswatchdog,
+                          sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
+    sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
+                          sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
+    object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
+                            sizeof(s->nmi_orgate), TYPE_OR_IRQ,
+                            &error_abort, NULL);
     object_initialize_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
                             sizeof(s->ppc_irq_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -510,12 +522,52 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
 
     create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
-    create_unimplemented_device("S32KWATCHDOG", 0x5002e000, 0x1000);
+
+    /* This OR gate wires together outputs from the secure watchdogs to NMI */
+    object_property_set_int(OBJECT(&s->nmi_orgate), 2, "num-lines", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->nmi_orgate), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
+                          qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
+
+    qdev_prop_set_uint32(DEVICE(&s->s32kwatchdog), "wdogclk-frq", S32KCLK);
+    object_property_set_bool(OBJECT(&s->s32kwatchdog), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32kwatchdog), 0,
+                       qdev_get_gpio_in(DEVICE(&s->nmi_orgate), 0));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->s32kwatchdog), 0, 0x5002e000);
 
     /* 0x40080000 .. 0x4008ffff : IoTKit second Base peripheral region */
 
-    create_unimplemented_device("NS watchdog", 0x40081000, 0x1000);
-    create_unimplemented_device("S watchdog", 0x50081000, 0x1000);
+    qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
+    object_property_set_bool(OBJECT(&s->nswatchdog), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nswatchdog), 0,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m), 1));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
+
+    qdev_prop_set_uint32(DEVICE(&s->swatchdog), "wdogclk-frq", s->mainclk_frq);
+    object_property_set_bool(OBJECT(&s->swatchdog), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->swatchdog), 0,
+                       qdev_get_gpio_in(DEVICE(&s->nmi_orgate), 1));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->swatchdog), 0, 0x50081000);
 
     for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
         Object *splitter = OBJECT(&s->ppc_irq_splitter[i]);
-- 
2.17.1

