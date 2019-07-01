Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3004075wru;
        Mon, 1 Jul 2019 12:50:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxDC5muCtauuSxHSqVydClU2GtP2O4Tg/77G2phHHHGpk3mlYcaykauna4dfvKqczdHD4v
X-Received: by 2002:ac8:2d19:: with SMTP id n25mr22143513qta.180.1562010606400;
        Mon, 01 Jul 2019 12:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010606; cv=none;
        d=google.com; s=arc-20160816;
        b=XtCZ1nyaneLafgnmdJF8xyqN9vVQlYndHjleRZsRWpvO/vqxZl6heqinsVC7B80cN0
         NaAT0GL7x9upgKVb+ZsMs7D6KCkhFC0X0DT+bK3rRGFSiNcvgsXiodwmwqr4LRcb8pAl
         kOqHKpXHZQqWLa9rsWzFof91uFTFX62v6lJSOaUxt6nU9PcY5D4KIp8v3zhSQ8h1620N
         R8R8SqXDdVS5h1di1FDXSqp9ME3emDFcdFCpfq2YSoDbT5yImGIyoo2IXxQDhUQJCEUp
         ROpQJVXsZlAGJ80Mqijxk3E52cAJfILAwgGcNU63SuYOjAUYKrgORP5edAvzf4cSAIqq
         PgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=xbu2X8BgX784Hybm0kP8l6hvk4TnRGbTPx3sZDaC2I4=;
        b=wzISLhsbbElXL5ArZhcB3uwQOeADQBRVbvKfoBYSLUF24uh1WlY93bLprqBxaMb9nk
         CiVqnyZGqSm0ApO0ZLVLWAXNVUNU+7GCbS/qaad4o4SxI9/ygEroBejbgCY0bF+uaak6
         F3cIoq4pnaCG+DmsIdd2nZytQsQZP+p84XlUP3/ckT06d7EIpqS72pXPAHg0ArPCFqex
         q1hCtYQvFBfvJJl8k4Rw6ttSJZwie19MsuRELRHGNMyG4xCgUQKRR7FNK3Z5O3h9qC+V
         naeRxOLjsGcJ3bZxLz4u2i5wlZwO1Jt1RZd2iRQfIkJ4eoLcR737DwuZQAzMU5o09RA2
         mz7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e7si9004534qkg.278.2019.07.01.12.50.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79A8930BBE69;
	Mon,  1 Jul 2019 19:49:55 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D7E2379F;
	Mon,  1 Jul 2019 19:49:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	qemu-arm@nongnu.org,
	Andrew Jones <drjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yang Zhong <yang.zhong@intel.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 1/8] target/arm: Move debug routines to debug_helper.c
Date: Mon,  1 Jul 2019 21:49:35 +0200
Message-Id: <20190701194942.10092-2-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 01 Jul 2019 19:50:00 +0000 (UTC)
X-TUID: V5mNR0ce7IOg

These routines are TCG specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v4: get_phys_page_attrs_debug is not TCG specific (Peter)
---
 target/arm/Makefile.objs  |   2 +-
 target/arm/cpu.c          |   9 +-
 target/arm/debug_helper.c | 311 ++++++++++++++++++++++++++++++++++++++
 target/arm/op_helper.c    | 295 ------------------------------------
 4 files changed, 315 insertions(+), 302 deletions(-)
 create mode 100644 target/arm/debug_helper.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 5c154f01c5..294433da88 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -32,7 +32,7 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 
-obj-y += tlb_helper.o
+obj-y += tlb_helper.o debug_helper.o
 obj-y += translate.o op_helper.o
 obj-y += crypto_helper.o
 obj-y += iwmmxt_helper.o vec_helper.o neon_helper.o
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f21261c8ff..ca718fb38f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2578,19 +2578,16 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
-    cc->debug_excp_handler = arm_debug_excp_handler;
-    cc->debug_check_watchpoint = arm_debug_check_watchpoint;
-#if !defined(CONFIG_USER_ONLY)
-    cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
-#endif
-
     cc->disas_set_info = arm_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = arm_translate_init;
     cc->tlb_fill = arm_cpu_tlb_fill;
