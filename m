Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp98950ejr;
        Thu, 13 Jun 2024 16:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbX3K0Lez23VV12fQ9d4DTt8+7j8D28A4CrgBT3KMnd4Zbn+wFWXBbLQd5V+JyDxFnZGUfpyf443kkNtkCLl4BdxD9eSe/
X-Google-Smtp-Source: AGHT+IF8zKxtf9XZL4l9Teuucuau6qJcDOWRJ2WqT2Ua1+OPtBCM9Zbfm6tioQuiPbYREg6UmTtn
X-Received: by 2002:a5d:510a:0:b0:35f:28e1:5028 with SMTP id ffacd0b85a97d-3607a738142mr649786f8f.15.1718322351228;
        Thu, 13 Jun 2024 16:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322351; cv=none;
        d=google.com; s=arc-20160816;
        b=NoImhLaCWqCc5Gb+k9TrttjF4WQGHMd1bCreXaq+Vq8hov/DvhrRTiD+qMfxDCQywp
         lYezh7yxbkd8xYnsMpHqjv6gPXB5dNLx1/lYSyQwLToIwj+lGDrWcy1gQPM6slbs38hT
         jnPDKG8Pl0O4s/ATgbKgR+bvhPpEUEaLp41xwBWxnuqvEbxx0fsM2ciSmKugpuBENDrC
         0dTNAnDn83fiwWqJA1n1rfwcfBIpbKAOVIvYlQYTsCH/sQk30URxJmsD+9VvonIPb5fV
         hXdeJB/25X00RYAkpfdekPTvkIOUuytCn9MJtvk3s3lrmngGoaVamt2FZsPx3sfq66du
         IzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IdZKtbX7WF49vfYjZQ1imBSmwP6XQElSn/WiMyzw0zU=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=klZpi0ZbUwPfjwjWwdgdwLB+M96eTa/2IFohBWqysf9380tzAkDl+RMC7gfZiW9xNu
         SkThXrVZbVaVgKX3aFufBpmaYaqNMFXLHIdz1LQZnNGSgTP05XN3HxinXaqWYyvUAqeA
         Evkk4C/Fya/mSZ51Sb6Ozmh2zB9m9xlDrO3JaJimzvrha++0PzKGSfaDVwHMA0yoS82k
         3y/xpt82gejRe0QlZElM0muSl0ymtgutz7ySRrVes65mccBfHWBsE6Cf4slunroi3Oun
         siqfMouDQ/ZxtWurqL+ijfvyoJhMCQ2L0uolmmbKSD/eYUL6OSBKWQVSRfEp20+EYg4S
         S3HA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-360750b6778si1424054f8f.126.2024.06.13.16.45.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0fDW2G5tz6K5nF;
	Fri, 14 Jun 2024 07:45:47 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 2F28414065C;
	Fri, 14 Jun 2024 07:45:50 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:45:27 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 21/29] hw/intc/arm-gicv3*: Changes required to (re)init the vCPU register info
Date: Fri, 14 Jun 2024 00:36:31 +0100
Message-ID: <20240613233639.202896-22-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: YzLHQ6mInt+b

vCPU register info needs to be re-initialized each time vCPU is hot-plugged.
This has to be done both for emulation/TCG and KVM case. This is done in
context to the GIC update notification for any vCPU hot-(un)plug events. This
change adds that support and re-factors existing to maximize the code re-use.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/intc/arm_gicv3.c                |   1 +
 hw/intc/arm_gicv3_common.c         |   7 +-
 hw/intc/arm_gicv3_cpuif.c          | 261 +++++++++++++++--------------
 hw/intc/arm_gicv3_kvm.c            |   7 +-
 hw/intc/gicv3_internal.h           |   1 +
 include/hw/intc/arm_gicv3_common.h |   1 +
 6 files changed, 151 insertions(+), 127 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 58e18fff54..2a30625916 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -459,6 +459,7 @@ static void arm_gicv3_class_init(ObjectClass *klass, void *data)
     ARMGICv3Class *agc = ARM_GICV3_CLASS(klass);
 
     agcc->post_load = arm_gicv3_post_load;
