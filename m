Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp627403ejx;
        Wed, 16 Nov 2022 09:48:17 -0800 (PST)
X-Received: by 2002:a05:600c:1e89:b0:3cf:774b:ce6f with SMTP id be9-20020a05600c1e8900b003cf774bce6fmr2893575wmb.133.1668620896999;
        Wed, 16 Nov 2022 09:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668620896; cv=none;
        d=google.com; s=arc-20160816;
        b=cWBcJ7zy5Zkrz4ft50smT4H25Z3bQurNFpv7sQXSivqdYeQNbKRqGJRcK95/bOvWaP
         fsinnCd5oFknqHX3rDsjbkNsaDjyV4M07MuEZXoEiShw4VgumeAIO40SrS8fYsm7c97P
         NNl9J3TuCHnf25k00EGRDWxgi7fklh5NKX6XymsGoxrXsVTQ1Dfq5nl/HjkqSBr+NIw8
         Q5TNiokPfUegLUj4DcuAZEjyXHO/GgjRzPmONWNDXGExb9DUvB7Q36DKYX/pllsdIfmQ
         uafGUJC/cpZPuQ6oChZbcW03QN31xC8EF7/o5Son6amdgDsuhDibl8bHMxERo0LuaVqX
         sgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p7NsJDp/JrHpKGCJphejeFdwXcPwioqdjw87NrGNIJo=;
        b=s5VqiQFA84HtaHadm63lf8OGxNY4WUK32z+zENEWT2PMrRVvqewf9wDvuvpBD4V4nS
         d8XXDmAegaFX0O3xFb59r44xbfXpF8es729FO2Dz2tS5a/0eLsy2rwpHas+wZ0Pfi6c4
         Wo+HpVmhUUmFGvxXrik8ji4N2pQJ0AjWICXCxBVYvM3MfMFF5AtfH6JsdpNnWb4kck9Z
         PKFN/VkvjzjJUFHMsSRBVz/J11Qd4izIc9qqtLx/CAXpy1EmxyEQEASDNo33GLzb2nvA
         3JWVDkXAHpXqSUk+WpbJOo8eUbIf/MOMbnrNH3dlENU9mU1hMusfp+7WWJpnx3FWBDon
         1dsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bVmwjrQ9;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l13-20020a05600c2ccd00b003cf9c01af70sor368151wmc.34.2022.11.16.09.48.16
        (Google Transport Security);
        Wed, 16 Nov 2022 09:48:16 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bVmwjrQ9;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7NsJDp/JrHpKGCJphejeFdwXcPwioqdjw87NrGNIJo=;
        b=bVmwjrQ9Fz2BqooY06UHyWtg1lrJYH/0SylTtV7JFWI+ZwiBYjMAqs0lGfxm8EPcf0
         v4MaY4Er2yjWywmAtCwGafv/Sk0Bv0Gryb5uwpEgQpmc9K9d7ehj+g2gP2pSgmo54RkZ
         ghGucd3+AC3yGSEQ0ko2gQpY/uUOTncyA05lzrtgnsZllRiOZD9SCftMKmjrjIDFeZoZ
         Bni1okk4fYqrwLYzGRITib/ZeRL38yBzrCFPKDE18lOF1dYZhHr6wuA6vkSt0PALgSnH
         e7U5p074jThhzjJWen3hOO6WTCTO1zKhImljUGtMAYhOskgQXMSJCnRA0b/TcAmr0rq/
         T1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7NsJDp/JrHpKGCJphejeFdwXcPwioqdjw87NrGNIJo=;
        b=olUghUFshR00IRodU5IYirmaVR253or8HHbqcETDs7vYHHxCEb9AcntE6ZedmJSbje
         9eVKu6EQsTkQTsVsGg+eFpRZNnYD2c+L0pWnb3MLkQCHDhkPL/d4/Mf5y7rvF5YK8fBy
         PapXMCIjW13cgjoB8J/ZqdMEaShafWYNUcNwzLgLWGjfIwCGlGRcCuODZD+Rn5KPRWjs
         0AZEcZBX24z29vBb0kuw7HN+iIh0clVbzikn9wyG5Vg2EnGZLPs2e8oTR1UpW7CLa2Ol
         pLH1F+t0/8b8AhaPy8VFTGbPEYBectdo9zBGB07BEq0E6Gf1R8uWxiTfgltA0wrKuiGN
         SiRg==
