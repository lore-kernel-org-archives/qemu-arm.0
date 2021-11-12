Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c11sm8729789wmq.27.2021.11.12.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 09:05:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 316421FF96;
	Fri, 12 Nov 2021 17:05:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] hw/intc: clean-up error reporting for failed ITS cmd
Date: Fri, 12 Nov 2021 17:04:54 +0000
Message-Id: <20211112170454.3158925-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Jbzjz6Zmnv2t

While trying to debug a GIC ITS failure I saw some guest errors that
had poor formatting as well as leaving me confused as to what failed.
As most of the checks aren't possible without a valid dte split that
check apart and then check the other conditions in steps. This avoids
us relying on undefined data.

I still get a failure with the current kvm-unit-tests but at least I
know (partially) why now:

  Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
  PASS: gicv3: its-trigger: inv/invall: dev2/eventid=20 now triggers an LPI
  ITS: MAPD devid=2 size = 0x8 itt=0x40430000 valid=0
  INT dev_id=2 event_id=20
  process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_TX: 0)
  PASS: gicv3: its-trigger: mapd valid=false: no LPI after device unmap
  SUMMARY: 6 tests, 1 unexpected failures

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84bcbb5f56..d5267814ab 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -274,21 +274,36 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
         if (res != MEMTX_OK) {
             return result;
         }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
+                      __func__, dte, devid, res);
+        return result;
     }
 
-    if ((devid > s->dt.maxids.max_devids) || !dte_valid || !ite_valid ||
-            !cte_valid || (eventid > max_eventid)) {
+
+    /*
+     * In this implementation, in case of guest errors we ignore the
+     * command and move onto the next command in the queue.
+     */
+    if (devid > s->dt.maxids.max_devids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes "
-                      "devid %d or eventid %d or invalid dte %d or"
-                      "invalid cte %d or invalid ite %d\n",
-                      __func__, devid, eventid, dte_valid, cte_valid,
-                      ite_valid);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "%s: invalid command attributes: devid %d>%d",
+                      __func__, devid, s->dt.maxids.max_devids);
+
+    } else if (!dte_valid || !ite_valid || !cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "dte: %s, ite: %s, cte: %s\n",
+                      __func__,
+                      dte_valid ? "valid" : "invalid",
+                      ite_valid ? "valid" : "invalid",
+                      cte_valid ? "valid" : "invalid");
+    } else if (eventid > max_eventid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d > %d\n",
+                      __func__, eventid, max_eventid);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
-- 
2.30.2