+    agcc->init_cpu_reginfo = gicv3_init_cpu_reginfo;
     device_class_set_parent_realize(dc, arm_gic_realize, &agc->parent_realize);
 }
 
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 155342055b..02e68a437e 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -389,10 +389,12 @@ static void arm_gicv3_cpu_update_notifier(Notifier *notifier, void * data)
 {
     GICv3CPUHotplugInfo *gic_info = (GICv3CPUHotplugInfo *)data;
     CPUState *cpu = gic_info->cpu;
+    ARMGICv3CommonClass *c;
     int gic_cpuif_num;
     GICv3State *s;
 
     s = ARM_GICV3_COMMON(gic_info->gic);
+    c = ARM_GICV3_COMMON_GET_CLASS(s);
 
     /* this shall get us mapped gicv3 cpuif corresponding to mpidr */
     gic_cpuif_num = arm_gicv3_get_proc_num(s, cpu);
@@ -412,7 +414,10 @@ static void arm_gicv3_cpu_update_notifier(Notifier *notifier, void * data)
     gicv3_set_gicv3state(cpu, &s->cpu[gic_cpuif_num]);
     gicv3_set_cpustate(&s->cpu[gic_cpuif_num], cpu);
 
-    /* TODO: initialize the registers info for this newly added cpu */
+    /* initialize the registers info for this newly added cpu */
+    if (c->init_cpu_reginfo) {
+        c->init_cpu_reginfo(cpu);
+    }
 }
 
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 2a8aff0b99..1ace0f54d8 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -3033,143 +3033,138 @@ static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
     gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
