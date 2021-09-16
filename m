Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1262625lfp;
        Thu, 16 Sep 2021 09:07:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/gCAbdy57bwPMjUel5zMsoyGYoZgX/iZSh+A88dO/rehxJMTF6bCdalVBiQPApwToRQG1
X-Received: by 2002:ac8:7285:: with SMTP id v5mr5760614qto.300.1631808465368;
        Thu, 16 Sep 2021 09:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631808465; cv=none;
        d=google.com; s=arc-20160816;
        b=raIJVpqiLreYevh46ueHlpoluTCHOLHH+dlbrepUqkotwAkQXw+qFg3Z94DWyZxNLH
         TZhZe4B/pjpoo/1xhs/1aXaTMDyTN49aRfKWy1f+yYao+MimS9D1s6kUOzWo2RBDXaSo
         8pCSprFUP2Bjz3CTucIAZer1mrFkeC8bUjj1+oAotqMPJdq+QJ/ksaCQ9X21CFW/7HTX
         hs1B+aYvTPE4ZeYOmpa8YgaJn6Bl3wBcA8LkzdZknZjB3X0y9mCjFmgy9YnxDGEOebn5
         y96qzVKfSOkrFqbK/4gJFzLLQif00Yx18ELNiSedlUp6lXJTWmqLPktGv15/BOUbP8T+
         F3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=PW1I2Id/S2wGEDxxPD9tmBE9fgoNLKZSfwMLHpVNmPA=;
        b=LeezdELDbamsMOA1ki+K4T+Y5iENKP+eUIC/wHNtXl3Hu+SQmjbTWOM/SV6NMtymPm
         GFFNq/E7aM0U3AY1iA9qLEhuC5yujNzoATDh/CdTyM9n+WoyNJRmyeIJHPkYD0wsgGA3
         EOxW/ltxJTWN+9L1quawuOVlu03oV8/Zas8g/xhN2ftwjuRCn56AxPnGn4774C+FbSeD
         mAFKVMDGowiEs7NVfmaIbD/BhzMtT75Wj6zbN5nWs5DUQtxjn0CMtpOS5+PDi47AWW+Z
         xwQ1iRC7RFuoBgF9Blv0C0aJsI/QSzp0H8QmVAvnJ4fUK8uin/GTsxjjqOdsFx2vUOPL
         f3CA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si1870388vse.234.2021.09.16.09.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:07:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQtvM-0005ja-O1
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiP-00035f-2b; Thu, 16 Sep 2021 11:54:22 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51398 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiJ-000595-Ee; Thu, 16 Sep 2021 11:54:20 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 7956C60806D9;
 Thu, 16 Sep 2021 17:54:09 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 07/10] hvf: arm: Implement PSCI handling
Date: Thu, 16 Sep 2021 17:54:01 +0200
Message-Id: <20210916155404.86958-8-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R5cV0vIx4TUZ

We need to handle PSCI calls. Most of the TCG code works for us,
but we can simplify it to only handle aa64 mode and we need to
handle SUSPEND differently.

This patch takes the TCG code as template and duplicates it in HVF.

To tell the guest that we support PSCI 0.2 now, update the check in
arm_cpu_initfn() as well.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v6 -> v7:

  - This patch integrates "arm: Set PSCI to 0.2 for HVF"

v7 -> v8:

  - Do not advance for HVC, PC is already updated by hvf
  - Fix checkpatch error

v8 -> v9:

  - Use new hvf_raise_exception() prototype
  - Make cpu_off function void
  - Add comment about return value, use -1 for "not found"
  - Remove cpu_synchronize_state() when halted

v9 -> v10:

  - Only handle PSCI calls for the current conduit
  - Return true/false

v10 -> v11:

  - Inject UDEF on SMC. Will be changed in TCG+HVF in a later patch set.

v11 -> v12:

  - Structure SMC/HVC handling code similarly
  - Inject UDEF on HVC with SMC conduit
  - s/hvf_unknown_hvf/hvf_unknown_hvc/g
---
 target/arm/cpu.c            |   4 +-
 target/arm/hvf/hvf.c        | 141 ++++++++++++++++++++++++++++++++++--
 target/arm/hvf/trace-events |   1 +
 3 files changed, 139 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 016df2e1e7..e44c301527 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1096,8 +1096,8 @@ static void arm_cpu_initfn(Object *obj)
     cpu->psci_version = 1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
-    if (tcg_enabled()) {
-        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+    if (tcg_enabled() || hvf_enabled()) {
+        cpu->psci_version = 2; /* TCG and HVF implement PSCI 0.2 */
     }
 }
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 51b7250612..996f93a69d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
+#include "arm-powerctl.h"
 #include "target/arm/cpu.h"
 #include "target/arm/internals.h"
 #include "trace/trace-target_arm_hvf.h"
