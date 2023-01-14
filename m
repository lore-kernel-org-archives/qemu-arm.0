Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp216431ejc;
        Sat, 14 Jan 2023 08:13:52 -0800 (PST)
X-Received: by 2002:a5d:4351:0:b0:256:ff7d:2346 with SMTP id u17-20020a5d4351000000b00256ff7d2346mr48748741wrr.51.1673712832577;
        Sat, 14 Jan 2023 08:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673712832; cv=none;
        d=google.com; s=arc-20160816;
        b=WLz7K3G6XIgyb0jNnto/SYwiudP3mJmknWnZ18npcZuk7JBylGEug8Ch2QiNaDB75/
         TdNUS5/T9Ejo4fDHZq03RnTMC9d4oD9LaH3+cZ4esvxzwsQa3HmHBInF4+/FOvAVBj09
         VXhPpIWLHGha0rxouRcN7Ioogh0EUdBhwoSJtP7021hl0U2pgZ7PWC5d1PeIazW0f6Pj
         vkWNZj4xqT5JNZsNeuDdIiG5gl2Rqpu61w1oH+ELTAKIMECe+BsexkgRZROUswMutEho
         bnUohZ/EbtbtLUfcw9j3vy6dH0fQ3KKVEA7svmDzmj6ZCuGolMp6WrwInH0oZEF87Nel
         ykaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g0m8c3zD35Rh8jN697QlkJTzBkwPaUq+dtz2zKp3crs=;
        b=0sVE9T3furt8K5RyMFSqj24Wkibyg1aHeG5XkKeqlNsuQ7PAVWd1VJrKJ1hT/ILF6b
         72Tj/oameMeFN7JJv2rvStoXYRYUGcvUP6DMW77h0eaJJVip57t2IaF4Sr28r/OcOFfw
         AErT83QAD2eU77rc+bb607kNFuyk5RpfUEndloqpzgoJDCVctwC6C0obqxsIZ4A95sRv
         4HjGIyG84vxDK4E99v5cB+PVUZ9T/6QEjrlAlkr+RF+F8pIJZl/Ty1Q9XIv+THoDFZAm
         4tNkx3M9NJ0geMBU+Yq1FOJfK0a7+WQlcYImzeLzBT86wS5clTuTXswonKSzfu1da9R8
         n15g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="hA5l/VIc";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z9-20020adfc009000000b002424f522902sor10044721wre.21.2023.01.14.08.13.52
        (Google Transport Security);
        Sat, 14 Jan 2023 08:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="hA5l/VIc";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0m8c3zD35Rh8jN697QlkJTzBkwPaUq+dtz2zKp3crs=;
        b=hA5l/VIc5kFYcTU5FHAD6Lrri3SgZJSs1rmEou4G9Ix/JMbDdWg7+nUYUeDCU0KIaa
         TZs7FQSCpwisYF5JUcQpe2iNUI3p6/WVqDF0qb0x6uuheT812aqSCQqJUue7kFV0mh3b
         ouP7N4u+6I0ZBE/r+LIs8QED2LqpgL6EKti1DRNnKnf4ht+Q8bP+P9NoSPeZnx4solv1
         gQxAmH4CSNBEu9CfktSMQM2Hq8ZwXBzPRFSWpxNKnjxcblcIGhJt9RAEuFv0hCAo5EQs
         Zm3RXEb40USncJWZJ1QgC2xJFpVn/GogMJI8YajD+/zLStsAlHUvX9Wa7RnZT1+KHN2S
         3yNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0m8c3zD35Rh8jN697QlkJTzBkwPaUq+dtz2zKp3crs=;
        b=p1aUOmcUeAdseFJPXqOgXGOXuC8VeguDClqnY6LvN+bIeqvXK/bGqZA79qVvuhFbYC
         cHGUxd93AcCFocW/ZyYbuS99qgvt4/IXKTfL84N+EH1wWPiB1rBRxB/YWkbuibU71o6Z
         hgxJINKui0Cygzi6kapqHFSBTZwcWmPAz2JH6Bdgn9OLnbZT2YfCiCgydZNE9IvftVo5
         RHILXNqtsdSRDOtCJbuNJuUp9U8ooCoDCK15CihNCZbWzTNCpWpBnPDYjti4K8M18+78
         2fHrZDGYsgh99J0wwtCisLs14Zfglv2xK+iYEdlRD/YVmOPHCKpwSrF35Rbf3Nm71aOs
         gzYA==
