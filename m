Received: by 10.25.0.147 with SMTP id 141csp59068lfa;
        Mon, 20 Feb 2017 07:36:12 -0800 (PST)
X-Received: by 10.84.210.232 with SMTP id a95mr32551350pli.31.1487604972440;
        Mon, 20 Feb 2017 07:36:12 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id a5si18899991pgi.390.2017.02.20.07.36.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 07:36:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfq0V-0005gN-3t; Mon, 20 Feb 2017 15:36:07 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 02/11] armv7m: Move NVICState struct definition into header
Date: Mon, 20 Feb 2017 15:35:56 +0000
Message-Id: <1487604965-23220-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
X-TUID: o+GTVxbmkIgh

Move the NVICState struct definition into a header, so we can
embed it into other QOM objects like SoCs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m_nvic.h | 66 ++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/armv7m_nvic.c        | 49 +-------------------------------
 2 files changed, 67 insertions(+), 48 deletions(-)
 create mode 100644 include/hw/arm/armv7m_nvic.h

diff --git a/include/hw/arm/armv7m_nvic.h b/include/hw/arm/armv7m_nvic.h
new file mode 100644
index 0000000..39b94ee
--- /dev/null
+++ b/include/hw/arm/armv7m_nvic.h
@@ -0,0 +1,66 @@
+/*
+ * ARMv7M NVIC object
+ *
+ * Copyright (c) 2017 Linaro Ltd
+ * Written by Peter Maydell <peter.maydell@linaro.org>
+ *
+ * This code is licensed under the GPL version 2 or later.
+ */
+
+#ifndef HW_ARM_ARMV7M_NVIC_H
+#define HW_ARM_ARMV7M_NVIC_H
+
+#include "target/arm/cpu.h"
+#include "hw/sysbus.h"
+
+#define TYPE_NVIC "armv7m_nvic"
+
+#define NVIC(obj) \
+    OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
+
+/* Highest permitted number of exceptions (architectural limit) */
+#define NVIC_MAX_VECTORS 512
+
+typedef struct VecInfo {
+    /* Exception priorities can range from -3 to 255; only the unmodifiable
+     * priority values for RESET, NMI and HardFault can be negative.
+     */
+    int16_t prio;
+    uint8_t enabled;
+    uint8_t pending;
+    uint8_t active;
+    uint8_t level; /* exceptions <=15 never set level */
+} VecInfo;
+
+typedef struct NVICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    ARMCPU *cpu;
+
+    VecInfo vectors[NVIC_MAX_VECTORS];
+    uint32_t prigroup;
+
+    /* vectpending and exception_prio are both cached state that can
+     * be recalculated from the vectors[] array and the prigroup field.
+     */
+    unsigned int vectpending; /* highest prio pending enabled exception */
+    int exception_prio; /* group prio of the highest prio active exception */
+
+    struct {
+        uint32_t control;
+        uint32_t reload;
+        int64_t tick;
+        QEMUTimer *timer;
+    } systick;
+
+    MemoryRegion sysregmem;
+    MemoryRegion container;
+
+    uint32_t num_irq;
+    qemu_irq excpout;
+    qemu_irq sysresetreq;
+} NVICState;
+
+#endif
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 76097b4..f2ada39 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -17,6 +17,7 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/arm/arm.h"
+#include "hw/arm/armv7m_nvic.h"
 #include "target/arm/cpu.h"
 #include "exec/address-spaces.h"
 #include "qemu/log.h"
@@ -47,7 +48,6 @@
  * "exception" more or less interchangeably.
  */
 #define NVIC_FIRST_IRQ 16
-#define NVIC_MAX_VECTORS 512
 #define NVIC_MAX_IRQ (NVIC_MAX_VECTORS - NVIC_FIRST_IRQ)
 
 /* Effective running priority of the CPU when no exception is active
@@ -55,53 +55,6 @@
  */
 #define NVIC_NOEXC_PRIO 0x100
 
-typedef struct VecInfo {
-    /* Exception priorities can range from -3 to 255; only the unmodifiable
-     * priority values for RESET, NMI and HardFault can be negative.
-     */
-    int16_t prio;
-    uint8_t enabled;
-    uint8_t pending;
-    uint8_t active;
-    uint8_t level; /* exceptions <=15 never set level */
-} VecInfo;
-
-typedef struct NVICState {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    ARMCPU *cpu;
-
-    VecInfo vectors[NVIC_MAX_VECTORS];
-    uint32_t prigroup;
-
-    /* vectpending and exception_prio are both cached state that can
-     * be recalculated from the vectors[] array and the prigroup field.
-     */
-    unsigned int vectpending; /* highest prio pending enabled exception */
-    int exception_prio; /* group prio of the highest prio active exception */
-
-    struct {
-        uint32_t control;
-        uint32_t reload;
-        int64_t tick;
-        QEMUTimer *timer;
-    } systick;
-
-    MemoryRegion sysregmem;
-    MemoryRegion container;
-
-    uint32_t num_irq;
-    qemu_irq excpout;
-    qemu_irq sysresetreq;
-} NVICState;
-
-#define TYPE_NVIC "armv7m_nvic"
-
-#define NVIC(obj) \
-    OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
-
 static const uint8_t nvic_id[] = {
     0x00, 0xb0, 0x1b, 0x00, 0x0d, 0xe0, 0x05, 0xb1
 };
-- 
2.7.4
