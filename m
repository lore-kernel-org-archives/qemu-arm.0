Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1262895lfp;
        Thu, 16 Sep 2021 09:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq5OM4BI9lW8Vjtma0GAIJJga6qzIRvutecuFYxT9dcPK7z905x4HGoNzYaWOn064VdlN9
X-Received: by 2002:a05:6102:3bcb:: with SMTP id a11mr4298739vsv.7.1631808479081;
        Thu, 16 Sep 2021 09:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631808479; cv=none;
        d=google.com; s=arc-20160816;
        b=fuHxl5KW7OVAQpEOSKE7wNiymPE1fuzj9o8xsjI0+Cu5TAIpr/K9ZAuxRwDp8hfZ2+
         iW1ckL4t81Kkmbu1AOP2Eny/rupx9Z2SVQrra5F86NJY2J4ywXlgDcrn6eXyx0nWSDVR
         VcZTELOC1r79n53A8GAxJNjZqj2SB6Z8IC98S9i/8+VGQtyMDAT6iHO7odzjEx3Xr0U9
         amW3MilOzPgxZ9xaYPx50llzP5BB2KrG5PEIKn/ONBOxRaL0AEylxpqY4owepKcLXXjh
         BetmCEa2PSZ3HEF/1Q+GTtXgNxR7XyPvnceXN3keGdizE5Vaz74xtgVC5AwJYDB09KA6
         hSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=vm8ARqa14xPnWw5j5gC5b+Yxwq4Uf2/k6LGXE+cETmQ=;
        b=mdYw7G3r4LKGHfQWaunAnpEa9+bIWaG0xlhJOizfY4r9WrdrGXRj4dKnVr3dxbv04V
         VN+ZpZGpQNI3ll2m/siFurFYwAzNDWnklk8pF0RMMVr2Gu3ig5ROEKeMKRdZIMK7zPIZ
         JCt1OhYyb6hGT+McmTuPd0ntS+6YQRON47YQq9FnPS6DBs/BC0HSSSbUbjn74Q7QMQLN
         sVURVIyvu2uEZme1AVe8tuZHYOp90sQCFldLrkJBNmwmBZlMcvDmVAzgg4zsEMKfK0nu
         15lGs+lCWVtHe47P/SpG0DWDYW0+cq5lF0zQdFlfx/JFMB/0bjJxk5R5htw/SH0ujI+K
         9VVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si1728309vsh.125.2021.09.16.09.07.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQtva-0006d5-AJ
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiR-00038Q-4t; Thu, 16 Sep 2021 11:54:23 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51374 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiH-00058I-Ji; Thu, 16 Sep 2021 11:54:22 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id D011360806CD;
 Thu, 16 Sep 2021 17:54:08 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 06/10] hvf: arm: Implement -cpu host
Date: Thu, 16 Sep 2021 17:54:00 +0200
Message-Id: <20210916155404.86958-7-agraf@csgraf.de>
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
X-TUID: InkjQozi6YUT

Now that we have working system register sync, we push more target CPU
properties into the virtual machine. That might be useful in some
situations, but is not the typical case that users want.

So let's add a -cpu host option that allows them to explicitly pass all
CPU capabilities of their host CPU into the guest.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v6 -> v7:

  - Move function define to own header
  - Do not propagate SVE features for HVF
  - Remove stray whitespace change
  - Verify that EL0 and EL1 do not allow AArch32 mode
  - Only probe host CPU features once

v8 -> v9:

  - Zero-initialize host_isar
  - Use M1 SCTLR reset value

v9 -> v10:

  - Fail -cpu host class creation gracefully
  - Adjust error message on -cpu host realize failure
  - Extend SCTLR comment that hvf returns 0 as default value
  - Return true/false
  - Report errors lazily

v11 -> v12:

  - Improve SPAN comment
---
 target/arm/cpu.c     | 13 ++++--
 target/arm/cpu.h     |  2 +
 target/arm/hvf/hvf.c | 95 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/hvf_arm.h | 19 +++++++++
 target/arm/kvm_arm.h |  2 -
 5 files changed, 125 insertions(+), 6 deletions(-)
 create mode 100644 target/arm/hvf_arm.h

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ba0741b20e..016df2e1e7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,6 +39,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
+#include "hvf_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 
@@ -1400,8 +1401,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM");
+        if (!kvm_enabled() && !hvf_enabled()) {
+            error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
         } else {
             error_setg(errp, "Failed to retrieve host CPU features");
         }