X-Gm-Message-State: AFqh2kpAoxc+456E3U8Uv6Si8yNn2SoVY1ZTmM0dSwxoT7/D+SdK/BMU
	Fulw89Dh3to6tBlRZVpSvwU=
X-Google-Smtp-Source: AMrXdXseXrRHSgi6URLeHdzyptRQRPQ05+ZH54krfxmH6jMQN9+j5Ut1KN3wNh6/IssroAI385YdnA==
X-Received: by 2002:a5d:4351:0:b0:256:ff7d:2346 with SMTP id u17-20020a5d4351000000b00256ff7d2346mr48748732wrr.51.1673712832115;
        Sat, 14 Jan 2023 08:13:52 -0800 (PST)
Return-Path: <francesco.cagnin@gmail.com>
Received: from omega.lan (194.46.205.77.rev.sfr.net. [77.205.46.194])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6152000000b002425be3c9e2sm21330040wrt.60.2023.01.14.08.13.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Jan 2023 08:13:51 -0800 (PST)
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
Subject: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon hosts
Date: Sat, 14 Jan 2023 17:13:01 +0100
Message-Id: <20230114161302.94595-3-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114161302.94595-1-fcagnin@quarkslab.com>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UJq3NEkzi2oh

From: Francesco Cagnin <fcagnin@quarkslab.com>

Support is added for single-stepping, software breakpoints, hardware
breakpoints and watchpoints. The code has been structured like the KVM
counterpart (and many parts are basically identical).

Guests can be debugged through the gdbstub.

While guest debugging is enabled, the guest can still read and write the
DBG*_EL1 registers but they don't have any effect.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 accel/hvf/hvf-accel-ops.c | 123 ++++++++
 accel/hvf/hvf-all.c       |  24 ++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 631 +++++++++++++++++++++++++++++++++++++-
 6 files changed, 809 insertions(+), 2 deletions(-)

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
index 060aa0ccf4..c63e8da6a5 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -31,6 +31,99 @@
 #include "trace/trace-target_arm_hvf.h"
 #include "migration/vmstate.h"
 