-void gicv3_init_cpuif(GICv3State *s)
+void gicv3_init_cpu_reginfo(CPUState *cs)
 {
-    /* Called from the GICv3 realize function; register our system
-     * registers with the CPU
-     */
-    int i;
+    ARMCPU *cpu = ARM_CPU(cs);
+    GICv3CPUState *gcs = icc_cs_from_env(&cpu->env);
 
-    for (i = 0; i < s->num_cpu; i++) {
-        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
-        GICv3CPUState *cs = &s->cpu[i];
+    /*
+     * If the CPU doesn't define a GICv3 configuration, probably because
+     * in real hardware it doesn't have one, then we use default values
+     * matching the one used by most Arm CPUs. This applies to:
+     *  cpu->gic_num_lrs
+     *  cpu->gic_vpribits
+     *  cpu->gic_vprebits
+     *  cpu->gic_pribits
+     */
 
-        /*
-         * If the CPU doesn't define a GICv3 configuration, probably because
-         * in real hardware it doesn't have one, then we use default values
-         * matching the one used by most Arm CPUs. This applies to:
-         *  cpu->gic_num_lrs
-         *  cpu->gic_vpribits
-         *  cpu->gic_vprebits
-         *  cpu->gic_pribits
-         */
+    /*
+     * Note that we can't just use the GICv3CPUState as an opaque pointer
+     * in define_arm_cp_regs_with_opaque(), because when we're called back
+     * it might be with code translated by CPU 0 but run by CPU 1, in
+     * which case we'd get the wrong value.
+     * So instead we define the regs with no ri->opaque info, and
+     * get back to the GICv3CPUState from the CPUARMState.
+     *
+     * These CP regs callbacks can be called from either TCG or HVF code.
+     */
+    define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
 
-        /* Note that we can't just use the GICv3CPUState as an opaque pointer
-         * in define_arm_cp_regs_with_opaque(), because when we're called back
-         * it might be with code translated by CPU 0 but run by CPU 1, in
-         * which case we'd get the wrong value.
-         * So instead we define the regs with no ri->opaque info, and
-         * get back to the GICv3CPUState from the CPUARMState.
-         *
-         * These CP regs callbacks can be called from either TCG or HVF code.
-         */
-        define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+    /*
+     * If the CPU implements FEAT_NMI and FEAT_GICv3 it must also
+     * implement FEAT_GICv3_NMI, which is the CPU interface part
+     * of NMI support. This is distinct from whether the GIC proper
+     * (redistributors and distributor) have NMI support. In QEMU
+     * that is a property of the GIC device in s->nmi_support;
+     * cs->nmi_support indicates the CPU interface's support.
+     */
+    if (cpu_isar_feature(aa64_nmi, cpu)) {
+        gcs->nmi_support = true;
+        define_arm_cp_regs(cpu, gicv3_cpuif_gicv3_nmi_reginfo);
+    }
 
-        /*
-         * If the CPU implements FEAT_NMI and FEAT_GICv3 it must also
-         * implement FEAT_GICv3_NMI, which is the CPU interface part
-         * of NMI support. This is distinct from whether the GIC proper
-         * (redistributors and distributor) have NMI support. In QEMU
-         * that is a property of the GIC device in s->nmi_support;
-         * cs->nmi_support indicates the CPU interface's support.
-         */
-        if (cpu_isar_feature(aa64_nmi, cpu)) {
-            cs->nmi_support = true;
-            define_arm_cp_regs(cpu, gicv3_cpuif_gicv3_nmi_reginfo);
-        }
+    /*
+     * The CPU implementation specifies the number of supported
+     * bits of physical priority. For backwards compatibility
+     * of migration, we have a compat property that forces use
+     * of 8 priority bits regardless of what the CPU really has.
+     */
+    if (gcs->gic->force_8bit_prio) {
+        gcs->pribits = 8;
+    } else {
+        gcs->pribits = cpu->gic_pribits ?: 5;
+    }
 
-        /*
-         * The CPU implementation specifies the number of supported
-         * bits of physical priority. For backwards compatibility
-         * of migration, we have a compat property that forces use
-         * of 8 priority bits regardless of what the CPU really has.
-         */
-        if (s->force_8bit_prio) {
-            cs->pribits = 8;
-        } else {
-            cs->pribits = cpu->gic_pribits ?: 5;
-        }
+    /*
+     * The GICv3 has separate ID register fields for virtual priority
+     * and preemption bit values, but only a single ID register field
+     * for the physical priority bits. The preemption bit count is
+     * always the same as the priority bit count, except that 8 bits
+     * of priority means 7 preemption bits. We precalculate the
+     * preemption bits because it simplifies the code and makes the
+     * parallels between the virtual and physical bits of the GIC
+     * a bit clearer.
+     */
+    gcs->prebits = gcs->pribits;
+    if (gcs->prebits == 8) {
+        gcs->prebits--;
+    }
+    /*
+     * Check that CPU code defining pribits didn't violate
+     * architectural constraints our implementation relies on.
+     */
+    g_assert(gcs->pribits >= 4 && gcs->pribits <= 8);
 
-        /*
-         * The GICv3 has separate ID register fields for virtual priority
-         * and preemption bit values, but only a single ID register field
-         * for the physical priority bits. The preemption bit count is
-         * always the same as the priority bit count, except that 8 bits
-         * of priority means 7 preemption bits. We precalculate the
-         * preemption bits because it simplifies the code and makes the
-         * parallels between the virtual and physical bits of the GIC
-         * a bit clearer.
-         */
-        cs->prebits = cs->pribits;
-        if (cs->prebits == 8) {
-            cs->prebits--;
-        }
-        /*
-         * Check that CPU code defining pribits didn't violate
-         * architectural constraints our implementation relies on.
-         */
-        g_assert(cs->pribits >= 4 && cs->pribits <= 8);
+    /*
+     * gicv3_cpuif_reginfo[] defines ICC_AP*R0_EL1; add definitions
+     * for ICC_AP*R{1,2,3}_EL1 if the prebits value requires them.
+     */
+    if (gcs->prebits >= 6) {
+        define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr1_reginfo);
+    }
+    if (gcs->prebits == 7) {
+        define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr23_reginfo);
+    }
 