@@ -2061,15 +2062,19 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-#ifdef CONFIG_KVM
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
 static void arm_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
+#ifdef CONFIG_KVM
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
     }
+#else
+    hvf_arm_set_cpu_features_from_host(cpu);
+#endif
     arm_cpu_post_init(obj);
 }
 
@@ -2129,7 +2134,7 @@ static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
 
-#ifdef CONFIG_KVM
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     type_register_static(&host_arm_cpu_type_info);
 #endif
 }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 09d9027734..3ed03391a8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3015,6 +3015,8 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
+#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
+
 #define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 110a9d547d..51b7250612 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -17,6 +17,7 @@
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
 #include "sysemu/hw_accel.h"
+#include "hvf_arm.h"
 
 #include <mach/mach_time.h>
 
@@ -54,6 +55,16 @@ typedef struct HVFVTimer {
 
 static HVFVTimer vtimer;
 
+typedef struct ARMHostCPUFeatures {
+    ARMISARegisters isar;
+    uint64_t features;
+    uint64_t midr;
+    uint32_t reset_sctlr;
+    const char *dtb_compatible;
+} ARMHostCPUFeatures;
+
+static ARMHostCPUFeatures arm_host_cpu_features;
+
 struct hvf_reg_match {
     int reg;
     uint64_t offset;
@@ -416,6 +427,90 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
     return val;
 }
 
+static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
+{
+    ARMISARegisters host_isar = {};
+    const struct isar_regs {
+        int reg;
+        uint64_t *val;
+    } regs[] = {
+        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
+        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
+        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
+        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
+        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
+        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
+        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
+        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
+    };
+    hv_vcpu_t fd;
+    hv_return_t r = HV_SUCCESS;
+    hv_vcpu_exit_t *exit;
+    int i;
+
+    ahcf->dtb_compatible = "arm,arm-v8";
+    ahcf->features = (1ULL << ARM_FEATURE_V8) |
+                     (1ULL << ARM_FEATURE_NEON) |
+                     (1ULL << ARM_FEATURE_AARCH64) |
+                     (1ULL << ARM_FEATURE_PMU) |
+                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
+
+    /* We set up a small vcpu to extract host registers */
+
+    if (hv_vcpu_create(&fd, &exit, NULL) != HV_SUCCESS) {
+        return false;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(regs); i++) {
+        r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val);
+    }
+    r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr);
+    r |= hv_vcpu_destroy(fd);
+
+    ahcf->isar = host_isar;
+
+    /*
+     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
+     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
+     */
+    ahcf->reset_sctlr = 0x30100180;
+    /*
+     * SPAN is disabled by default when SCTLR.SPAN=1. To improve compatibility,
+     * let's disable it on boot and then allow guest software to turn it on by
+     * setting it to 0.
+     */
+    ahcf->reset_sctlr |= 0x00800000;
+
+    /* Make sure we don't advertise AArch32 support for EL0/EL1 */
+    if ((host_isar.id_aa64pfr0 & 0xff) != 0x11) {
+        return false;
+    }
+
+    return r == HV_SUCCESS;
+}
+
+void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    if (!arm_host_cpu_features.dtb_compatible) {
+        if (!hvf_enabled() ||
+            !hvf_arm_get_host_cpu_features(&arm_host_cpu_features)) {
+            /*
+             * We can't report this error yet, so flag that we need to
+             * in arm_cpu_realizefn().
+             */
+            cpu->host_cpu_probe_failed = true;
+            return;
+        }
+    }
+
+    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
+    cpu->isar = arm_host_cpu_features.isar;
+    cpu->env.features = arm_host_cpu_features.features;
+    cpu->midr = arm_host_cpu_features.midr;
+    cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
+}
+
 void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
 }
diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
new file mode 100644
index 0000000000..603074a331
--- /dev/null
+++ b/target/arm/hvf_arm.h
@@ -0,0 +1,19 @@
+/*
+ * QEMU Hypervisor.framework (HVF) support -- ARM specifics
+ *
+ * Copyright (c) 2021 Alexander Graf
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_HVF_ARM_H
+#define QEMU_HVF_ARM_H
+
+#include "qemu/accel.h"
+#include "cpu.h"
+
+void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
+
+#endif
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 0613454975..b7f78b5215 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -214,8 +214,6 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
  */
 void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
 
-#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
-
 /**
  * ARMHostCPUFeatures: information about the host CPU (identified
  * by asking the host kernel)
-- 
2.30.1 (Apple Git-130)

