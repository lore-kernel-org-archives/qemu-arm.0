Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp656826lfm;
        Sun, 16 May 2021 13:09:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2kOqAMaQtwWTPt+88ld/tMoBwCmhB50WMNv2yUBSpzOcb2Y84tiZT9BtwDd8P/N3/equk
X-Received: by 2002:a6b:4e02:: with SMTP id c2mr37904339iob.96.1621195788945;
        Sun, 16 May 2021 13:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195788; cv=none;
        d=google.com; s=arc-20160816;
        b=t8HIjuAU8pb7o1c628MC/dXm7ZLT4BnRAvfmNwIuq1JBtLJWUXyUshqYOpek3m0I64
         lzfD2pB7zJD0DpEivpvYm17zthBDs1TtQn5MEolG7tMV8G3uzexPMmYn/5oVE63XyCKA
         96GvC+FLKrEJ3Ew3mZejn/SCMfZLq7ecFGDxSsK51vkKTLsbUl98hv29faNbgJhrcoO8
         FtMzJ4q5AOaO8U4wKZOhgHeIBU8p5vy6rWG9Q+Vpm3HhGLvqCzEs4vY1o8dxyp1CRFiI
         qryq/5kMoi8S+p5A1ONuSzIhKSCoc+ri3pcjig4N+xhppwq1wCTvZDmOR6Jx135107Sv
         XlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QCJ0OtE1sNOjacrkVarW/LFZJ1m39d+5bqRcdNM4Co4=;
        b=zwSpsqPui3oWronxUctM/4FsJfl8Y44aAJnItNxyNav8BP2e1I/7JJ8nylo7QfSuxh
         EHK50bCJwGX+w1/NYXibMWk0CjfjDnfG7YQCurLmoocwCH7jIG4HxxJ/cV4oFdGU1NfE
         OmU2Yl2byReRpE1zxGkCPVRr5HAOrKlfR/qtlpkBwqfXXzAfCNWNsaYOjNfazTqqQMEr
         UJ+SMc2Ne0MJze5LI28VpOWcsdEHKJmTDysDyxRZX9vNDP1ibAm6xo28ZeVskiUcfHtZ
         1hr6rhkJSlj/GJOmlGaAvLrs9XYrRmdRUHg2wdY5un0DtfgXXP0V2tpaPK7fYo7Q8sW/
         1GgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si2690065jav.78.2021.05.16.13.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liN5A-0004Bl-8i
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMvQ-0003oc-VD; Sun, 16 May 2021 15:59:45 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45402 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMv9-0008GC-WC; Sun, 16 May 2021 15:59:43 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id A0D9C60806A0;
 Sun, 16 May 2021 21:59:06 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 16/19] hvf: arm: Implement PSCI handling
Date: Sun, 16 May 2021 21:58:52 +0200
Message-Id: <20210516195855.28869-17-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V46/Q3Aj6/Q7

We need to handle PSCI calls. Most of the TCG code works for us,
but we can simplify it to only handle aa64 mode and we need to
handle SUSPEND differently.

This patch takes the TCG code as template and duplicates it in HVF.

To tell the guest that we support PSCI 0.2 now, update the check in
arm_cpu_initfn() as well.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

  v6 -> v7:

    - This patch integrates "arm: Set PSCI to 0.2 for HVF"
---
 target/arm/cpu.c            |   4 +-
 target/arm/hvf/hvf.c        | 124 ++++++++++++++++++++++++++++++++++--
 target/arm/hvf/trace-events |   1 +
 3 files changed, 123 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 762d8a6d26..b202d06e09 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1079,8 +1079,8 @@ static void arm_cpu_initfn(Object *obj)
     cpu->psci_version = 1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
-    if (tcg_enabled()) {
-        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+    if (tcg_enabled() || hvf_enabled()) {
+        cpu->psci_version = 2; /* TCG and HVF implement PSCI 0.2 */
     }
 }
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 580b756ac6..acf8fd4060 100644
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
@@ -45,6 +46,8 @@
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
+static void hvf_wfi(CPUState *cpu);
+
 typedef struct ARMHostCPUFeatures {
     ARMISARegisters isar;
     uint64_t features;
@@ -551,6 +554,109 @@ static void hvf_raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndro
     env->pc = addr;
 }
 
+static int hvf_psci_cpu_off(ARMCPU *arm_cpu)
+{
+    int32_t ret = 0;
+    ret = arm_set_cpu_off(arm_cpu->mp_affinity);
+    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
+
+    return 0;
+}
+
+static int hvf_handle_psci_call(CPUState *cpu)
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
+    trace_hvf_psci_call(param[0], param[1], param[2], param[3], arm_cpu->mp_affinity);
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
+        /* QEMU reset and shutdown are async requests, but PSCI
+         * mandates that we never return from the reset/shutdown
+         * call, so power the CPU off now so it doesn't execute
+         * anything further.
+         */
+        return hvf_psci_cpu_off(arm_cpu);
+    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        return hvf_psci_cpu_off(arm_cpu);
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
+        return hvf_psci_cpu_off(arm_cpu);
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
+        return 1;
+    }
+
+    env->xregs[0] = ret;
+    return 0;
+}
+
 static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -712,6 +818,8 @@ int hvf_vcpu_exec(CPUState *cpu)
     }
 
     if (cpu->halted) {
+        /* On unhalt, we usually have CPU state changes. Prepare for them. */
+        cpu_synchronize_state(cpu);
         return EXCP_HLT;
     }
 
@@ -809,13 +917,21 @@ int hvf_vcpu_exec(CPUState *cpu)
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-        trace_hvf_unknown_hvf(env->xregs[0]);
-        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
+        if (!hvf_handle_psci_call(cpu)) {
+            advance_pc = true;
+        } else {
+            trace_hvf_unknown_hvf(env->xregs[0]);
+            hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
+        }
         break;
     case EC_AA64_SMC:
         cpu_synchronize_state(cpu);
-        trace_hvf_unknown_smc(env->xregs[0]);
-        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
+        if (!hvf_handle_psci_call(cpu)) {
+            advance_pc = true;
+        } else {
+            trace_hvf_unknown_smc(env->xregs[0]);
+            hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
+        }
         break;
     default:
         cpu_synchronize_state(cpu);
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index 039dc2b70f..62b098b48c 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -8,3 +8,4 @@ hvf_sysreg_write(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_
 hvf_unknown_hvf(uint64_t x0) "unknown HVC! %016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! %016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
+hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=%016"PRIx64" x1=%016"PRIx64" x2=%016"PRIx64" x3=%016"PRIx64" cpu=%x"
-- 
2.30.1 (Apple Git-130)