+#include "exec/gdbstub.h"
+
+#define MDSCR_EL1_SS_SHIFT  0
+#define MDSCR_EL1_MDE_SHIFT 15
+
+static bool guest_debug_enabled;
+
+static uint16_t dbgbcr_regs[] = {
+    HV_SYS_REG_DBGBCR0_EL1,
+    HV_SYS_REG_DBGBCR1_EL1,
+    HV_SYS_REG_DBGBCR2_EL1,
+    HV_SYS_REG_DBGBCR3_EL1,
+    HV_SYS_REG_DBGBCR4_EL1,
+    HV_SYS_REG_DBGBCR5_EL1,
+    HV_SYS_REG_DBGBCR6_EL1,
+    HV_SYS_REG_DBGBCR7_EL1,
+    HV_SYS_REG_DBGBCR8_EL1,
+    HV_SYS_REG_DBGBCR9_EL1,
+    HV_SYS_REG_DBGBCR10_EL1,
+    HV_SYS_REG_DBGBCR11_EL1,
+    HV_SYS_REG_DBGBCR12_EL1,
+    HV_SYS_REG_DBGBCR13_EL1,
+    HV_SYS_REG_DBGBCR14_EL1,
+    HV_SYS_REG_DBGBCR15_EL1,
+};
+static uint16_t dbgbvr_regs[] = {
+    HV_SYS_REG_DBGBVR0_EL1,
+    HV_SYS_REG_DBGBVR1_EL1,
+    HV_SYS_REG_DBGBVR2_EL1,
+    HV_SYS_REG_DBGBVR3_EL1,
+    HV_SYS_REG_DBGBVR4_EL1,
+    HV_SYS_REG_DBGBVR5_EL1,
+    HV_SYS_REG_DBGBVR6_EL1,
+    HV_SYS_REG_DBGBVR7_EL1,
+    HV_SYS_REG_DBGBVR8_EL1,
+    HV_SYS_REG_DBGBVR9_EL1,
+    HV_SYS_REG_DBGBVR10_EL1,
+    HV_SYS_REG_DBGBVR11_EL1,
+    HV_SYS_REG_DBGBVR12_EL1,
+    HV_SYS_REG_DBGBVR13_EL1,
+    HV_SYS_REG_DBGBVR14_EL1,
+    HV_SYS_REG_DBGBVR15_EL1,
+};
+static uint16_t dbgwcr_regs[] = {
+    HV_SYS_REG_DBGWCR0_EL1,
+    HV_SYS_REG_DBGWCR1_EL1,
+    HV_SYS_REG_DBGWCR2_EL1,
+    HV_SYS_REG_DBGWCR3_EL1,
+    HV_SYS_REG_DBGWCR4_EL1,
+    HV_SYS_REG_DBGWCR5_EL1,
+    HV_SYS_REG_DBGWCR6_EL1,
+    HV_SYS_REG_DBGWCR7_EL1,
+    HV_SYS_REG_DBGWCR8_EL1,
+    HV_SYS_REG_DBGWCR9_EL1,
+    HV_SYS_REG_DBGWCR10_EL1,
+    HV_SYS_REG_DBGWCR11_EL1,
+    HV_SYS_REG_DBGWCR12_EL1,
+    HV_SYS_REG_DBGWCR13_EL1,
+    HV_SYS_REG_DBGWCR14_EL1,
+    HV_SYS_REG_DBGWCR15_EL1,
+};
+static uint16_t dbgwvr_regs[] = {
+    HV_SYS_REG_DBGWVR0_EL1,
+    HV_SYS_REG_DBGWVR1_EL1,
+    HV_SYS_REG_DBGWVR2_EL1,
+    HV_SYS_REG_DBGWVR3_EL1,
+    HV_SYS_REG_DBGWVR4_EL1,
+    HV_SYS_REG_DBGWVR5_EL1,
+    HV_SYS_REG_DBGWVR6_EL1,
+    HV_SYS_REG_DBGWVR7_EL1,
+    HV_SYS_REG_DBGWVR8_EL1,
+    HV_SYS_REG_DBGWVR9_EL1,
+    HV_SYS_REG_DBGWVR10_EL1,
+    HV_SYS_REG_DBGWVR11_EL1,
+    HV_SYS_REG_DBGWVR12_EL1,
+    HV_SYS_REG_DBGWVR13_EL1,
+    HV_SYS_REG_DBGWVR14_EL1,
+    HV_SYS_REG_DBGWVR15_EL1,
+};
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
+}
+
 #define HVF_SYSREG(crn, crm, op0, op1, op2) \
         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
 #define PL1_WRITE_MASK 0x4