-        /*
-         * gicv3_cpuif_reginfo[] defines ICC_AP*R0_EL1; add definitions
-         * for ICC_AP*R{1,2,3}_EL1 if the prebits value requires them.
-         */
-        if (cs->prebits >= 6) {
-            define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr1_reginfo);
-        }
-        if (cs->prebits == 7) {
-            define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr23_reginfo);
-        }
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
+        int j;
 
-        if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
-            int j;
+        gcs->num_list_regs = cpu->gic_num_lrs ?: 4;
+        gcs->vpribits = cpu->gic_vpribits ?: 5;
+        gcs->vprebits = cpu->gic_vprebits ?: 5;
 
-            cs->num_list_regs = cpu->gic_num_lrs ?: 4;
-            cs->vpribits = cpu->gic_vpribits ?: 5;
-            cs->vprebits = cpu->gic_vprebits ?: 5;
 
-            /* Check against architectural constraints: getting these
-             * wrong would be a bug in the CPU code defining these,
-             * and the implementation relies on them holding.
-             */
-            g_assert(cs->vprebits <= cs->vpribits);
-            g_assert(cs->vprebits >= 5 && cs->vprebits <= 7);
-            g_assert(cs->vpribits >= 5 && cs->vpribits <= 8);
+        /* Check against architectural constraints: getting these
+         * wrong would be a bug in the CPU code defining these,
+         * and the implementation relies on them holding.
+         */
+        g_assert(gcs->vprebits <= gcs->vpribits);
+        g_assert(gcs->vprebits >= 5 && gcs->vprebits <= 7);
+        g_assert(gcs->vpribits >= 5 && gcs->vpribits <= 8);
 
-            define_arm_cp_regs(cpu, gicv3_cpuif_hcr_reginfo);
+        define_arm_cp_regs(cpu, gicv3_cpuif_hcr_reginfo);
 