X-Gm-Message-State: ANoB5pnnDvn1cwa7w44kPIkOUPPtrtbxBZPhBQPDdJP6VPg/X3bbn1UJ
	zhdsZb5FV2QbHnrhh0vnP2E=
X-Google-Smtp-Source: AA0mqf6/h5kvMzP1dKaDDEbetoxIc5HUf16g0wNBx55zyAJpG50A8jEmawUkkL5io6gIOVbP8G5Sqw==
X-Received: by 2002:a05:600c:5408:b0:3cf:85e7:7b40 with SMTP id he8-20020a05600c540800b003cf85e77b40mr195508wmb.63.1668620896608;
        Wed, 16 Nov 2022 09:48:16 -0800 (PST)
Return-Path: <francesco.cagnin@gmail.com>
Received: from localhost.localdomain (229.19.205.77.rev.sfr.net. [77.205.19.229])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c465100b003cf483ee8e0sm2477490wmo.24.2022.11.16.09.48.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Nov 2022 09:48:16 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk,
	dirty@apple.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	agraf@csgraf.de,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon hosts
Date: Wed, 16 Nov 2022 18:47:48 +0100
Message-Id: <20221116174749.65175-3-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116174749.65175-1-fcagnin@quarkslab.com>
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cUxInFRMs3+I

From: Francesco Cagnin <fcagnin@quarkslab.com>

Support is added for single-stepping, software breakpoints, hardware
breakpoints and watchpoints. The code has been structured like the KVM
counterpart (and many parts are basically identical).

Guests can be debugged through the gdbstub.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 accel/hvf/hvf-accel-ops.c | 123 ++++++++++++++++++++++++
 accel/hvf/hvf-all.c       |  24 +++++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++++++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 194 +++++++++++++++++++++++++++++++++++++-
 6 files changed, 372 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 24913ca9c4..1ce0f94a64 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -52,6 +52,7 @@
 #include "qemu/main-loop.h"
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
@@ -340,12 +341,18 @@ static int hvf_accel_init(MachineState *ms)
     return hvf_arch_init();
 }
 
+static int hvf_gdbstub_sstep_flags(void)
+{
+    return SSTEP_ENABLE | SSTEP_NOIRQ;
+}
+
 static void hvf_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "HVF";
     ac->init_machine = hvf_accel_init;
     ac->allowed = &hvf_allowed;