@@ -79,6 +172,71 @@
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
+#define SYSREG_MDSCR_EL1      SYSREG(2, 0, 0, 2, 2)
+#define SYSREG_DBGBVR0_EL1    SYSREG(2, 0, 0, 0, 4)
+#define SYSREG_DBGBCR0_EL1    SYSREG(2, 0, 0, 0, 5)
+#define SYSREG_DBGWVR0_EL1    SYSREG(2, 0, 0, 0, 6)
+#define SYSREG_DBGWCR0_EL1    SYSREG(2, 0, 0, 0, 7)
+#define SYSREG_DBGBVR1_EL1    SYSREG(2, 0, 0, 1, 4)
+#define SYSREG_DBGBCR1_EL1    SYSREG(2, 0, 0, 1, 5)
+#define SYSREG_DBGWVR1_EL1    SYSREG(2, 0, 0, 1, 6)
+#define SYSREG_DBGWCR1_EL1    SYSREG(2, 0, 0, 1, 7)
+#define SYSREG_DBGBVR2_EL1    SYSREG(2, 0, 0, 2, 4)
+#define SYSREG_DBGBCR2_EL1    SYSREG(2, 0, 0, 2, 5)
+#define SYSREG_DBGWVR2_EL1    SYSREG(2, 0, 0, 2, 6)
+#define SYSREG_DBGWCR2_EL1    SYSREG(2, 0, 0, 2, 7)
+#define SYSREG_DBGBVR3_EL1    SYSREG(2, 0, 0, 3, 4)
+#define SYSREG_DBGBCR3_EL1    SYSREG(2, 0, 0, 3, 5)
+#define SYSREG_DBGWVR3_EL1    SYSREG(2, 0, 0, 3, 6)
+#define SYSREG_DBGWCR3_EL1    SYSREG(2, 0, 0, 3, 7)
+#define SYSREG_DBGBVR4_EL1    SYSREG(2, 0, 0, 4, 4)
+#define SYSREG_DBGBCR4_EL1    SYSREG(2, 0, 0, 4, 5)
+#define SYSREG_DBGWVR4_EL1    SYSREG(2, 0, 0, 4, 6)
+#define SYSREG_DBGWCR4_EL1    SYSREG(2, 0, 0, 4, 7)
+#define SYSREG_DBGBVR5_EL1    SYSREG(2, 0, 0, 5, 4)
+#define SYSREG_DBGBCR5_EL1    SYSREG(2, 0, 0, 5, 5)
+#define SYSREG_DBGWVR5_EL1    SYSREG(2, 0, 0, 5, 6)
+#define SYSREG_DBGWCR5_EL1    SYSREG(2, 0, 0, 5, 7)
+#define SYSREG_DBGBVR6_EL1    SYSREG(2, 0, 0, 6, 4)
+#define SYSREG_DBGBCR6_EL1    SYSREG(2, 0, 0, 6, 5)
+#define SYSREG_DBGWVR6_EL1    SYSREG(2, 0, 0, 6, 6)
+#define SYSREG_DBGWCR6_EL1    SYSREG(2, 0, 0, 6, 7)
+#define SYSREG_DBGBVR7_EL1    SYSREG(2, 0, 0, 7, 4)
+#define SYSREG_DBGBCR7_EL1    SYSREG(2, 0, 0, 7, 5)
+#define SYSREG_DBGWVR7_EL1    SYSREG(2, 0, 0, 7, 6)
+#define SYSREG_DBGWCR7_EL1    SYSREG(2, 0, 0, 7, 7)
+#define SYSREG_DBGBVR8_EL1    SYSREG(2, 0, 0, 8, 4)
+#define SYSREG_DBGBCR8_EL1    SYSREG(2, 0, 0, 8, 5)
+#define SYSREG_DBGWVR8_EL1    SYSREG(2, 0, 0, 8, 6)
+#define SYSREG_DBGWCR8_EL1    SYSREG(2, 0, 0, 8, 7)
+#define SYSREG_DBGBVR9_EL1    SYSREG(2, 0, 0, 9, 4)
+#define SYSREG_DBGBCR9_EL1    SYSREG(2, 0, 0, 9, 5)
+#define SYSREG_DBGWVR9_EL1    SYSREG(2, 0, 0, 9, 6)
+#define SYSREG_DBGWCR9_EL1    SYSREG(2, 0, 0, 9, 7)
+#define SYSREG_DBGBVR10_EL1   SYSREG(2, 0, 0, 10, 4)
+#define SYSREG_DBGBCR10_EL1   SYSREG(2, 0, 0, 10, 5)
+#define SYSREG_DBGWVR10_EL1   SYSREG(2, 0, 0, 10, 6)
+#define SYSREG_DBGWCR10_EL1   SYSREG(2, 0, 0, 10, 7)
+#define SYSREG_DBGBVR11_EL1   SYSREG(2, 0, 0, 11, 4)
+#define SYSREG_DBGBCR11_EL1   SYSREG(2, 0, 0, 11, 5)
+#define SYSREG_DBGWVR11_EL1   SYSREG(2, 0, 0, 11, 6)
+#define SYSREG_DBGWCR11_EL1   SYSREG(2, 0, 0, 11, 7)
+#define SYSREG_DBGBVR12_EL1   SYSREG(2, 0, 0, 12, 4)
+#define SYSREG_DBGBCR12_EL1   SYSREG(2, 0, 0, 12, 5)
+#define SYSREG_DBGWVR12_EL1   SYSREG(2, 0, 0, 12, 6)
+#define SYSREG_DBGWCR12_EL1   SYSREG(2, 0, 0, 12, 7)
+#define SYSREG_DBGBVR13_EL1   SYSREG(2, 0, 0, 13, 4)
+#define SYSREG_DBGBCR13_EL1   SYSREG(2, 0, 0, 13, 5)
+#define SYSREG_DBGWVR13_EL1   SYSREG(2, 0, 0, 13, 6)
+#define SYSREG_DBGWCR13_EL1   SYSREG(2, 0, 0, 13, 7)
+#define SYSREG_DBGBVR14_EL1   SYSREG(2, 0, 0, 14, 4)
+#define SYSREG_DBGBCR14_EL1   SYSREG(2, 0, 0, 14, 5)
+#define SYSREG_DBGWVR14_EL1   SYSREG(2, 0, 0, 14, 6)
+#define SYSREG_DBGWCR14_EL1   SYSREG(2, 0, 0, 14, 7)
+#define SYSREG_DBGBVR15_EL1   SYSREG(2, 0, 0, 15, 4)
+#define SYSREG_DBGBCR15_EL1   SYSREG(2, 0, 0, 15, 5)
+#define SYSREG_DBGWVR15_EL1   SYSREG(2, 0, 0, 15, 6)
+#define SYSREG_DBGWCR15_EL1   SYSREG(2, 0, 0, 15, 7)
 
 #define WFX_IS_WFE (1 << 0)
 