@@ -48,6 +49,8 @@
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
+static void hvf_wfi(CPUState *cpu);
+
 typedef struct HVFVTimer {
     /* Vtimer value during migration and paused state */
     uint64_t vtimer_val;
@@ -603,6 +606,117 @@ static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
     arm_cpu_do_interrupt(cpu);
 }
 
+static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
+{
+    int32_t ret = arm_set_cpu_off(arm_cpu->mp_affinity);
+    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
+}
+
+/*
+ * Handle a PSCI call.
+ *
+ * Returns 0 on success
+ *         -1 when the PSCI call is unknown,
+ */
+static bool hvf_handle_psci_call(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    uint64_t param[4] = {
+        env->xregs[0],
+        env->xregs[1],
+        env->xregs[2],
+        env->xregs[3]
+    };
+    uint64_t context_id, mpidr;
+    bool target_aarch64 = true;
+    CPUState *target_cpu_state;
+    ARMCPU *target_cpu;
+    target_ulong entry;
+    int target_el = 1;
+    int32_t ret = 0;
+
+    trace_hvf_psci_call(param[0], param[1], param[2], param[3],
+                        arm_cpu->mp_affinity);
+
+    switch (param[0]) {
+    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
+        break;
+    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+        ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
+        break;
+    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+        mpidr = param[1];
+
+        switch (param[2]) {
+        case 0:
+            target_cpu_state = arm_get_cpu_by_id(mpidr);
+            if (!target_cpu_state) {
+                ret = QEMU_PSCI_RET_INVALID_PARAMS;
+                break;
+            }
+            target_cpu = ARM_CPU(target_cpu_state);
+
+            ret = target_cpu->power_state;
+            break;
+        default:
+            /* Everything above affinity level 0 is always on. */
+            ret = 0;
+        }
+        break;
+    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        /*
+         * QEMU reset and shutdown are async requests, but PSCI
+         * mandates that we never return from the reset/shutdown
+         * call, so power the CPU off now so it doesn't execute
+         * anything further.
+         */
+        hvf_psci_cpu_off(arm_cpu);
+        break;
+    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        hvf_psci_cpu_off(arm_cpu);
+        break;
+    case QEMU_PSCI_0_1_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN64_CPU_ON:
+        mpidr = param[1];
+        entry = param[2];
+        context_id = param[3];
+        ret = arm_set_cpu_on(mpidr, entry, context_id,
+                             target_el, target_aarch64);
+        break;
+    case QEMU_PSCI_0_1_FN_CPU_OFF:
+    case QEMU_PSCI_0_2_FN_CPU_OFF:
+        hvf_psci_cpu_off(arm_cpu);
+        break;
+    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+        /* Affinity levels are not supported in QEMU */
+        if (param[1] & 0xfffe0000) {
+            ret = QEMU_PSCI_RET_INVALID_PARAMS;
+            break;
+        }
+        /* Powerdown is not supported, we always go into WFI */
+        env->xregs[0] = 0;
+        hvf_wfi(cpu);
+        break;
+    case QEMU_PSCI_0_1_FN_MIGRATE:
+    case QEMU_PSCI_0_2_FN_MIGRATE:
+        ret = QEMU_PSCI_RET_NOT_SUPPORTED;
+        break;
+    default:
+        return false;
+    }
+
+    env->xregs[0] = ret;
+    return true;
+}
+
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -905,14 +1019,31 @@ int hvf_vcpu_exec(CPUState *cpu)
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-        trace_hvf_unknown_hvc(env->xregs[0]);
-        /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
-        env->xregs[0] = -1;
+        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
+            if (!hvf_handle_psci_call(cpu)) {
+                trace_hvf_unknown_hvc(env->xregs[0]);
+                /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
+                env->xregs[0] = -1;
+            }
+        } else {
+            trace_hvf_unknown_hvc(env->xregs[0]);
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
         break;
     case EC_AA64_SMC:
         cpu_synchronize_state(cpu);
-        trace_hvf_unknown_smc(env->xregs[0]);
-        hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
+            advance_pc = true;
+
+            if (!hvf_handle_psci_call(cpu)) {
+                trace_hvf_unknown_smc(env->xregs[0]);
+                /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
+                env->xregs[0] = -1;
+            }
+        } else {
+            trace_hvf_unknown_smc(env->xregs[0]);
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
         break;
     default:
         cpu_synchronize_state(cpu);
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index db40d54bb2..820e8e0297 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -8,3 +8,4 @@ hvf_sysreg_write(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_
 hvf_unknown_hvc(uint64_t x0) "unknown HVC! 0x%016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
+hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
-- 
2.30.1 (Apple Git-130)

