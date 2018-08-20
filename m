Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp740685wrd;
        Mon, 20 Aug 2018 07:18:17 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxZoJvOE+NWBi3QcKl1LHa3uAc/o5Ji8m4SsOdW4oWF55vek0oClCfvdJN6kwcwti5ZOUDx
X-Received: by 2002:a37:79c5:: with SMTP id u188-v6mr39452455qkc.82.1534774697075;
        Mon, 20 Aug 2018 07:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774697; cv=none;
        d=google.com; s=arc-20160816;
        b=pcQJNy007LlKELL6659ZbEaVNUziDcbkI97sOSimicb7fwaBHmhIFRG61+jMQCByeh
         qDydJ497rFTp6G5OCA6cQqq5RZ2A6ypMeprXNKvrkgRtOwHTnDtA1DX5iMz0wxkTNPd6
         NqNrsVT6yy/ct15r9E5SaO7sPUQacm8XycrP/vHyCWuUs66IfX64rNoaLi+mnj+oKwFu
         ZtyNMrg9qd6upF3/81K+qs3O+l5wmYlMaOGj6ChYRHoM0kzLh3D7UrrhtDFgV6yMvgKf
         Ly7OrThTdvaEngsv1t/f+TUSaE2ScOxA8wCOPHJlFATGpomQ4059sMlD4sfBE5mnLMJI
         thOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=s0H5ePNZ9LI43n09w1OemZVJk8a+L+wEXzeUND2fVC8=;
        b=h7M+J7gQ/gkpAclRw6dl9Ma9J3IX6an+ICg1QMZRTL8TF3ujlasxE8EBXr365KrBic
         aOT7WMQT5NtBbtQVl27Fi7w7moZJWcYLQ8Bklorjr/Wm7hA5yvKQ9VtDRqSEGWJF825T
         T/BdRLfkTuF7EftTGzzYjLk/P44Di/SdiqHTEIijXEbQtbHmHjDVp5WZs0zzX5/jmNOj
         GoULVoV34qr/29m7+BUGbam9WU/dVJ/smv3UBS+AjGhqlZA7Spmsx8UwH3wW9dul/pmZ
         BbcDCj1JvD4uZxiHFOhkBjeE2mRcOu+yxZc7PA3HHsSdEZ4q0vE83jkqwtIzUlS0Ym1a
         eA7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3-v6si9119745qtc.166.2018.08.20.07.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frl0a-0000rQ-FV
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:18:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku0-0003P7-T9
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frktz-0007Cn-Pz
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frktz-0007AT-Gk; Mon, 20 Aug 2018 10:11:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frktx-0003Nb-Gq; Mon, 20 Aug 2018 15:11:25 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:00 +0100
Message-Id: <20180820141116.9118-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/22] hw/arm/iotkit: Wire up the watchdogs
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IdC+I9DAQdBE

The IoTKit includes three different instances of the
CMSDK APB watchdog; create and wire them up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.18.0