+    ac->gdbstub_supported_sstep_flags = hvf_gdbstub_sstep_flags;
 }
 
 static const TypeInfo hvf_accel_type = {
@@ -462,6 +469,117 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool hvf_supports_guest_debug(void)
+{
+#ifdef TARGET_AARCH64
+    return true;
+#else
+    return false;
+#endif
+}
+
+static int hvf_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+{
+    struct hvf_sw_breakpoint *bp;
+    int err;
+
+    if (type == GDB_BREAKPOINT_SW) {
+        bp = hvf_find_sw_breakpoint(cpu, addr);
+        if (bp) {
+            bp->use_count++;
+            return 0;
+        }
+
+        bp = g_new(struct hvf_sw_breakpoint, 1);
+        bp->pc = addr;
+        bp->use_count = 1;
+        err = hvf_arch_insert_sw_breakpoint(cpu, bp);
+        if (err) {
+            g_free(bp);
+            return err;
+        }
+
+        QTAILQ_INSERT_HEAD(&cpu->hvf->hvf_sw_breakpoints, bp, entry);
+    } else {
+        err = hvf_arch_insert_hw_breakpoint(addr, len, type);
+        if (err) {
+            return err;
+        }
+    }
+
+    CPU_FOREACH(cpu) {
+        err = hvf_update_guest_debug(cpu);
+        if (err) {
+            return err;
+        }
+    }
+    return 0;
+}
+
+static int hvf_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+{
+    struct hvf_sw_breakpoint *bp;
+    int err;
+
+    if (type == GDB_BREAKPOINT_SW) {
+        bp = hvf_find_sw_breakpoint(cpu, addr);
+        if (!bp) {
+            return -ENOENT;
+        }
+
+        if (bp->use_count > 1) {
+            bp->use_count--;
+            return 0;
+        }
+
+        err = hvf_arch_remove_sw_breakpoint(cpu, bp);
+        if (err) {
+            return err;
+        }
+
+        QTAILQ_REMOVE(&cpu->hvf->hvf_sw_breakpoints, bp, entry);
+        g_free(bp);
+    } else {
+        err = hvf_arch_remove_hw_breakpoint(addr, len, type);
+        if (err) {
+            return err;
+        }
+    }
+
+    CPU_FOREACH(cpu) {
+        err = hvf_update_guest_debug(cpu);
+        if (err) {
+            return err;
+        }
+    }
+    return 0;
+}
+
+static void hvf_remove_all_breakpoints(CPUState *cpu)
+{
+    struct hvf_sw_breakpoint *bp, *next;
+    CPUState *tmpcpu;
+
+    QTAILQ_FOREACH_SAFE(bp, &cpu->hvf->hvf_sw_breakpoints, entry, next) {
+        if (hvf_arch_remove_sw_breakpoint(cpu, bp) != 0) {
+            /* Try harder to find a CPU that currently sees the breakpoint. */
+            CPU_FOREACH(tmpcpu)
+            {
+                if (hvf_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
+                    break;
+                }
+            }
+        }
+        QTAILQ_REMOVE(&cpu->hvf->hvf_sw_breakpoints, bp, entry);
+        g_free(bp);
+    }
+    hvf_arch_remove_all_hw_breakpoints();
+
+    CPU_FOREACH(cpu) {
+        hvf_update_guest_debug(cpu);
+    }
+}
+
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -473,6 +591,11 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
     ops->synchronize_state = hvf_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
+
+    ops->supports_guest_debug = hvf_supports_guest_debug;
+    ops->insert_breakpoint = hvf_insert_breakpoint;
+    ops->remove_breakpoint = hvf_remove_breakpoint;
+    ops->remove_all_breakpoints = hvf_remove_all_breakpoints;
 };
 static const TypeInfo hvf_accel_ops_type = {
     .name = ACCEL_OPS_NAME("hvf"),
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 0043f4d308..3f02c090b1 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -10,6 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "exec/gdbstub.h"
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
 
@@ -44,3 +45,26 @@ void assert_hvf_ok(hv_return_t ret)
 
     abort();
 }
+
+struct hvf_sw_breakpoint *hvf_find_sw_breakpoint(CPUState *cpu, target_ulong pc)
+{
+    struct hvf_sw_breakpoint *bp;
+
+    QTAILQ_FOREACH(bp, &cpu->hvf->hvf_sw_breakpoints, entry) {
+        if (bp->pc == pc) {
+            return bp;
+        }
+    }
+    return NULL;
+}
+
+int hvf_sw_breakpoints_active(CPUState *cpu)
+{
+    return !QTAILQ_EMPTY(&cpu->hvf->hvf_sw_breakpoints);
+}
+
+int hvf_update_guest_debug(CPUState *cpu)
+{
+    hvf_arch_update_guest_debug(cpu);
+    return 0;
+}
diff --git a/cpu.c b/cpu.c
index 4a7d865427..1fd531aabd 100644
--- a/cpu.c
+++ b/cpu.c
@@ -33,6 +33,7 @@
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
+#include "sysemu/hvf.h"
 #include "sysemu/replay.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
