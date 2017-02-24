Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local (host5-81-235-77.range5-81.btcentralplus.com. [5.81.235.77])
        by smtp.gmail.com with ESMTPSA id k4sm1971097wmf.22.2017.02.24.03.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 03:26:44 -0800 (PST)
Received: from zen.home (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E35483E1795;
	Fri, 24 Feb 2017 11:21:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	qemu-arm@nongnu.org (open list:i.MX31)
Subject: [PULL 23/24] hw/misc/imx6_src: defer clearing of SRC_SCR reset bits
Date: Fri, 24 Feb 2017 11:21:08 +0000
Message-Id: <20170224112109.3147-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170224112109.3147-1-alex.bennee@linaro.org>
References: <20170224112109.3147-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jHzLKPF1Oi3z

The arm_reset_cpu/set_cpu_on/set_cpu_off() functions do their work
asynchronously in the target vCPUs context. As a result we need to
ensure the SRC_SCR reset bits correctly report the reset status at the
right time. To do this we defer the clearing of the bit with an async
job which will run after the work queued by ARM powerctl functions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx6_src.c | 58 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 55b817b8d7..edbb756c36 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -14,6 +14,7 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "arm-powerctl.h"
+#include "qom/cpu.h"
 
 #ifndef DEBUG_IMX6_SRC
 #define DEBUG_IMX6_SRC 0
@@ -113,6 +114,45 @@ static uint64_t imx6_src_read(void *opaque, hwaddr offset, unsigned size)
     return value;
 }
 
+
+/* The reset is asynchronous so we need to defer clearing the reset
+ * bit until the work is completed.
+ */
+
+struct SRCSCRResetInfo {
+    IMX6SRCState *s;
+    int reset_bit;
+};
+
+static void imx6_clear_reset_bit(CPUState *cpu, run_on_cpu_data data)
+{
+    struct SRCSCRResetInfo *ri = data.host_ptr;
+    IMX6SRCState *s = ri->s;
+
+    assert(qemu_mutex_iothread_locked());
+
+    s->regs[SRC_SCR] = deposit32(s->regs[SRC_SCR], ri->reset_bit, 1, 0);
+    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n",
+            imx6_src_reg_name(SRC_SCR), s->regs[SRC_SCR]);
+
+    g_free(ri);
+}
+
+static void imx6_defer_clear_reset_bit(int cpuid,
+                                       IMX6SRCState *s,
+                                       unsigned long reset_shift)
+{
+    struct SRCSCRResetInfo *ri;
+
+    ri = g_malloc(sizeof(struct SRCSCRResetInfo));
+    ri->s = s;
+    ri->reset_bit = reset_shift;
+
+    async_run_on_cpu(arm_get_cpu_by_id(cpuid), imx6_clear_reset_bit,
+                     RUN_ON_CPU_HOST_PTR(ri));
+}
+
+
 static void imx6_src_write(void *opaque, hwaddr offset, uint64_t value,
                            unsigned size)
 {
@@ -153,7 +193,7 @@ static void imx6_src_write(void *opaque, hwaddr offset, uint64_t value,
                 arm_set_cpu_off(3);
             }
             /* We clear the reset bits as the processor changed state */
-            clear_bit(CORE3_RST_SHIFT, &current_value);
+            imx6_defer_clear_reset_bit(3, s, CORE3_RST_SHIFT);
             clear_bit(CORE3_RST_SHIFT, &change_mask);
         }
         if (EXTRACT(change_mask, CORE2_ENABLE)) {
@@ -162,11 +202,11 @@ static void imx6_src_write(void *opaque, hwaddr offset, uint64_t value,
                 arm_set_cpu_on(2, s->regs[SRC_GPR5], s->regs[SRC_GPR6],
                                3, false);
             } else {
-                /* CORE 3 is shut down */
+                /* CORE 2 is shut down */
                 arm_set_cpu_off(2);
             }
             /* We clear the reset bits as the processor changed state */
-            clear_bit(CORE2_RST_SHIFT, &current_value);
+            imx6_defer_clear_reset_bit(2, s, CORE2_RST_SHIFT);
             clear_bit(CORE2_RST_SHIFT, &change_mask);
         }
         if (EXTRACT(change_mask, CORE1_ENABLE)) {
@@ -175,28 +215,28 @@ static void imx6_src_write(void *opaque, hwaddr offset, uint64_t value,
                 arm_set_cpu_on(1, s->regs[SRC_GPR3], s->regs[SRC_GPR4],
                                3, false);
             } else {
-                /* CORE 3 is shut down */
+                /* CORE 1 is shut down */
                 arm_set_cpu_off(1);
             }
             /* We clear the reset bits as the processor changed state */
-            clear_bit(CORE1_RST_SHIFT, &current_value);
+            imx6_defer_clear_reset_bit(1, s, CORE1_RST_SHIFT);
             clear_bit(CORE1_RST_SHIFT, &change_mask);
         }
         if (EXTRACT(change_mask, CORE0_RST)) {
             arm_reset_cpu(0);
-            clear_bit(CORE0_RST_SHIFT, &current_value);
+            imx6_defer_clear_reset_bit(0, s, CORE0_RST_SHIFT);
         }
         if (EXTRACT(change_mask, CORE1_RST)) {
             arm_reset_cpu(1);
-            clear_bit(CORE1_RST_SHIFT, &current_value);
+            imx6_defer_clear_reset_bit(1, s, CORE1_RST_SHIFT);
         }
         if (EXTRACT(change_mask, CORE2_RST)) {
             arm_reset_cpu(2);
-            clear_bit(CORE2_RST_SHIFT, &current_value);
+            imx6_defer_clear_reset_bit(2, s, CORE2_RST_SHIFT);
         }
         if (EXTRACT(change_mask, CORE3_RST)) {
             arm_reset_cpu(3);
-            clear_bit(CORE3_RST_SHIFT, &current_value);
+            imx6_defer_clear_reset_bit(3, s, CORE3_RST_SHIFT);
         }
         if (EXTRACT(change_mask, SW_IPU2_RST)) {
             /* We pretend the IPU2 is reset */
-- 
2.11.0
