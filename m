Received: by 10.25.0.147 with SMTP id 141csp59052lfa;
        Mon, 20 Feb 2017 07:36:10 -0800 (PST)
X-Received: by 10.28.203.75 with SMTP id b72mr12270389wmg.110.1487604970286;
        Mon, 20 Feb 2017 07:36:10 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id s64si12760922wmf.16.2017.02.20.07.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 07:36:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfq0X-0005hY-M1; Mon, 20 Feb 2017 15:36:09 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 06/11] armv7m: Make NVIC expose a memory region rather than mapping itself
Date: Mon, 20 Feb 2017 15:36:00 +0000
Message-Id: <1487604965-23220-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
X-TUID: tNZwrUpZgYww

Make the NVIC device expose a memory region for its users
to map, rather than mapping itself into the system memory
space on realize, and get the one user (the ARMv7M object)
to do this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c       | 7 ++++++-
 hw/intc/armv7m_nvic.c | 7 ++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 638c597..fb21f74 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -172,6 +172,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 {
     /* here realize our children */
     ARMv7MState *s = ARMV7M(dev);
+    SysBusDevice *sbd;
     Error *err = NULL;
     int i;
     char **cpustr;
@@ -233,10 +234,14 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
 
     /* Wire the NVIC up to the CPU */
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nvic), 0,
+    sbd = SYS_BUS_DEVICE(&s->nvic);
+    sysbus_connect_irq(sbd, 0,
                        qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     s->cpu->env.nvic = &s->nvic;
 
+    memory_region_add_subregion(&s->container, 0xe000e000,
+                                sysbus_mmio_get_region(sbd, 0));
+
     for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
         Object *obj = OBJECT(&s->bitband[i]);
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index f2ada39..c814e16 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -19,7 +19,6 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/armv7m_nvic.h"
 #include "target/arm/cpu.h"
-#include "exec/address-spaces.h"
 #include "qemu/log.h"
 #include "trace.h"
 
@@ -1043,10 +1042,8 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
                           "nvic_sysregs", 0x1000);
     memory_region_add_subregion(&s->container, 0, &s->sysregmem);
 
-    /* Map the whole thing into system memory at the location required
-     * by the v7M architecture.
-     */
-    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->container);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
+
     s->systick.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
 }
 
-- 
2.7.4