@@ -389,6 +390,8 @@ void cpu_single_step(CPUState *cpu, int enabled)
         cpu->singlestep_enabled = enabled;
         if (kvm_enabled()) {
             kvm_update_guest_debug(cpu, 0);
+        } else if (hvf_enabled()) {
+            hvf_update_guest_debug(cpu);
         }
         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
     }
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index bb70082e45..3e99c80416 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -36,4 +36,33 @@ typedef struct HVFState HVFState;
 DECLARE_INSTANCE_CHECKER(HVFState, HVF_STATE,
                          TYPE_HVF_ACCEL)
 
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
+int hvf_update_guest_debug(CPUState *cpu);
+
+struct hvf_sw_breakpoint {
+    target_ulong pc;
+    target_ulong saved_insn;
+    int use_count;
+    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
+};
+
+struct hvf_sw_breakpoint *hvf_find_sw_breakpoint(CPUState *cpu,
+                                                 target_ulong pc);
+
+int hvf_sw_breakpoints_active(CPUState *cpu);
+
+int hvf_arch_insert_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp);
+int hvf_arch_remove_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp);
+int hvf_arch_insert_hw_breakpoint(target_ulong addr, target_ulong len,
+                                  int type);
+int hvf_arch_remove_hw_breakpoint(target_ulong addr, target_ulong len,
+                                  int type);
+void hvf_arch_remove_all_hw_breakpoints(void);
+
+void hvf_arch_update_guest_debug(CPUState *cpu);
+
+#endif /* NEED_CPU_H */
+
 #endif
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 6545f7cd61..a7957d046b 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -53,6 +53,7 @@ struct hvf_vcpu_state {
     void *exit;
     bool vtimer_masked;
     sigset_t unblock_ipi_mask;
+    QTAILQ_HEAD(, hvf_sw_breakpoint) hvf_sw_breakpoints;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..66fc82e9b9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -31,6 +31,22 @@
 #include "trace/trace-target_arm_hvf.h"
 #include "migration/vmstate.h"
 
+#include "exec/gdbstub.h"
+
+static void hvf_arm_init_debug(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+
+    max_hw_bps = arm_num_brps(arm_cpu);
+    hw_breakpoints =
+        g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
+
+    max_hw_wps = arm_num_wrps(arm_cpu);
+    hw_watchpoints =
+        g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
+    return;
+}
+
 #define HVF_SYSREG(crn, crm, op0, op1, op2) \
         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
 #define PL1_WRITE_MASK 0x4
@@ -621,6 +637,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               &arm_cpu->isar.id_aa64mmfr0);
     assert_hvf_ok(ret);
 
+    hvf_arm_init_debug(cpu);
+
     return 0;
 }
 
@@ -1166,11 +1184,12 @@ int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
+    int ret;
     hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
     hv_return_t r;
     bool advance_pc = false;
 
-    if (hvf_inject_interrupts(cpu)) {
+    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) && hvf_inject_interrupts(cpu)) {
         return EXCP_INTERRUPT;
     }
 
@@ -1188,6 +1207,7 @@ int hvf_vcpu_exec(CPUState *cpu)
     uint64_t syndrome = hvf_exit->exception.syndrome;
     uint32_t ec = syn_get_ec(syndrome);
 
