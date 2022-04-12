Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b0038e75fda4edsm1964427wmb.47.2022.04.12.03.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 03:45:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F1FF71FFB7;
	Tue, 12 Apr 2022 11:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] gdb/gic: expose cpu_index via MxTxAttrs
Date: Tue, 12 Apr 2022 11:45:19 +0100
Message-Id: <20220412104519.201655-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IZcinPR19+DA

When accessing HW via the gdbstub we can't easily figure out what the
cpu_index is. The canonical case is current_cpu but for some cases
that will be NULL. For debug accesses we can overload requester_id and
make the GIC a bit smarter about fishing that out.

[AJB: very much a PoC hack for now but interested if this makes sense.
We could encode cpu_index in another field but that would grow
MxTxAttrs even more.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
---
 include/exec/memattrs.h |  2 +-
 hw/core/cpu-sysemu.c    | 15 +++++++++++----
 hw/intc/arm_gic.c       | 33 +++++++++++++++++++--------------
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..1333a34cb3 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -43,7 +43,7 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
-    /* Requester ID (for MSI for example) */
+    /* Requester ID (for MSI for example) or cpu_index for debug */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..77f0b1a289 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -51,13 +51,20 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
+    MemTxAttrs local = { };
+    hwaddr res;
 
     if (cc->sysemu_ops->get_phys_page_attrs_debug) {
-        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
+        res = cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, &local);
+    } else {
+        /* Fallback for CPUs which don't implement the _attrs_ hook */
+        local = MEMTXATTRS_UNSPECIFIED;
+        res = cc->sysemu_ops->get_phys_page_debug(cpu, addr);
     }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
+
+    local.requester_id = cpu->cpu_index;
+    *attrs = local;
+    return res;
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..6a007a7f9e 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] = {
     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
 
-static inline int gic_get_current_cpu(GICState *s)
+static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
 {
     if (!qtest_enabled() && s->num_cpu > 1) {
-        return current_cpu->cpu_index;
+        if (current_cpu) {
+            return current_cpu->cpu_index;
+        } else {
+            /* worst case this will be zeroed */
+            return attrs.requester_id;
+        }
     }
     return 0;
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
2.30.2
