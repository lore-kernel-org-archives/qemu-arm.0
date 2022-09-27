Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p14-20020adfce0e000000b0022af6c93340sm1957085wrn.17.2022.09.27.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:15:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DCC711FFC0;
	Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 09/15] hw/timer: convert mptimer access to attrs to derive cpu index
Date: Tue, 27 Sep 2022 15:14:58 +0100
Message-Id: <20220927141504.3886314-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0cuurt4d1U0t

This removes the hacks to deal with empty current_cpu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update for new fields
  - bool asserts
---
 hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..34693a2534 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -41,9 +41,10 @@
  * which is used in both the ARM11MPCore and Cortex-A9MP.
  */
 
-static inline int get_current_cpu(ARMMPTimerState *s)
+static inline int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
 {
-    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
+    int cpu_id = attrs.requester_id;
+    g_assert(attrs.requester_type == MTRT_CPU);
 
     if (cpu_id >= s->num_cpu) {
         hw_error("arm_mptimer: num-cpu %d but this cpu is %d!\n",
@@ -178,25 +179,27 @@ static void timerblock_write(void *opaque, hwaddr addr,
 /* Wrapper functions to implement the "read timer/watchdog for
  * the current CPU" memory regions.
  */
-static uint64_t arm_thistimer_read(void *opaque, hwaddr addr,
-                                   unsigned size)
+static MemTxResult arm_thistimer_read(void *opaque, hwaddr addr, uint64_t *data,
+                                      unsigned size, MemTxAttrs attrs)
 {
     ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
-    return timerblock_read(&s->timerblock[id], addr, size);
+    int id = get_current_cpu(s, attrs);
+    *data = timerblock_read(&s->timerblock[id], addr, size);
+    return MEMTX_OK;
 }
 
-static void arm_thistimer_write(void *opaque, hwaddr addr,
-                                uint64_t value, unsigned size)
+static MemTxResult arm_thistimer_write(void *opaque, hwaddr addr,
+                                uint64_t value, unsigned size, MemTxAttrs attrs)
 {
     ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
+    int id = get_current_cpu(s, attrs);
     timerblock_write(&s->timerblock[id], addr, value, size);
+    return MEMTX_OK;
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