+    ret = 0;
     qemu_mutex_lock_iothread();
     switch (exit_reason) {
     case HV_EXIT_REASON_EXCEPTION:
@@ -1207,6 +1227,47 @@ int hvf_vcpu_exec(CPUState *cpu)
     hvf_sync_vtimer(cpu);
 
     switch (ec) {
+    case EC_SOFTWARESTEP: {
+        ret = EXCP_DEBUG;
+
+        if (!cpu->singlestep_enabled) {
+            error_report("EC_SOFTWARESTEP but single-stepping not enabled");
+        }
+        break;
+    }
+    case EC_AA64_BKPT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        if (!hvf_find_sw_breakpoint(cpu, env->pc)) {
+            error_report("EC_AA64_BKPT but unknown sw breakpoint");
+        }
+        break;
+    }
+    case EC_BREAKPOINT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        if (!find_hw_breakpoint(cpu, env->pc)) {
+            error_report("EC_BREAKPOINT but unknown hw breakpoint");
+        }
+        break;
+    }
+    case EC_WATCHPOINT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        CPUWatchpoint *wp =
+            find_hw_watchpoint(cpu, hvf_exit->exception.virtual_address);
+        if (!wp) {
+            error_report("EXCP_DEBUG but unknown hw watchpoint");
+        }
+        cpu->watchpoint_hit = wp;
+        break;
+    }
     case EC_DATAABORT: {
         bool isv = syndrome & ARM_EL_ISV;
         bool iswrite = (syndrome >> 6) & 1;
@@ -1313,7 +1374,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         assert_hvf_ok(r);
     }
 
-    return 0;
+    return ret;
 }
 
 static const VMStateDescription vmstate_hvf_vtimer = {
@@ -1347,3 +1408,132 @@ int hvf_arch_init(void)
     qemu_add_vm_change_state_handler(hvf_vm_state_change, &vtimer);
     return 0;
 }
+
+static inline bool hvf_arm_hw_debug_active(CPUState *cpu)
+{
+    return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
+}
+
+static const uint32_t brk_insn = 0xd4200000;
+
+int hvf_arch_insert_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    if (cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
+        cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+int hvf_arch_remove_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    static uint32_t brk;
+
+    if (cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&brk, 4, 0) ||
+        brk != brk_insn ||
+        cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+int hvf_arch_insert_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return insert_hw_breakpoint(addr);
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return insert_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+int hvf_arch_remove_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return delete_hw_breakpoint(addr);
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return delete_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+void hvf_arch_remove_all_hw_breakpoints(void)
+{
+    if (cur_hw_wps > 0) {
+        g_array_remove_range(hw_watchpoints, 0, cur_hw_wps);
+    }
+    if (cur_hw_bps > 0) {
+        g_array_remove_range(hw_breakpoints, 0, cur_hw_bps);
+    }
+}
+
+#define MDSCR_EL1_SS_SHIFT  0
+#define MDSCR_EL1_MDE_SHIFT 15
+
+void hvf_arch_update_guest_debug(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t r = HV_SUCCESS;
+    bool trap_debug_exceptions = false;
+
+    cpu_synchronize_state(cpu);
+
+    if (cpu->singlestep_enabled) {
+        trap_debug_exceptions = true;
+
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
+        pstate_write(env, pstate_read(env) | PSTATE_SS);
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
+    }
+
+    if (hvf_sw_breakpoints_active(cpu)) {
+        trap_debug_exceptions = true;
+    }
+
+    if (hvf_arm_hw_debug_active(cpu)) {
+        trap_debug_exceptions = true;
+
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
+
+        int i;
+        for (i = 0; i < cur_hw_bps; i++) {
+            HWBreakpoint *bp = get_hw_bp(i);
+            env->cp15.dbgbcr[i] = bp->bcr;
+            env->cp15.dbgbvr[i] = bp->bvr;
+        }
+        for (i = 0; i < cur_hw_wps; i++) {
+            HWWatchpoint *bp = get_hw_wp(i);
+            env->cp15.dbgwcr[i] = bp->wcr;
+            env->cp15.dbgwvr[i] = bp->wvr;
+        }
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
+
+        int i;
+        for (i = 0; i < max_hw_bps; i++) {
+            env->cp15.dbgbcr[i] = 0;
+            env->cp15.dbgbvr[i] = 0;
+        }
+        for (i = 0; i < max_hw_wps; i++) {
+            env->cp15.dbgwcr[i] = 0;
+            env->cp15.dbgwvr[i] = 0;
+        }
+    }
+
+    r = hv_vcpu_set_trap_debug_exceptions(cpu->hvf->fd, trap_debug_exceptions);
+    assert_hvf_ok(r);
+}
-- 
2.38.1
