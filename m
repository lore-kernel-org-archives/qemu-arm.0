Received: by 10.182.105.169 with SMTP id gn9csp900696obb;
        Sun, 8 Nov 2015 17:14:19 -0800 (PST)
X-Received: by 10.140.101.166 with SMTP id u35mr26845853qge.90.1447031657248;
        Sun, 08 Nov 2015 17:14:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8si9285052qha.104.2015.11.08.17.14.17
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:14:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb2G-0002b5-WF
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:14:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0001Ka-6F
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1L-0007uc-B0
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:22 -0500
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:34131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1L-0007uJ-7U; Sun, 08 Nov 2015 20:13:19 -0500
Received: by qgeb1 with SMTP id b1so79141687qge.1;
	Sun, 08 Nov 2015 17:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BrBMXjestqTdDSSLFHdgjsIpKejI4QleXl+WHoKfMYI=;
	b=DiyI1+yfpEm/1SV7MS8fL58USKS8rFCd2IHzgPx1LCRCnCXG7ChmB9BADmhe6OcIkX
	3hO2ZOMor675EyRaJZVHgv8yyjqb1RbGplkKes0skWFB9IrwR9VlwPx8mwKFE5opuWol
	xmbOAXYWZFe17uSrpvp6ud9UO9mDuNe2lCEG6ehKwtnsFvqZZadpxFAbFQt6gEA7tmRL
	K+g2JtIvg6njav9JBjThK57/u/PPksxuXHzOvCbWgnhaLlDHT+pxvCeBwW7hvcTnJDo2
	FVI0WFuaHwTodj8beDMZwOHOIafsnNxYGz3HRhviTQF5bSEwsyWul0Slda/K1mNhyHF3
	TbuA==
X-Received: by 10.140.248.136 with SMTP id t130mr27770973qhc.34.1447031598848; 
	Sun, 08 Nov 2015 17:13:18 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:18 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:32 -0500
Message-Id: <1447031505-12477-6-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 05/18] armv7m: expand NVIC state
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7HXFSqNwxiQn

Expand the NVIC to fully support -M priorities and masking.
Doesn't use GIC code.

Move some state to ARMCPU to allow calculation of exception masking.

Add storage for PRIGROUP to configure group/sub-group split.
Track group and sub-group in separate fields for quick comparison.
Mix in vector # with sub-group as per tie breaking rules.

NVIC now derives directly from SysBusDevice, and
struct NVICClass is eliminated.

Also add DPRINTF() macro.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 74 ++++++++++++++++++++++++++++++++++-----------------
 target-arm/cpu.h      |  3 +++
 2 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 6fc167e..487a09a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -13,43 +13,67 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/arm/arm.h"
+#include "target-arm/cpu.h"
 #include "exec/address-spaces.h"
-#include "gic_internal.h"
 
-typedef struct {
-    GICState gic;
+/*#define DEBUG_NVIC 0
+ */
+#ifdef DEBUG_NVIC
+#define DPRINTF(LVL, fmt, ...) \
+do { if ((LVL) <= DEBUG_NVIC) { \
+    fprintf(stderr, "armv7m_nvic: " fmt , ## __VA_ARGS__); \
+} } while (0)
+#else
+#define DPRINTF(LVL, fmt, ...) do {} while (0)
+#endif
+
+/* the number of IRQ lines in addition to the 16 internal
+ * exception vectors.
+ */
+#define NVIC_MAX_IRQ 496
+
+#define NVIC_MAX_VECTORS 512
+
+struct vec_info {
+    uint16_t prio_sub; /* sub-group priority*512 + exception# */
+    int8_t prio_group; /* group priority [-2, 0x7f] */
+    uint8_t raw_prio; /* value writen by guest */
+    uint8_t enabled;
+    uint8_t pending;
+    uint8_t active;
+    uint8_t level;
+    /* exceptions <=15 never set level */
+};
+typedef struct vec_info vec_info;
+
+struct nvic_state {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    ARMCPU *cpu; /* NVIC is so closely tied to the CPU, just keep a ref */
+
+    vec_info vectors[NVIC_MAX_VECTORS];
+
+    uint8_t prigroup;
+
     struct {
         uint32_t control;
         uint32_t reload;
         int64_t tick;
         QEMUTimer *timer;
     } systick;
-    MemoryRegion sysregmem;
-    MemoryRegion gic_iomem_alias;
-    MemoryRegion container;
+
+    MemoryRegion iomem; /* system control space and NVIC */
+
     uint32_t num_irq;
+    qemu_irq excpout;
     qemu_irq sysresetreq;
-} nvic_state;
+};
+typedef struct nvic_state nvic_state;
 
 #define TYPE_NVIC "armv7m_nvic"
-/**
- * NVICClass:
- * @parent_reset: the parent class' reset handler.
- *
- * A model of the v7M NVIC and System Controller
- */
-typedef struct NVICClass {
-    /*< private >*/
-    ARMGICClass parent_class;
-    /*< public >*/
-    DeviceRealize parent_realize;
-    void (*parent_reset)(DeviceState *dev);
-} NVICClass;
-
-#define NVIC_CLASS(klass) \
-    OBJECT_CLASS_CHECK(NVICClass, (klass), TYPE_NVIC)
-#define NVIC_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(NVICClass, (obj), TYPE_NVIC)
+
 #define NVIC(obj) \
     OBJECT_CHECK(nvic_state, (obj), TYPE_NVIC)
 
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 815fef8..c193fbb 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -398,6 +398,9 @@ typedef struct CPUARMState {
         uint32_t control;
         int current_sp;
         int exception;
+        int exception_prio;
+        unsigned pending;
+        int pending_prio;
     } v7m;
 
     /* Information associated with an exception about to be taken:
-- 
2.1.4