@@ -370,6 +528,82 @@ int hvf_get_registers(CPUState *cpu)
             continue;
         }
 
+        if (guest_debug_enabled) {
+            switch (hvf_sreg_match[i].reg) {
+            case HV_SYS_REG_DBGBVR0_EL1:
+            case HV_SYS_REG_DBGBCR0_EL1:
+            case HV_SYS_REG_DBGWVR0_EL1:
+            case HV_SYS_REG_DBGWCR0_EL1:
+            case HV_SYS_REG_DBGBVR1_EL1:
+            case HV_SYS_REG_DBGBCR1_EL1:
+            case HV_SYS_REG_DBGWVR1_EL1:
+            case HV_SYS_REG_DBGWCR1_EL1:
+            case HV_SYS_REG_DBGBVR2_EL1:
+            case HV_SYS_REG_DBGBCR2_EL1:
+            case HV_SYS_REG_DBGWVR2_EL1:
+            case HV_SYS_REG_DBGWCR2_EL1:
+            case HV_SYS_REG_DBGBVR3_EL1:
+            case HV_SYS_REG_DBGBCR3_EL1:
+            case HV_SYS_REG_DBGWVR3_EL1:
+            case HV_SYS_REG_DBGWCR3_EL1:
+            case HV_SYS_REG_DBGBVR4_EL1:
+            case HV_SYS_REG_DBGBCR4_EL1:
+            case HV_SYS_REG_DBGWVR4_EL1:
+            case HV_SYS_REG_DBGWCR4_EL1:
+            case HV_SYS_REG_DBGBVR5_EL1:
+            case HV_SYS_REG_DBGBCR5_EL1:
+            case HV_SYS_REG_DBGWVR5_EL1:
+            case HV_SYS_REG_DBGWCR5_EL1:
+            case HV_SYS_REG_DBGBVR6_EL1:
+            case HV_SYS_REG_DBGBCR6_EL1:
+            case HV_SYS_REG_DBGWVR6_EL1:
+            case HV_SYS_REG_DBGWCR6_EL1:
+            case HV_SYS_REG_DBGBVR7_EL1:
+            case HV_SYS_REG_DBGBCR7_EL1:
+            case HV_SYS_REG_DBGWVR7_EL1:
+            case HV_SYS_REG_DBGWCR7_EL1:
+            case HV_SYS_REG_DBGBVR8_EL1:
+            case HV_SYS_REG_DBGBCR8_EL1:
+            case HV_SYS_REG_DBGWVR8_EL1:
+            case HV_SYS_REG_DBGWCR8_EL1:
+            case HV_SYS_REG_DBGBVR9_EL1:
+            case HV_SYS_REG_DBGBCR9_EL1:
+            case HV_SYS_REG_DBGWVR9_EL1:
+            case HV_SYS_REG_DBGWCR9_EL1:
+            case HV_SYS_REG_DBGBVR10_EL1:
+            case HV_SYS_REG_DBGBCR10_EL1:
+            case HV_SYS_REG_DBGWVR10_EL1:
+            case HV_SYS_REG_DBGWCR10_EL1:
+            case HV_SYS_REG_DBGBVR11_EL1:
+            case HV_SYS_REG_DBGBCR11_EL1:
+            case HV_SYS_REG_DBGWVR11_EL1:
+            case HV_SYS_REG_DBGWCR11_EL1:
+            case HV_SYS_REG_DBGBVR12_EL1:
+            case HV_SYS_REG_DBGBCR12_EL1:
+            case HV_SYS_REG_DBGWVR12_EL1:
+            case HV_SYS_REG_DBGWCR12_EL1:
+            case HV_SYS_REG_DBGBVR13_EL1:
+            case HV_SYS_REG_DBGBCR13_EL1:
+            case HV_SYS_REG_DBGWVR13_EL1:
+            case HV_SYS_REG_DBGWCR13_EL1:
+            case HV_SYS_REG_DBGBVR14_EL1:
+            case HV_SYS_REG_DBGBCR14_EL1:
+            case HV_SYS_REG_DBGWVR14_EL1:
+            case HV_SYS_REG_DBGWCR14_EL1:
+            case HV_SYS_REG_DBGBVR15_EL1:
+            case HV_SYS_REG_DBGBCR15_EL1:
+            case HV_SYS_REG_DBGWVR15_EL1:
+            case HV_SYS_REG_DBGWCR15_EL1: {
+                const ARMCPRegInfo *ri;
+                ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_sreg_match[i].key);
+                val = read_raw_cp_reg(env, ri);
+
+                arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
+                continue;
+            }
+            }
+        }
+
         ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
         assert_hvf_ok(ret);
 