+    cc->debug_excp_handler = arm_debug_excp_handler;
+    cc->debug_check_watchpoint = arm_debug_check_watchpoint;
 #if !defined(CONFIG_USER_ONLY)
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
+    cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif
 }
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
new file mode 100644
index 0000000000..dde80273ff
--- /dev/null
+++ b/target/arm/debug_helper.c
@@ -0,0 +1,311 @@
+/*
+ * ARM debug helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+
+/* Return true if the linked breakpoint entry lbn passes its checks */
+static bool linked_bp_matches(ARMCPU *cpu, int lbn)
+{
+    CPUARMState *env = &cpu->env;
+    uint64_t bcr = env->cp15.dbgbcr[lbn];
+    int brps = extract32(cpu->dbgdidr, 24, 4);
+    int ctx_cmps = extract32(cpu->dbgdidr, 20, 4);
+    int bt;
+    uint32_t contextidr;
+
+    /*
+     * Links to unimplemented or non-context aware breakpoints are
+     * CONSTRAINED UNPREDICTABLE: either behave as if disabled, or
+     * as if linked to an UNKNOWN context-aware breakpoint (in which
+     * case DBGWCR<n>_EL1.LBN must indicate that breakpoint).
+     * We choose the former.
+     */
+    if (lbn > brps || lbn < (brps - ctx_cmps)) {
+        return false;
+    }
+
+    bcr = env->cp15.dbgbcr[lbn];
+
+    if (extract64(bcr, 0, 1) == 0) {
+        /* Linked breakpoint disabled : generate no events */
+        return false;
+    }
+
+    bt = extract64(bcr, 20, 4);
+
+    /*
+     * We match the whole register even if this is AArch32 using the
+     * short descriptor format (in which case it holds both PROCID and ASID),
+     * since we don't implement the optional v7 context ID masking.
+     */
+    contextidr = extract64(env->cp15.contextidr_el[1], 0, 32);
+
+    switch (bt) {
+    case 3: /* linked context ID match */
+        if (arm_current_el(env) > 1) {
+            /* Context matches never fire in EL2 or (AArch64) EL3 */
+            return false;
+        }
+        return (contextidr == extract64(env->cp15.dbgbvr[lbn], 0, 32));
+    case 5: /* linked address mismatch (reserved in AArch64) */
+    case 9: /* linked VMID match (reserved if no EL2) */
+    case 11: /* linked context ID and VMID match (reserved if no EL2) */
+    default:
+        /*
+         * Links to Unlinked context breakpoints must generate no
+         * events; we choose to do the same for reserved values too.
+         */
+        return false;
+    }
+
+    return false;
+}
+
+static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
+{
+    CPUARMState *env = &cpu->env;
+    uint64_t cr;
+    int pac, hmc, ssc, wt, lbn;
+    /*
+     * Note that for watchpoints the check is against the CPU security
+     * state, not the S/NS attribute on the offending data access.
+     */
+    bool is_secure = arm_is_secure(env);
+    int access_el = arm_current_el(env);
+
+    if (is_wp) {
+        CPUWatchpoint *wp = env->cpu_watchpoint[n];
+
+        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
+            return false;
+        }
+        cr = env->cp15.dbgwcr[n];
+        if (wp->hitattrs.user) {
+            /*
+             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+             * match watchpoints as if they were accesses done at EL0, even if
+             * the CPU is at EL1 or higher.
+             */
+            access_el = 0;
+        }
+    } else {
+        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
+
+        if (!env->cpu_breakpoint[n] || env->cpu_breakpoint[n]->pc != pc) {
+            return false;
+        }
+        cr = env->cp15.dbgbcr[n];
+    }
+    /*
+     * The WATCHPOINT_HIT flag guarantees us that the watchpoint is
+     * enabled and that the address and access type match; for breakpoints
+     * we know the address matched; check the remaining fields, including
+     * linked breakpoints. We rely on WCR and BCR having the same layout
+     * for the LBN, SSC, HMC, PAC/PMC and is-linked fields.
+     * Note that some combinations of {PAC, HMC, SSC} are reserved and
+     * must act either like some valid combination or as if the watchpoint
+     * were disabled. We choose the former, and use this together with
+     * the fact that EL3 must always be Secure and EL2 must always be
+     * Non-Secure to simplify the code slightly compared to the full
+     * table in the ARM ARM.
+     */
+    pac = extract64(cr, 1, 2);
+    hmc = extract64(cr, 13, 1);
+    ssc = extract64(cr, 14, 2);
+
+    switch (ssc) {
+    case 0:
+        break;
+    case 1:
+    case 3:
+        if (is_secure) {
+            return false;
+        }
+        break;
+    case 2:
+        if (!is_secure) {
+            return false;
+        }
+        break;
+    }
+
+    switch (access_el) {
+    case 3:
+    case 2:
+        if (!hmc) {
+            return false;
+        }
+        break;
+    case 1:
+        if (extract32(pac, 0, 1) == 0) {
+            return false;
+        }
+        break;
+    case 0:
+        if (extract32(pac, 1, 1) == 0) {
+            return false;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    wt = extract64(cr, 20, 1);
+    lbn = extract64(cr, 16, 4);
+
+    if (wt && !linked_bp_matches(cpu, lbn)) {
+        return false;
+    }
+
+    return true;
+}
+
+static bool check_watchpoints(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    int n;
+
+    /*
+     * If watchpoints are disabled globally or we can't take debug
+     * exceptions here then watchpoint firings are ignored.
+     */
+    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
+        || !arm_generate_debug_exceptions(env)) {
+        return false;
+    }
+
+    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
+        if (bp_wp_matches(cpu, n, true)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static bool check_breakpoints(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    int n;
+
+    /*
+     * If breakpoints are disabled globally or we can't take debug
+     * exceptions here then breakpoint firings are ignored.
+     */
+    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
+        || !arm_generate_debug_exceptions(env)) {
+        return false;
+    }
+
+    for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
+        if (bp_wp_matches(cpu, n, false)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+void HELPER(check_breakpoints)(CPUARMState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    if (check_breakpoints(cpu)) {
+        HELPER(exception_internal(env, EXCP_DEBUG));
+    }
+}
+
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+{
+    /*
+     * Called by core code when a CPU watchpoint fires; need to check if this
+     * is also an architectural watchpoint match.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    return check_watchpoints(cpu);
+}
+
+void arm_debug_excp_handler(CPUState *cs)
+{
+    /*
+     * Called by core code when a watchpoint or breakpoint fires;
+     * need to check which one and raise the appropriate exception.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    CPUWatchpoint *wp_hit = cs->watchpoint_hit;
+
+    if (wp_hit) {
+        if (wp_hit->flags & BP_CPU) {
+            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
+            bool same_el = arm_debug_target_el(env) == arm_current_el(env);
+
+            cs->watchpoint_hit = NULL;
+
+            env->exception.fsr = arm_debug_exception_fsr(env);
+            env->exception.vaddress = wp_hit->hitaddr;
+            raise_exception(env, EXCP_DATA_ABORT,
+                    syn_watchpoint(same_el, 0, wnr),
+                    arm_debug_target_el(env));
+        }
+    } else {
+        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
+        bool same_el = (arm_debug_target_el(env) == arm_current_el(env));
+
+        /*
+         * (1) GDB breakpoints should be handled first.
+         * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
+         * since singlestep is also done by generating a debug internal
+         * exception.
+         */
+        if (cpu_breakpoint_test(cs, pc, BP_GDB)
+            || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
+            return;
+        }
+
+        env->exception.fsr = arm_debug_exception_fsr(env);
+        /*
+         * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+         * values to the guest that it shouldn't be able to see at its
+         * exception/security level.
+         */
+        env->exception.vaddress = 0;
+        raise_exception(env, EXCP_PREFETCH_ABORT,
+                        syn_breakpoint(same_el),
+                        arm_debug_target_el(env));
+    }
+}
+
+#if !defined(CONFIG_USER_ONLY)
+
+vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * In BE32 system mode, target memory is stored byteswapped (on a
+     * little-endian host system), and by the time we reach here (via an
+     * opcode helper) the addresses of subword accesses have been adjusted
+     * to account for that, which means that watchpoints will not match.
+     * Undo the adjustment here.
+     */
+    if (arm_sctlr_b(env)) {
+        if (len == 1) {
+            addr ^= 3;
+        } else if (len == 2) {
+            addr ^= 2;
+        }
+    }
+
+    return addr;
+}
+
+#endif
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 9850993c11..1ab91f915e 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -831,301 +831,6 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
     }
 }
 
