Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653392wru;
        Mon, 1 Jul 2019 06:26:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFWMPSmsKOJ5fz/PWXX/A/ws/xEacUYuZxOk1Bjr52D/VLfjhJysgt9OKD3974pM7e5A3p
X-Received: by 2002:ac8:27d4:: with SMTP id x20mr19953037qtx.138.1561987575596;
        Mon, 01 Jul 2019 06:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987575; cv=none;
        d=google.com; s=arc-20160816;
        b=FhaX0R6+efoXlpLnfjk2SNTYN7xHIQ8c/RsTB92mcZh1a1975dfBe/vqBCzJZKnUXB
         tiN0za2DHz128u8idu/mwZ3Gd3xopveVIae3w/szfQuaQpzMeCFoLtsO1sM7hgwK9UDJ
         NH17fLQNTO6xFRFuSFHao6ZA+n3B1vpElBDSNreLFodJua1OitMvWO4WgVUYaaUz28vk
         IE9qIf1RZJ/yGID3Qn81Tsqr22VZXQ0UQ4kzt6XsZIrQQeb2j25x4YrjrKGsqqJmx5ir
         5WrfWluX9pCRN5d7GdO3lJbcoJTY8XYz+WSZ14aTM5knDINN1/4pfKfE8jf/fX1D1jM9
         eZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=SalMvBwksR1PwrXAKwPlxfaZ/qmQtprP5UkxQE7Wiyk=;
        b=d8PMYlQ6YQX50hQVZPmeTxyDpv/yCLC/t39R6IzN9zc3NlXzKQAgiz6WV1OfwJ5+om
         PWHAxlI+TEMkeyKS2NYs/Pvf0BTATfKKYJ2TUWxxhMasfOoIoU782wZq+GfiHMeTn6bd
         xJ8XuOVa3WuYqHa7DTcI9oXDXkYjPLvyov7gIQxPeodui8HgYt7w843x+RjaYuzK8kJY
         V2G4kMRIAtZkzloOtO+ks9s/8nrAkMSjJBuYcWCLfoaYIVzU2VoQIGp0eD8Jp5vcp44T
         xeSps1zvGWhz28OilewCC2wf4xANi8Y8CWsezrJ4KilaGKKJrz003NLaqPNXs7mfo3eX
         /Ctg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p28si7618092qtf.64.2019.07.01.06.26.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4860C057F2E;
	Mon,  1 Jul 2019 13:26:14 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08B826085B;
	Mon,  1 Jul 2019 13:26:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 12/27] target/arm: Move TLB related routines to tlb_helper.c
Date: Mon,  1 Jul 2019 15:25:01 +0200
Message-Id: <20190701132516.26392-13-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 01 Jul 2019 13:26:14 +0000 (UTC)
X-TUID: 7b71aR6MeO2h

These routines are TCG specific.
The arm_deliver_fault() function is only used within the new
helper. Make it static.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/Makefile.objs |   1 +
 target/arm/cpu.c         |   6 +-
 target/arm/helper.c      |  53 -----------
 target/arm/internals.h   |   3 -
 target/arm/op_helper.c   | 135 --------------------------
 target/arm/tlb_helper.c  | 200 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 205 insertions(+), 193 deletions(-)
 create mode 100644 target/arm/tlb_helper.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 3fcda66132..5c154f01c5 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -32,6 +32,7 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 
+obj-y += tlb_helper.o
 obj-y += translate.o op_helper.o
 obj-y += crypto_helper.o
 obj-y += iwmmxt_helper.o vec_helper.o neon_helper.o
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1f73631bac..f21261c8ff 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2566,8 +2566,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->do_interrupt = arm_cpu_do_interrupt;
-    cc->do_unaligned_access = arm_cpu_do_unaligned_access;
-    cc->do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
@@ -2590,6 +2588,10 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_initialize = arm_translate_init;
     cc->tlb_fill = arm_cpu_tlb_fill;
+#if !defined(CONFIG_USER_ONLY)
+    cc->do_unaligned_access = arm_cpu_do_unaligned_access;
+    cc->do_transaction_failed = arm_cpu_do_transaction_failed;
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 063f4778e0..4ef908c611 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13244,59 +13244,6 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 
 #endif
 
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-
-#ifdef CONFIG_USER_ONLY
-    cpu->env.exception.vaddress = address;
-    if (access_type == MMU_INST_FETCH) {
-        cs->exception_index = EXCP_PREFETCH_ABORT;
-    } else {
-        cs->exception_index = EXCP_DATA_ABORT;
-    }
-    cpu_loop_exit_restore(cs, retaddr);
-#else
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot, ret;
-    MemTxAttrs attrs = {};
-    ARMMMUFaultInfo fi = {};
-
-    /*
-     * Walk the page table and (if the mapping exists) add the page
-     * to the TLB.  On success, return true.  Otherwise, if probing,
-     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
-     * register format, and signal the fault.
-     */
-    ret = get_phys_addr(&cpu->env, address, access_type,
-                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL);
-    if (likely(!ret)) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (page_size >= TARGET_PAGE_SIZE) {
-            phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
-        return true;
-    } else if (probe) {
-        return false;
-    } else {
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
-    }
-#endif
-}
-
 /* Note that signed overflow is undefined in C.  The following routines are
    careful to use unsigned types where modulo arithmetic is required.
    Failure to do so _will_ break on newer gcc.  */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index ff5ab0328e..46a1313d69 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -765,9 +765,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
 
