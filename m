Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c215500b003c6c3fb3cf6sm3518162wml.18.2022.11.11.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 716EE1FFB7;
	Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH  v5 08/20] hw/timer: convert mptimer access to attrs to derive cpu index
Date: Fri, 11 Nov 2022 18:25:23 +0000
Message-Id: <20221111182535.64844-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N2nb5eXMJ+8l

This removes the hacks to deal with empty current_cpu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update for new fields
  - bool asserts
v3
  - properly fail memory transactions from non-CPU sources
---
 hw/timer/arm_mptimer.c | 49 +++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..4618779ade 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -28,6 +28,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "hw/core/cpu.h"
 
 #define PTIMER_POLICY                       \
@@ -41,15 +42,23 @@
  * which is used in both the ARM11MPCore and Cortex-A9MP.
  */
 
-static inline int get_current_cpu(ARMMPTimerState *s)
+static bool is_from_cpu(MemTxAttrs attrs)
 {
-    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
+    if (attrs.requester_type != MTRT_CPU) {
+        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
+                      "%s: saw non-CPU transaction", __func__);
+        return false;
+    }
+    return true;
+}
 
+static int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
+{
+    int cpu_id = attrs.requester_id;
     if (cpu_id >= s->num_cpu) {
         hw_error("arm_mptimer: num-cpu %d but this cpu is %d!\n",
                  s->num_cpu, cpu_id);
     }
-
     return cpu_id;
 }
 
@@ -178,25 +187,35 @@ static void timerblock_write(void *opaque, hwaddr addr,
 /* Wrapper functions to implement the "read timer/watchdog for
  * the current CPU" memory regions.
  */
-static uint64_t arm_thistimer_read(void *opaque, hwaddr addr,
-                                   unsigned size)
+static MemTxResult arm_thistimer_read(void *opaque, hwaddr addr, uint64_t *data,
+                                      unsigned size, MemTxAttrs attrs)
 {
-    ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
-    return timerblock_read(&s->timerblock[id], addr, size);
+    if (is_from_cpu(attrs)) {
+        ARMMPTimerState *s = (ARMMPTimerState *)opaque;
+        int id = get_current_cpu(s, attrs);
+        *data = timerblock_read(&s->timerblock[id], addr, size);
+        return MEMTX_OK;
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
-static void arm_thistimer_write(void *opaque, hwaddr addr,
-                                uint64_t value, unsigned size)
+static MemTxResult arm_thistimer_write(void *opaque, hwaddr addr,
+                                uint64_t value, unsigned size, MemTxAttrs attrs)
 {
-    ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
-    timerblock_write(&s->timerblock[id], addr, value, size);
+    if (is_from_cpu(attrs)) {
+        ARMMPTimerState *s = (ARMMPTimerState *)opaque;
+        int id = get_current_cpu(s, attrs);
+        timerblock_write(&s->timerblock[id], addr, value, size);
+        return MEMTX_OK;
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 static const MemoryRegionOps arm_thistimer_ops = {
-    .read = arm_thistimer_read,
-    .write = arm_thistimer_write,
+    .read_with_attrs = arm_thistimer_read,
+    .write_with_attrs = arm_thistimer_write,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.34.1