-            for (j = 0; j < cs->num_list_regs; j++) {
-                /* Note that the AArch64 LRs are 64-bit; the AArch32 LRs
-                 * are split into two cp15 regs, LR (the low part, with the
-                 * same encoding as the AArch64 LR) and LRC (the high part).
-                 */
-                ARMCPRegInfo lr_regset[] = {
-                    { .name = "ICH_LRn_EL2", .state = ARM_CP_STATE_BOTH,
-                      .opc0 = 3, .opc1 = 4, .crn = 12,
-                      .crm = 12 + (j >> 3), .opc2 = j & 7,
-                      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-                      .nv2_redirect_offset = 0x400 + 8 * j,
-                      .access = PL2_RW,
-                      .readfn = ich_lr_read,
-                      .writefn = ich_lr_write,
-                    },
-                    { .name = "ICH_LRCn_EL2", .state = ARM_CP_STATE_AA32,
-                      .cp = 15, .opc1 = 4, .crn = 12,
-                      .crm = 14 + (j >> 3), .opc2 = j & 7,
-                      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-                      .access = PL2_RW,
-                      .readfn = ich_lr_read,
-                      .writefn = ich_lr_write,
-                    },
-                };
-                define_arm_cp_regs(cpu, lr_regset);
-            }
-            if (cs->vprebits >= 6) {
-                define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr1_reginfo);
-            }
-            if (cs->vprebits == 7) {
-                define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
-            }
+        for (j = 0; j < gcs->num_list_regs; j++) {
+            /* Note that the AArch64 LRs are 64-bit; the AArch32 LRs
+             * are split into two cp15 regs, LR (the low part, with the
+             * same encoding as the AArch64 LR) and LRC (the high part).
+             */
+            ARMCPRegInfo lr_regset[] = {
+                { .name = "ICH_LRn_EL2", .state = ARM_CP_STATE_BOTH,
+                  .opc0 = 3, .opc1 = 4, .crn = 12,
+                  .crm = 12 + (j >> 3), .opc2 = j & 7,
+                  .type = ARM_CP_IO | ARM_CP_NO_RAW,
+                  .nv2_redirect_offset = 0x400 + 8 * j,
+                  .access = PL2_RW,
+                  .readfn = ich_lr_read,
+                  .writefn = ich_lr_write,
+                },
+                { .name = "ICH_LRCn_EL2", .state = ARM_CP_STATE_AA32,
+                  .cp = 15, .opc1 = 4, .crn = 12,
+                  .crm = 14 + (j >> 3), .opc2 = j & 7,
+                  .type = ARM_CP_IO | ARM_CP_NO_RAW,
+                  .access = PL2_RW,
+                  .readfn = ich_lr_read,
+                  .writefn = ich_lr_write,
+                },
+            };
+            define_arm_cp_regs(cpu, lr_regset);
+        }
+        if (gcs->vprebits >= 6) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr1_reginfo);
+        }
+        if (gcs->vprebits == 7) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
         }
         if (tcg_enabled() || qtest_enabled()) {
             /*
@@ -3177,10 +3172,26 @@ void gicv3_init_cpuif(GICv3State *s)
              * state only changes on EL changes involving EL2 or EL3, so for
              * the non-TCG case this is OK, as EL2 and EL3 can't exist.
              */
-            arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+            arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, gcs);
         } else {
             assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
             assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));
         }
     }
 }
+
+void gicv3_init_cpuif(GICv3State *s)
+{
+    /* Called from the GICv3 realize function; register our system
+     * registers with the CPU
+     */
+    int i;
+
+    for (i = 0; i < s->num_cpu; i++) {
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
+
+        if (qemu_enabled_cpu(CPU(cpu))) {
+            gicv3_init_cpu_reginfo(CPU(cpu));
+        }
+    }
+}
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 8dbbd79e1b..1c8e880117 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -804,6 +804,10 @@ static void vm_change_state_handler(void *opaque, bool running,
     }
 }
 
+static void kvm_gicv3_init_cpu_reginfo(CPUState *cs)
+{
+    define_arm_cp_regs(ARM_CPU(cs), gicv3_cpuif_reginfo);
+}
 
 static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
@@ -842,7 +846,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->num_cpu; i++) {
         CPUState *cs = qemu_get_cpu(i);
         if (qemu_enabled_cpu(cs)) {
-            define_arm_cp_regs(ARM_CPU(cs), gicv3_cpuif_reginfo);
+            kvm_gicv3_init_cpu_reginfo(cs);
         }
     }
 
@@ -930,6 +934,7 @@ static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
 
     agcc->pre_save = kvm_arm_gicv3_get;
     agcc->post_load = kvm_arm_gicv3_put;
+    agcc->init_cpu_reginfo = kvm_gicv3_init_cpu_reginfo;
     device_class_set_parent_realize(dc, kvm_arm_gicv3_realize,
                                     &kgc->parent_realize);
     resettable_class_set_parent_phases(rc, NULL, kvm_arm_gicv3_reset_hold, NULL,
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 42441c19c6..e568eef57f 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -722,6 +722,7 @@ void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr);
 
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
+void gicv3_init_cpu_reginfo(CPUState *cs);
 
 /**
  * gicv3_cpuif_update:
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 496b198016..b63abeae82 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -339,6 +339,7 @@ struct ARMGICv3CommonClass {
 
     void (*pre_save)(GICv3State *s);
     void (*post_load)(GICv3State *s);
+    void (*init_cpu_reginfo)(CPUState *cs);
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-- 
2.34.1
