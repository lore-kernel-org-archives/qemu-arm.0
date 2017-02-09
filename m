Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o81sm9757667wmb.14.2017.02.09.09.09.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Feb 2017 09:09:16 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 923BE3E0A9A;
	Thu,  9 Feb 2017 17:09:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net
Cc: mttcg@listserver.greensocs.com,
	qemu-devel@nongnu.org,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	bamvor.zhangjian@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	qemu-arm@nongnu.org (open list:i.MX31)
Subject: [PATCH v11 23/24] hw/misc/imx6_src: defer clearing of SRC_SCR reset bits
Date: Thu,  9 Feb 2017 17:09:03 +0000
Message-Id: <20170209170904.5713-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170209170904.5713-1-alex.bennee@linaro.org>
References: <20170209170904.5713-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D011BC5tw5ps

The arm_reset_cpu/set_cpu_on/set_cpu_off() functions do their work
asynchronously in the target vCPUs context. As a result we need to
ensure the SRC_SCR reset bits correctly report the reset status at the
right time. To do this we defer the clearing of the bit with an async
job which will run after the work queued by ARM powerctl functions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/misc/imx6_src.c | 58 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 55b817b8d7..f7c1d94a3e 100644
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
+struct src_scr_reset_info {
+    IMX6SRCState *s;
+    unsigned long reset_bit;
+};
+
+static void imx6_clear_reset_bit(CPUState *cpu, run_on_cpu_data data)
+{
+    struct src_scr_reset_info *ri = data.host_ptr;
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
+    struct src_scr_reset_info *ri;
+
+    ri = g_malloc(sizeof(struct src_scr_reset_info));
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