@@ -421,6 +655,76 @@ int hvf_put_registers(CPUState *cpu)
             continue;
         }
 
+        if (guest_debug_enabled) {
+            switch (hvf_sreg_match[i].reg) {
+            case HV_SYS_REG_DBGBVR0_EL1:
+            case HV_SYS_REG_DBGBCR0_EL1:
+            case HV_SYS_REG_DBGWVR0_EL1:
+            case HV_SYS_REG_DBGWCR0_EL1:
+            case HV_SYS_REG_DBGBVR1_EL1:
+            case HV_SYS_REG_DBGBCR1_EL1:
+            case HV_SYS_REG_DBGWVR1_EL1:
+            case HV_SYS_REG_DBGWCR1_EL1:
+            case HV_SYS_REG_DBGBVR2_EL1:
+            case HV_SYS_REG_DBGBCR2_EL1:
+            case HV_SYS_REG_DBGWVR2_EL1:
+            case HV_SYS_REG_DBGWCR2_EL1:
+            case HV_SYS_REG_DBGBVR3_EL1:
+            case HV_SYS_REG_DBGBCR3_EL1:
+            case HV_SYS_REG_DBGWVR3_EL1:
+            case HV_SYS_REG_DBGWCR3_EL1:
+            case HV_SYS_REG_DBGBVR4_EL1:
+            case HV_SYS_REG_DBGBCR4_EL1:
+            case HV_SYS_REG_DBGWVR4_EL1:
+            case HV_SYS_REG_DBGWCR4_EL1:
+            case HV_SYS_REG_DBGBVR5_EL1:
+            case HV_SYS_REG_DBGBCR5_EL1:
+            case HV_SYS_REG_DBGWVR5_EL1:
+            case HV_SYS_REG_DBGWCR5_EL1:
+            case HV_SYS_REG_DBGBVR6_EL1:
+            case HV_SYS_REG_DBGBCR6_EL1:
+            case HV_SYS_REG_DBGWVR6_EL1:
+            case HV_SYS_REG_DBGWCR6_EL1:
+            case HV_SYS_REG_DBGBVR7_EL1:
+            case HV_SYS_REG_DBGBCR7_EL1:
+            case HV_SYS_REG_DBGWVR7_EL1:
+            case HV_SYS_REG_DBGWCR7_EL1:
+            case HV_SYS_REG_DBGBVR8_EL1:
+            case HV_SYS_REG_DBGBCR8_EL1:
+            case HV_SYS_REG_DBGWVR8_EL1:
+            case HV_SYS_REG_DBGWCR8_EL1:
+            case HV_SYS_REG_DBGBVR9_EL1:
+            case HV_SYS_REG_DBGBCR9_EL1:
+            case HV_SYS_REG_DBGWVR9_EL1:
+            case HV_SYS_REG_DBGWCR9_EL1:
+            case HV_SYS_REG_DBGBVR10_EL1:
+            case HV_SYS_REG_DBGBCR10_EL1:
+            case HV_SYS_REG_DBGWVR10_EL1:
+            case HV_SYS_REG_DBGWCR10_EL1:
+            case HV_SYS_REG_DBGBVR11_EL1:
+            case HV_SYS_REG_DBGBCR11_EL1:
+            case HV_SYS_REG_DBGWVR11_EL1:
+            case HV_SYS_REG_DBGWCR11_EL1:
+            case HV_SYS_REG_DBGBVR12_EL1:
+            case HV_SYS_REG_DBGBCR12_EL1:
+            case HV_SYS_REG_DBGWVR12_EL1:
+            case HV_SYS_REG_DBGWCR12_EL1:
+            case HV_SYS_REG_DBGBVR13_EL1:
+            case HV_SYS_REG_DBGBCR13_EL1:
+            case HV_SYS_REG_DBGWVR13_EL1:
+            case HV_SYS_REG_DBGWCR13_EL1:
+            case HV_SYS_REG_DBGBVR14_EL1:
+            case HV_SYS_REG_DBGBCR14_EL1:
+            case HV_SYS_REG_DBGWVR14_EL1:
+            case HV_SYS_REG_DBGWCR14_EL1:
+            case HV_SYS_REG_DBGBVR15_EL1:
+            case HV_SYS_REG_DBGBCR15_EL1:
+            case HV_SYS_REG_DBGWVR15_EL1:
+            case HV_SYS_REG_DBGWCR15_EL1:
+                continue;
+            }
+        }
+
         val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
         ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, val);
         assert_hvf_ok(ret);