-void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
-                       int mmu_idx, ARMMMUFaultInfo *fi) QEMU_NORETURN;
-
 /* Return true if the stage 1 translation regime is using LPAE format page
  * tables */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 7c835d3ce7..9850993c11 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -88,141 +88,6 @@ uint32_t HELPER(neon_tbl)(uint32_t ireg, uint32_t def, void *vn,
     return val;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
-static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
-                                            unsigned int target_el,
-                                            bool same_el, bool ea,
-                                            bool s1ptw, bool is_write,
-                                            int fsc)
-{
-    uint32_t syn;
-
-    /*
-     * ISV is only set for data aborts routed to EL2 and
-     * never for stage-1 page table walks faulting on stage 2.
-     *
-     * Furthermore, ISV is only set for certain kinds of load/stores.
-     * If the template syndrome does not have ISV set, we should leave
-     * it cleared.
-     *
-     * See ARMv8 specs, D7-1974:
-     * ISS encoding for an exception from a Data Abort, the
-     * ISV field.
-     */
-    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
-        syn = syn_data_abort_no_iss(same_el,
-                                    ea, 0, s1ptw, is_write, fsc);
-    } else {
-        /*
-         * Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
-         * syndrome created at translation time.
-         * Now we create the runtime syndrome with the remaining fields.
-         */
-        syn = syn_data_abort_with_iss(same_el,
-                                      0, 0, 0, 0, 0,
-                                      ea, 0, s1ptw, is_write, fsc,
-                                      false);
-        /* Merge the runtime syndrome with the template syndrome.  */
-        syn |= template_syn;
-    }
-    return syn;
-}
-
-void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
-                       int mmu_idx, ARMMMUFaultInfo *fi)
-{
-    CPUARMState *env = &cpu->env;
-    int target_el;
-    bool same_el;
-    uint32_t syn, exc, fsr, fsc;
-    ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
-
-    target_el = exception_target_el(env);
-    if (fi->stage2) {
-        target_el = 2;
-        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
-    }
-    same_el = (arm_current_el(env) == target_el);
-
-    if (target_el == 2 || arm_el_is_aa64(env, target_el) ||
-        arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
-        /*
-         * LPAE format fault status register : bottom 6 bits are
-         * status code in the same form as needed for syndrome
-         */
-        fsr = arm_fi_to_lfsc(fi);
-        fsc = extract32(fsr, 0, 6);
-    } else {
-        fsr = arm_fi_to_sfsc(fi);
-        /*
-         * Short format FSR : this fault will never actually be reported
-         * to an EL that uses a syndrome register. Use a (currently)
-         * reserved FSR code in case the constructed syndrome does leak
-         * into the guest somehow.
-         */
-        fsc = 0x3f;
-    }
-
-    if (access_type == MMU_INST_FETCH) {
-        syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
-        exc = EXCP_PREFETCH_ABORT;
-    } else {
-        syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                   same_el, fi->ea, fi->s1ptw,
-                                   access_type == MMU_DATA_STORE,
-                                   fsc);
-        if (access_type == MMU_DATA_STORE
-            && arm_feature(env, ARM_FEATURE_V6)) {
-            fsr |= (1 << 11);
-        }
-        exc = EXCP_DATA_ABORT;
-    }
-
-    env->exception.vaddress = addr;
-    env->exception.fsr = fsr;
-    raise_exception(env, exc, syn, target_el);
-}
-
-/* Raise a data fault alignment exception for the specified virtual address */
-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                 MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-
-    fi.type = ARMFault_Alignment;
-    arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
-}
-
-/*
- * arm_cpu_do_transaction_failed: handle a memory system error response
- * (eg "no device/memory present at address") by raising an external abort
- * exception
- */
-void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                   vaddr addr, unsigned size,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, MemTxAttrs attrs,
-                                   MemTxResult response, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-
-    fi.ea = arm_extabort_type(response);
-    fi.type = ARMFault_SyncExternal;
-    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
-}
-
-#endif /* !defined(CONFIG_USER_ONLY) */
-
 void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
 {
     /*
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
new file mode 100644
index 0000000000..5feb312941
--- /dev/null
+++ b/target/arm/tlb_helper.c
@@ -0,0 +1,200 @@
+/*
+ * ARM TLB (Translation lookaside buffer) helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+
+#if !defined(CONFIG_USER_ONLY)
+
+static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
+                                            unsigned int target_el,
+                                            bool same_el, bool ea,
+                                            bool s1ptw, bool is_write,
+                                            int fsc)
+{
+    uint32_t syn;
+
+    /*
+     * ISV is only set for data aborts routed to EL2 and
+     * never for stage-1 page table walks faulting on stage 2.
+     *
+     * Furthermore, ISV is only set for certain kinds of load/stores.
+     * If the template syndrome does not have ISV set, we should leave
+     * it cleared.
+     *
+     * See ARMv8 specs, D7-1974:
+     * ISS encoding for an exception from a Data Abort, the
+     * ISV field.
+     */
+    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
+        syn = syn_data_abort_no_iss(same_el,
+                                    ea, 0, s1ptw, is_write, fsc);
+    } else {
+        /*
+         * Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
+         * syndrome created at translation time.
+         * Now we create the runtime syndrome with the remaining fields.
+         */
+        syn = syn_data_abort_with_iss(same_el,
+                                      0, 0, 0, 0, 0,
+                                      ea, 0, s1ptw, is_write, fsc,
+                                      false);
+        /* Merge the runtime syndrome with the template syndrome.  */
+        syn |= template_syn;
+    }
+    return syn;
+}
+
+static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                            MMUAccessType access_type,
+                                            int mmu_idx, ARMMMUFaultInfo *fi)
+{
+    CPUARMState *env = &cpu->env;
+    int target_el;
+    bool same_el;
+    uint32_t syn, exc, fsr, fsc;
+    ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
+
+    target_el = exception_target_el(env);
+    if (fi->stage2) {
+        target_el = 2;
+        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
+    }
+    same_el = (arm_current_el(env) == target_el);
+
+    if (target_el == 2 || arm_el_is_aa64(env, target_el) ||
+        arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
+        /*
+         * LPAE format fault status register : bottom 6 bits are
+         * status code in the same form as needed for syndrome
+         */
+        fsr = arm_fi_to_lfsc(fi);
+        fsc = extract32(fsr, 0, 6);
+    } else {
+        fsr = arm_fi_to_sfsc(fi);
+        /*
+         * Short format FSR : this fault will never actually be reported
+         * to an EL that uses a syndrome register. Use a (currently)
+         * reserved FSR code in case the constructed syndrome does leak
+         * into the guest somehow.
+         */
+        fsc = 0x3f;
+    }
+
+    if (access_type == MMU_INST_FETCH) {
+        syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
+        exc = EXCP_PREFETCH_ABORT;
+    } else {
+        syn = merge_syn_data_abort(env->exception.syndrome, target_el,
+                                   same_el, fi->ea, fi->s1ptw,
+                                   access_type == MMU_DATA_STORE,
+                                   fsc);
+        if (access_type == MMU_DATA_STORE
+            && arm_feature(env, ARM_FEATURE_V6)) {
+            fsr |= (1 << 11);
+        }
+        exc = EXCP_DATA_ABORT;
+    }
+
+    env->exception.vaddress = addr;
+    env->exception.fsr = fsr;
+    raise_exception(env, exc, syn, target_el);
+}
+
+/* Raise a data fault alignment exception for the specified virtual address */
+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                 MMUAccessType access_type,
+                                 int mmu_idx, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+
+    fi.type = ARMFault_Alignment;
+    arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
+}
+
+/*
+ * arm_cpu_do_transaction_failed: handle a memory system error response
+ * (eg "no device/memory present at address") by raising an external abort
+ * exception
+ */
+void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                   vaddr addr, unsigned size,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, MemTxAttrs attrs,
+                                   MemTxResult response, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+
+    fi.ea = arm_extabort_type(response);
+    fi.type = ARMFault_SyncExternal;
+    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
+}
+
+#endif /* !defined(CONFIG_USER_ONLY) */
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+#ifdef CONFIG_USER_ONLY
+    cpu->env.exception.vaddress = address;
+    if (access_type == MMU_INST_FETCH) {
+        cs->exception_index = EXCP_PREFETCH_ABORT;
+    } else {
+        cs->exception_index = EXCP_DATA_ABORT;
+    }
+    cpu_loop_exit_restore(cs, retaddr);
+#else
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot, ret;
+    MemTxAttrs attrs = {};
+    ARMMMUFaultInfo fi = {};
+
+    /*
+     * Walk the page table and (if the mapping exists) add the page
+     * to the TLB.  On success, return true.  Otherwise, if probing,
+     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
+     * register format, and signal the fault.
+     */
+    ret = get_phys_addr(&cpu->env, address, access_type,
+                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL);
+    if (likely(!ret)) {
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >= TARGET_PAGE_SIZE) {
+            phys_addr &= TARGET_PAGE_MASK;
+            address &= TARGET_PAGE_MASK;
+        }
+        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+                                prot, mmu_idx, page_size);
+        return true;
+    } else if (probe) {
+        return false;
+    } else {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr, true);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+    }
+#endif
+}
-- 
2.20.1
