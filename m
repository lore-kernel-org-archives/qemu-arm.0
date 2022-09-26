Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c1d8800b003a342933727sm11844696wms.3.2022.09.26.06.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 06:39:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2E1041FFBD;
	Mon, 26 Sep 2022 14:39:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	mads@ynddal.dk,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Mon, 26 Sep 2022 14:38:58 +0100
Message-Id: <20220926133904.3297263-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HOoyJUdeQ1ws

Now that MxTxAttrs encodes a CPU we should use that to figure it out.
This solves edge cases like accessing via gdbstub or qtest.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124

---
v2
  - update for new field
  - bool asserts
---
 hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..d907df3884 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] = {
     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
 
-static inline int gic_get_current_cpu(GICState *s)
+static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
 {
-    if (!qtest_enabled() && s->num_cpu > 1) {
-        return current_cpu->cpu_index;
-    }
-    return 0;
+    /*
+     * Something other than a CPU accessing the GIC would be a bug as
+     * would a CPU index higher than the GICState expects to be
+     * handling
+     */
+    g_assert(attrs.requester_type == MEMTXATTRS_CPU);
+    g_assert(attrs.requester_id < s->num_cpu);
+
+    return attrs.requester_id;
 }
 
-static inline int gic_get_current_vcpu(GICState *s)
+static inline int gic_get_current_vcpu(GICState *s, MemTxAttrs attrs)
 {
-    return gic_get_current_cpu(s) + GIC_NCPU;
+    return gic_get_current_cpu(s, attrs) + GIC_NCPU;
 }
 
 /* Return true if this GIC config has interrupt groups, which is
@@ -951,7 +956,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     int cm;
     int mask;
 
-    cpu = gic_get_current_cpu(s);
+    cpu = gic_get_current_cpu(s, attrs);
     cm = 1 << cpu;
     if (offset < 0x100) {
         if (offset == 0) {      /* GICD_CTLR */
@@ -1182,7 +1187,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
     int i;
     int cpu;
 
-    cpu = gic_get_current_cpu(s);
+    cpu = gic_get_current_cpu(s, attrs);
     if (offset < 0x100) {
         if (offset == 0) {
             if (s->security_extn && !attrs.secure) {
@@ -1476,7 +1481,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
         int mask;
         int target_cpu;
 
-        cpu = gic_get_current_cpu(s);
+        cpu = gic_get_current_cpu(s, attrs);
         irq = value & 0xf;
         switch ((value >> 24) & 3) {
         case 0:
@@ -1780,7 +1785,7 @@ static MemTxResult gic_thiscpu_read(void *opaque, hwaddr addr, uint64_t *data,
                                     unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    return gic_cpu_read(s, gic_get_current_cpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
@@ -1788,7 +1793,7 @@ static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
                                      MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_write(s, gic_get_current_cpu(s), addr, value, attrs);
+    return gic_cpu_write(s, gic_get_current_cpu(s, attrs), addr, value, attrs);
 }
 
 /* Wrappers to read/write the GIC CPU interface for a specific CPU.
@@ -1818,7 +1823,7 @@ static MemTxResult gic_thisvcpu_read(void *opaque, hwaddr addr, uint64_t *data,
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_cpu_read(s, gic_get_current_vcpu(s), addr, data, attrs);
+    return gic_cpu_read(s, gic_get_current_vcpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
@@ -1827,7 +1832,7 @@ static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_cpu_write(s, gic_get_current_vcpu(s), addr, value, attrs);
+    return gic_cpu_write(s, gic_get_current_vcpu(s, attrs), addr, value, attrs);
 }
 
 static uint32_t gic_compute_eisr(GICState *s, int cpu, int lr_start)
@@ -1860,7 +1865,7 @@ static uint32_t gic_compute_elrsr(GICState *s, int cpu, int lr_start)
 
 static void gic_vmcr_write(GICState *s, uint32_t value, MemTxAttrs attrs)
 {
-    int vcpu = gic_get_current_vcpu(s);
+    int vcpu = gic_get_current_vcpu(s, attrs);
     uint32_t ctlr;
     uint32_t abpr;
     uint32_t bpr;
@@ -1995,7 +2000,7 @@ static MemTxResult gic_thiscpu_hyp_read(void *opaque, hwaddr addr, uint64_t *dat
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_hyp_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    return gic_hyp_read(s, gic_get_current_cpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thiscpu_hyp_write(void *opaque, hwaddr addr,
@@ -2004,7 +2009,7 @@ static MemTxResult gic_thiscpu_hyp_write(void *opaque, hwaddr addr,
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_hyp_write(s, gic_get_current_cpu(s), addr, value, attrs);
+    return gic_hyp_write(s, gic_get_current_cpu(s, attrs), addr, value, attrs);
 }
 
 static MemTxResult gic_do_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
-- 
2.34.1