@@ -621,6 +925,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               &arm_cpu->isar.id_aa64mmfr0);
     assert_hvf_ok(ret);
 
+    hvf_arm_init_debug(cpu);
+
     return 0;
 }
 
@@ -839,6 +1145,78 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        val = env->cp15.dbgbvr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        val = env->cp15.dbgbcr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        val = env->cp15.dbgwvr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        val = env->cp15.dbgwcr[SYSREG_CRM(reg)];
+        break;
     default:
         if (is_id_sysreg(reg)) {
             /* ID system registers read as RES0 */
@@ -1021,6 +1399,81 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_MDSCR_EL1:
+        env->cp15.mdscr_el1 = val;
+        break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        env->cp15.dbgbvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        env->cp15.dbgbcr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        env->cp15.dbgwvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        env->cp15.dbgwcr[SYSREG_CRM(reg)] = val;
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
@@ -1166,11 +1619,12 @@ int hvf_vcpu_exec(CPUState *cpu)
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
 
@@ -1188,6 +1642,7 @@ int hvf_vcpu_exec(CPUState *cpu)
     uint64_t syndrome = hvf_exit->exception.syndrome;
     uint32_t ec = syn_get_ec(syndrome);
 
+    ret = 0;
     qemu_mutex_lock_iothread();
     switch (exit_reason) {
     case HV_EXIT_REASON_EXCEPTION:
@@ -1207,6 +1662,47 @@ int hvf_vcpu_exec(CPUState *cpu)
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
@@ -1313,7 +1809,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         assert_hvf_ok(r);
     }
 
-    return 0;
+    return ret;
 }
 
 static const VMStateDescription vmstate_hvf_vtimer = {
@@ -1347,3 +1843,134 @@ int hvf_arch_init(void)
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
+void hvf_arch_update_guest_debug(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t r = HV_SUCCESS;
+
+    guest_debug_enabled = cpu->singlestep_enabled ||
+        hvf_sw_breakpoints_active(cpu) ||
+        hvf_arm_hw_debug_active(cpu);
+
+    cpu_synchronize_state(cpu);
+
+    if (cpu->singlestep_enabled) {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
+        pstate_write(env, pstate_read(env) | PSTATE_SS);
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
+    }
+
+    if (hvf_arm_hw_debug_active(cpu)) {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
+
+        int i;
+        for (i = 0; i < cur_hw_bps; i++) {
+            HWBreakpoint *bp = get_hw_bp(i);
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], bp->bcr);
+            assert_hvf_ok(r);
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], bp->bvr);
+            assert_hvf_ok(r);
+        }
+        for (i = 0; i < cur_hw_wps; i++) {
+            HWWatchpoint *bp = get_hw_wp(i);
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], bp->wcr);
+            assert_hvf_ok(r);
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], bp->wvr);
+            assert_hvf_ok(r);
+        }
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
+
+        int i;
+        for (i = 0; i < max_hw_bps; i++) {
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], env->cp15.dbgbcr[i]);
+            assert_hvf_ok(r);
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], env->cp15.dbgbvr[i]);
+            assert_hvf_ok(r);
+        }
+        for (i = 0; i < max_hw_wps; i++) {
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], env->cp15.dbgwcr[i]);
+            assert_hvf_ok(r);
+            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], env->cp15.dbgwvr[i]);
+            assert_hvf_ok(r);
+        }
+    }
+
+    r = hv_vcpu_set_trap_debug_exceptions(cpu->hvf->fd, guest_debug_enabled);
+    assert_hvf_ok(r);
+    r = hv_vcpu_set_trap_debug_reg_accesses(cpu->hvf->fd, guest_debug_enabled);
+    assert_hvf_ok(r);
+}
-- 
2.39.0
