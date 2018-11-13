Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4619900wrw;
        Tue, 13 Nov 2018 09:11:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5d6xTU8CTAibvQ63atr9KrobP/WCpTV9QSl1YwUyMIa6HEkUcbTiSJR3nvqdTDogxd91OYp
X-Received: by 2002:ad4:510f:: with SMTP id g15mr6274714qvp.46.1542129075827;
        Tue, 13 Nov 2018 09:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129075; cv=none;
        d=google.com; s=arc-20160816;
        b=JJ69zIavV7tuPhE9H5m8271j+j22Zz+/z+nkIOfAaEuGsNyeJceZ2K4OorMMfXusaU
         a8udh18/dzAiuuv5rfMW3uFuNjr8nRRUpSMi2entaqUzosZWhafF6XzHqCN4Lv+Zvn6k
         6V1XKdo5hZLS71hWb6vLOTtkFJoQ7i/16TMuhvUsviW6vUZODUcqD2Ny8l3dnXl87IgT
         POue+lgwPzATXcut4fBvi23Q1simuwNxCqbt1FLljbdSvtnUGjkV8Rd7E059/BzIK9CE
         mTdPvYd6Or5sl+XlQI3dW17NF+JhyUS19nFrAe561Py08R2KEo/hUnFoPilSGido17aA
         gzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=hL6kao7JPlJ1/TRK3neTb1gbz6VEsY+lq0LNU4IRNkU=;
        b=QF1c0l3l5eY1zpvI0kFi05CdojVxx4/dALfZnw5zrzxndKaYW9wRDUQLnrAHh+7h0T
         eWwXVFudxCRicJGDjpy7R+km8yxyWknf5T1tHslQP3W379jwoMQd5GuEWlUVTyY3vHer
         GElo3B6e7l82EsDj7JqUUn7ZW9n7zNne1yhnNiUeWArWsycAfxZkWHsvv/ynvgQ0VRAe
         81s1uXjZF2NwaLOdhi4lKGOsNaPAubROILkxYcDHgdmO3u0rUScpIHclu4T8+xkvGT45
         69RsjjczLyFrbSQJ0V8Ho2ABEnyWQpzoKypaoguGEcv123IwgILnFi3I1ZZIeoRG4KKB
         YzBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4si1270004qkj.161.2018.11.13.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:11:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcDb-0002xo-6r
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:11:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAR-0006qI-53
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:08:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbwo-00041G-T5
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:53:59 -0500
Received: from mga06.intel.com ([134.134.136.31]:62858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbwl-0003pu-TL; Tue, 13 Nov 2018 11:53:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922122"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:44 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:44 +0100
Message-Id: <20181113165247.4806-11-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH 10/13] target: arm: Move watchpoints APIs to
 helper.c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sy6ui4Q80ahO

Here again, those APIs are not TCG dependent and can move to the always
built helper.c.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
---
 target/arm/internals.h |   6 ++
 target/arm/helper.c    | 204 +++++++++++++++++++++++++++++++++++++++++
 target/arm/op_helper.c | 204 -----------------------------------------
 3 files changed, 210 insertions(+), 204 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ddb594d58d..7ab22208a3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -937,6 +937,12 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        int *prot, bool *is_subpage,
                        ARMMMUFaultInfo *fi, uint32_t *mregion);
 
+/*
+ * Returns true when the current CPU execution context matches
+ * the watchpoint or the breakpoint pointed at by n.
+ */
+bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp);
+
 #ifdef TARGET_AARCH64
 void aarch64_cpu_dump_state(CPUState *cs, FILE *f,
                             fprintf_function cpu_fprintf, int flags);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff3011fcb6..c4e7d23023 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9770,3 +9770,207 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
         cpu_fprintf(f, "FPSCR: %08x\n", (int)env->vfp.xregs[ARM_VFP_FPSCR]);
     }
 }
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
+    /* Links to unimplemented or non-context aware breakpoints are
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
+    /* We match the whole register even if this is AArch32 using the
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
+        /* Links to Unlinked context breakpoints must generate no
+         * events; we choose to do the same for reserved values too.
+         */
+        return false;
+    }
+
+    return false;
+}
+
+bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
+{
+    CPUARMState *env = &cpu->env;
+    uint64_t cr;
+    int pac, hmc, ssc, wt, lbn;
+    /* Note that for watchpoints the check is against the CPU security
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
+            /* The LDRT/STRT/LDT/STT "unprivileged access" instructions should
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
+    /* The WATCHPOINT_HIT flag guarantees us that the watchpoint is
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
+    /* If watchpoints are disabled globally or we can't take debug
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
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+{
+    /* Called by core code when a CPU watchpoint fires; need to check if this
+     * is also an architectural watchpoint match.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    return check_watchpoints(cpu);
+}
+
+vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /* In BE32 system mode, target memory is stored byteswapped (on a
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
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 3b0459db50..c836d05aab 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -1171,178 +1171,6 @@ illegal_return:
                   "resuming execution at 0x%" PRIx64 "\n", cur_el, env->pc);
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
-    /* Links to unimplemented or non-context aware breakpoints are
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
-    /* We match the whole register even if this is AArch32 using the
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
-        /* Links to Unlinked context breakpoints must generate no
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
-    /* Note that for watchpoints the check is against the CPU security
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
-            /* The LDRT/STRT/LDT/STT "unprivileged access" instructions should
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
-    /* The WATCHPOINT_HIT flag guarantees us that the watchpoint is
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
-    /* If watchpoints are disabled globally or we can't take debug
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
 static bool check_breakpoints(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -1373,38 +1201,6 @@ void HELPER(check_breakpoints)(CPUARMState *env)
     }
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
-{
-    /* Called by core code when a CPU watchpoint fires; need to check if this
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
-    /* In BE32 system mode, target memory is stored byteswapped (on a
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
 void arm_debug_excp_handler(CPUState *cs)
 {
     /* Called by core code when a watchpoint or breakpoint fires;
-- 
2.19.1