-/* Return true if the linked breakpoint entry lbn passes its checks */
-static bool linked_bp_matches(ARMCPU *cpu, int lbn)
-{
-    CPUARMState *env = &cpu->env;
-    uint64_t bcr = env->cp15.dbgbcr[lbn];
-    int brps = extract32(cpu->dbgdidr, 24, 4);
-    int ctx_cmps = extract32(cpu->dbgdidr, 20, 4);
-    int bt;
-    uint32_t contextidr;
-
-    /*
-     * Links to unimplemented or non-context aware breakpoints are
-     * CONSTRAINED UNPREDICTABLE: either behave as if disabled, or
-     * as if linked to an UNKNOWN context-aware breakpoint (in which
-     * case DBGWCR<n>_EL1.LBN must indicate that breakpoint).
-     * We choose the former.
-     */
-    if (lbn > brps || lbn < (brps - ctx_cmps)) {
-        return false;
-    }
-
-    bcr = env->cp15.dbgbcr[lbn];
-
-    if (extract64(bcr, 0, 1) == 0) {
-        /* Linked breakpoint disabled : generate no events */
-        return false;
-    }
-
-    bt = extract64(bcr, 20, 4);
-
-    /*
-     * We match the whole register even if this is AArch32 using the
-     * short descriptor format (in which case it holds both PROCID and ASID),
-     * since we don't implement the optional v7 context ID masking.
-     */
-    contextidr = extract64(env->cp15.contextidr_el[1], 0, 32);
-
-    switch (bt) {
-    case 3: /* linked context ID match */
-        if (arm_current_el(env) > 1) {
-            /* Context matches never fire in EL2 or (AArch64) EL3 */
-            return false;
-        }
-        return (contextidr == extract64(env->cp15.dbgbvr[lbn], 0, 32));
-    case 5: /* linked address mismatch (reserved in AArch64) */
-    case 9: /* linked VMID match (reserved if no EL2) */
-    case 11: /* linked context ID and VMID match (reserved if no EL2) */
-    default:
-        /*
-         * Links to Unlinked context breakpoints must generate no
-         * events; we choose to do the same for reserved values too.
-         */
-        return false;
-    }
-
-    return false;
-}
-
-static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
-{
-    CPUARMState *env = &cpu->env;
-    uint64_t cr;
-    int pac, hmc, ssc, wt, lbn;
-    /*
-     * Note that for watchpoints the check is against the CPU security
-     * state, not the S/NS attribute on the offending data access.
-     */
-    bool is_secure = arm_is_secure(env);
-    int access_el = arm_current_el(env);
-
-    if (is_wp) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-
-        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
-            return false;
-        }
-        cr = env->cp15.dbgwcr[n];
-        if (wp->hitattrs.user) {
-            /*
-             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-             * match watchpoints as if they were accesses done at EL0, even if
-             * the CPU is at EL1 or higher.
-             */
-            access_el = 0;
-        }
-    } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-
-        if (!env->cpu_breakpoint[n] || env->cpu_breakpoint[n]->pc != pc) {
-            return false;
-        }
-        cr = env->cp15.dbgbcr[n];
-    }
-    /*
-     * The WATCHPOINT_HIT flag guarantees us that the watchpoint is
-     * enabled and that the address and access type match; for breakpoints
-     * we know the address matched; check the remaining fields, including
-     * linked breakpoints. We rely on WCR and BCR having the same layout
-     * for the LBN, SSC, HMC, PAC/PMC and is-linked fields.
-     * Note that some combinations of {PAC, HMC, SSC} are reserved and
-     * must act either like some valid combination or as if the watchpoint
-     * were disabled. We choose the former, and use this together with
-     * the fact that EL3 must always be Secure and EL2 must always be
-     * Non-Secure to simplify the code slightly compared to the full
-     * table in the ARM ARM.
-     */
-    pac = extract64(cr, 1, 2);
-    hmc = extract64(cr, 13, 1);
-    ssc = extract64(cr, 14, 2);
-
-    switch (ssc) {
-    case 0:
-        break;
-    case 1:
-    case 3:
-        if (is_secure) {
-            return false;
-        }
-        break;
-    case 2:
-        if (!is_secure) {
-            return false;
-        }
-        break;
-    }
-
-    switch (access_el) {
-    case 3:
-    case 2:
-        if (!hmc) {
-            return false;
-        }
-        break;
-    case 1:
-        if (extract32(pac, 0, 1) == 0) {
-            return false;
-        }
-        break;
-    case 0:
-        if (extract32(pac, 1, 1) == 0) {
-            return false;
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    wt = extract64(cr, 20, 1);
-    lbn = extract64(cr, 16, 4);
-
-    if (wt && !linked_bp_matches(cpu, lbn)) {
-        return false;
-    }
-
-    return true;
-}
-
-static bool check_watchpoints(ARMCPU *cpu)
-{
-    CPUARMState *env = &cpu->env;
-    int n;
-
-    /*
-     * If watchpoints are disabled globally or we can't take debug
-     * exceptions here then watchpoint firings are ignored.
-     */
-    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
-        return false;
-    }
-
-    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        if (bp_wp_matches(cpu, n, true)) {
-            return true;
-        }
-    }
-    return false;
-}
-
-static bool check_breakpoints(ARMCPU *cpu)
-{
-    CPUARMState *env = &cpu->env;
-    int n;
-
-    /*
-     * If breakpoints are disabled globally or we can't take debug
-     * exceptions here then breakpoint firings are ignored.
-     */
-    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
-        return false;
-    }
-
-    for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
-        if (bp_wp_matches(cpu, n, false)) {
-            return true;
-        }
-    }
-    return false;
-}
-
-void HELPER(check_breakpoints)(CPUARMState *env)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    if (check_breakpoints(cpu)) {
-        HELPER(exception_internal(env, EXCP_DEBUG));
-    }
-}
-
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
-{
-    /*
-     * Called by core code when a CPU watchpoint fires; need to check if this
-     * is also an architectural watchpoint match.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-
-    return check_watchpoints(cpu);
-}
-
-vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * In BE32 system mode, target memory is stored byteswapped (on a
-     * little-endian host system), and by the time we reach here (via an
-     * opcode helper) the addresses of subword accesses have been adjusted
-     * to account for that, which means that watchpoints will not match.
-     * Undo the adjustment here.
-     */
-    if (arm_sctlr_b(env)) {
-        if (len == 1) {
-            addr ^= 3;
-        } else if (len == 2) {
-            addr ^= 2;
-        }
-    }
-
-    return addr;
-}
-
-void arm_debug_excp_handler(CPUState *cs)
-{
-    /*
-     * Called by core code when a watchpoint or breakpoint fires;
-     * need to check which one and raise the appropriate exception.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    CPUWatchpoint *wp_hit = cs->watchpoint_hit;
-
-    if (wp_hit) {
-        if (wp_hit->flags & BP_CPU) {
-            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
-            bool same_el = arm_debug_target_el(env) == arm_current_el(env);
-
-            cs->watchpoint_hit = NULL;
-
-            env->exception.fsr = arm_debug_exception_fsr(env);
-            env->exception.vaddress = wp_hit->hitaddr;
-            raise_exception(env, EXCP_DATA_ABORT,
-                    syn_watchpoint(same_el, 0, wnr),
-                    arm_debug_target_el(env));
-        }
-    } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-        bool same_el = (arm_debug_target_el(env) == arm_current_el(env));
-
-        /*
-         * (1) GDB breakpoints should be handled first.
-         * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
-         * since singlestep is also done by generating a debug internal
-         * exception.
-         */
-        if (cpu_breakpoint_test(cs, pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
-            return;
-        }
-
-        env->exception.fsr = arm_debug_exception_fsr(env);
-        /*
-         * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-         * values to the guest that it shouldn't be able to see at its
-         * exception/security level.
-         */
-        env->exception.vaddress = 0;
-        raise_exception(env, EXCP_PREFETCH_ABORT,
-                        syn_breakpoint(same_el),
-                        arm_debug_target_el(env));
-    }
-}
-
 /* ??? Flag setting arithmetic is awkward because we need to do comparisons.
    The only way to do that in TCG is a conditional branch, which clobbers
    all our temporaries.  For now implement these as helper functions.  */
-- 
2.20.1
