Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp984373ejc;
        Tue, 26 Sep 2023 03:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlsoff/sjk6NJKJ6okMwb9cuU34vYn5lFUlG1f/fLYVjHAJNomY0uYliCFUDcE0ysLQcZN
X-Received: by 2002:a5d:4983:0:b0:317:618a:c72 with SMTP id r3-20020a5d4983000000b00317618a0c72mr8368447wrq.64.1695723246087;
        Tue, 26 Sep 2023 03:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723246; cv=none;
        d=google.com; s=arc-20160816;
        b=Jx/D0WayPDvsLLGtGOfyLJ1be1zkRhEa6VXKnX82Gw3nANCKkeZPkCSJGnY6n75v7l
         h5LiNKA1yeQ2XDlhyNhhYqsxeWOHA75K4eZh9D1dg4GhqK1EppeGS58vTPumKhQLXWNZ
         BXBGXF/5vsqV1RHi37QbFaIs7+fJwz0IVW1N8/UBOG199g6rHNJZc9WbW7rkUfXupL4T
         Sj/+rKcJZ4zFveicqfS9ZfPBgbMQlE73sZ30hoOwL5bIFZurWV1GCqgvJ0PP53tdPsl4
         pX3GB6VW7lHrVtHL6Fl4ferUryqaq7lBJWa28jGMRHVv5nBYn2O5vmuudApn83F03k7s
         P8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=kR+b7m30fvqKR6lnGSo94tR/GiekmvMV/rooL/oKRMI=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=udLWP+QAZtiS3Vo4Qkb9VLjuvW3jkTrFQajUZ9nni+Yko/GGE60Tkg17kWf90d69xR
         vZ5e/Z0FWcaR6rttO3BJM0AwQID0PKBaxHsd8zcZiX7CO4JxtyOCaK+0AapUxdUZxoRv
         2MnLX+flMHB+pz2oxnlfn+xX8z3ivk05Y+K/m48liJg1dj0ySDIGcBDmkjBBwHQI1KTg
         0lT2CnhNGNytn0GBg0hy1F3W7HCvo3nvnQdPTtkUokHU0CWWCc4M3vJppFfoc4uQj0xx
         OB8xNLXmyXFkI531IyAvEZjwjoBAc7RxG6ngQ9FEYWlFBfc0UtEVFT37xtFdjF70qf9n
         eN9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id s2-20020adff802000000b0031f8b86c842si6087067wrp.1049.2023.09.26.03.14.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwSd5v0qz6J6Lm;
	Tue, 26 Sep 2023 18:09:05 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:13:46 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 28/37] hw/intc/arm-gicv3*: Changes required to (re)init the vCPU register info
Date: Tue, 26 Sep 2023 11:04:27 +0100
Message-ID: <20230926100436.28284-29-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: kCdHwRrIMGmx

vCPU register info needs to be re-initialized each time vCPU is hot-plugged.
This has to be done both for emulation/TCG and KVM case. This is done in
context to the GIC update notification for any vCPU hot-(un)plug events. This
change adds that support and re-factors existing to maximize the code re-use.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/intc/arm_gicv3.c                |   1 +
 hw/intc/arm_gicv3_common.c         |   7 +-
 hw/intc/arm_gicv3_cpuif.c          | 257 +++++++++++++++--------------
 hw/intc/arm_gicv3_kvm.c            |   7 +-
 hw/intc/gicv3_internal.h           |   1 +
 include/hw/intc/arm_gicv3_common.h |   1 +
 6 files changed, 150 insertions(+), 124 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 0b8f79a122..e1c7c8c4bc 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -410,6 +410,7 @@ static void arm_gicv3_class_init(ObjectClass *klass, void *data)
     ARMGICv3Class *agc = ARM_GICV3_CLASS(klass);
 
     agcc->post_load = arm_gicv3_post_load;
+    agcc->init_cpu_reginfo = gicv3_init_cpu_reginfo;
     device_class_set_parent_realize(dc, arm_gic_realize, &agc->parent_realize);
 }
 
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index fc87fa9369..d051024a30 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -345,10 +345,12 @@ static void arm_gicv3_cpu_update_notifier(Notifier *notifier, void * data)
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
@@ -368,7 +370,10 @@ static void arm_gicv3_cpu_update_notifier(Notifier *notifier, void * data)
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
index 7b7a0fdb9c..70fc2cc858 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2782,6 +2782,127 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
     },
 };
 
+void gicv3_init_cpu_reginfo(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GICv3CPUState *gcs = icc_cs_from_env(&cpu->env);
+
+    /*
+     * If the CPU doesn't define a GICv3 configuration, probably because
+     * in real hardware it doesn't have one, then we use default values
+     * matching the one used by most Arm CPUs. This applies to:
+     *  cpu->gic_num_lrs
+     *  cpu->gic_vpribits
+     *  cpu->gic_vprebits
+     *  cpu->gic_pribits
+     */
+
+    /*
+     * Note that we can't just use the GICv3CPUState as an opaque pointer
+     * in define_arm_cp_regs_with_opaque(), because when we're called back
+     * it might be with code translated by CPU 0 but run by CPU 1, in
+     * which case we'd get the wrong value.
+     * So instead we define the regs with no ri->opaque info, and
+     * get back to the GICv3CPUState from the CPUARMState.
+     */
+    define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+
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
+
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
+
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
+
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
+        int j;
+
+        gcs->num_list_regs = cpu->gic_num_lrs ?: 4;
+        gcs->vpribits = cpu->gic_vpribits ?: 5;
+        gcs->vprebits = cpu->gic_vprebits ?: 5;
+
+        /*
+         * Check against architectural constraints: getting these
+         * wrong would be a bug in the CPU code defining these,
+         * and the implementation relies on them holding.
+         */
+        g_assert(gcs->vprebits <= gcs->vpribits);
+        g_assert(gcs->vprebits >= 5 && gcs->vprebits <= 7);
+        g_assert(gcs->vpribits >= 5 && gcs->vpribits <= 8);
+
+        define_arm_cp_regs(cpu, gicv3_cpuif_hcr_reginfo);
+
+        for (j = 0; j < gcs->num_list_regs; j++) {
+            /*
+             * Note that the AArch64 LRs are 64-bit; the AArch32 LRs
+             * are split into two cp15 regs, LR (the low part, with the
+             * same encoding as the AArch64 LR) and LRC (the high part).
+             */
+            ARMCPRegInfo lr_regset[] = {
+                { .name = "ICH_LRn_EL2", .state = ARM_CP_STATE_BOTH,
+                  .opc0 = 3, .opc1 = 4, .crn = 12,
+                  .crm = 12 + (j >> 3), .opc2 = j & 7,
+                  .type = ARM_CP_IO | ARM_CP_NO_RAW,
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
+        }
+    }
+}
+
 static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
 {
     GICv3CPUState *cs = opaque;
@@ -2804,131 +2925,23 @@ void gicv3_init_cpuif(GICv3State *s)
 
     for (i = 0; i < s->num_cpu; i++) {
         ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
-        GICv3CPUState *cs = &s->cpu[i];
-
-        /*
-         * If the CPU doesn't define a GICv3 configuration, probably because
-         * in real hardware it doesn't have one, then we use default values
-         * matching the one used by most Arm CPUs. This applies to:
-         *  cpu->gic_num_lrs
-         *  cpu->gic_vpribits
-         *  cpu->gic_vprebits
-         *  cpu->gic_pribits
-         */
-
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
-
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
-
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
-
-        if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
-            int j;
-
-            cs->num_list_regs = cpu->gic_num_lrs ?: 4;
-            cs->vpribits = cpu->gic_vpribits ?: 5;
-            cs->vprebits = cpu->gic_vprebits ?: 5;
-
-            /* Check against architectural constraints: getting these
-             * wrong would be a bug in the CPU code defining these,
-             * and the implementation relies on them holding.
-             */
-            g_assert(cs->vprebits <= cs->vpribits);
-            g_assert(cs->vprebits >= 5 && cs->vprebits <= 7);
-            g_assert(cs->vpribits >= 5 && cs->vpribits <= 8);
-
-            define_arm_cp_regs(cpu, gicv3_cpuif_hcr_reginfo);
-
-            for (j = 0; j < cs->num_list_regs; j++) {
-                /* Note that the AArch64 LRs are 64-bit; the AArch32 LRs
-                 * are split into two cp15 regs, LR (the low part, with the
-                 * same encoding as the AArch64 LR) and LRC (the high part).
+        if (qemu_enabled_cpu(CPU(cpu))) {
+            GICv3CPUState *cs = icc_cs_from_env(&cpu->env);
+            gicv3_init_cpu_reginfo(CPU(cpu));
+            if (tcg_enabled() || qtest_enabled()) {
+                /*
+                 * We can only trap EL changes with TCG. However the GIC
+                 * interrupt state only changes on EL changes involving EL2 or
+                 * EL3, so for the non-TCG case this is OK, as EL2 and EL3 can't
+                 * exist.
                  */
-                ARMCPRegInfo lr_regset[] = {
-                    { .name = "ICH_LRn_EL2", .state = ARM_CP_STATE_BOTH,
-                      .opc0 = 3, .opc1 = 4, .crn = 12,
-                      .crm = 12 + (j >> 3), .opc2 = j & 7,
-                      .type = ARM_CP_IO | ARM_CP_NO_RAW,
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
+                arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook,
+                                            cs);
+            } else {
+                assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
+                assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));
             }
         }
-        if (tcg_enabled() || qtest_enabled()) {
-            /*
-             * We can only trap EL changes with TCG. However the GIC interrupt
-             * state only changes on EL changes involving EL2 or EL3, so for
-             * the non-TCG case this is OK, as EL2 and EL3 can't exist.
-             */
-            arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
-        } else {
-            assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
-            assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));
-        }
     }
 }
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index b6f50caf84..67985e4a21 100644
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
@@ -837,7 +841,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->num_cpu; i++) {
         CPUState *cs = qemu_get_cpu(i);
         if (qemu_enabled_cpu(cs)) {
-            define_arm_cp_regs(ARM_CPU(cs), gicv3_cpuif_reginfo);
+            kvm_gicv3_init_cpu_reginfo(cs);
         }
     }
 
@@ -926,6 +930,7 @@ static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
 
     agcc->pre_save = kvm_arm_gicv3_get;
     agcc->post_load = kvm_arm_gicv3_put;
+    agcc->init_cpu_reginfo = kvm_gicv3_init_cpu_reginfo;
     device_class_set_parent_realize(dc, kvm_arm_gicv3_realize,
                                     &kgc->parent_realize);
     resettable_class_set_parent_phases(rc, NULL, kvm_arm_gicv3_reset_hold, NULL,
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 9d4c1209bd..0bed0f6e2a 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -709,6 +709,7 @@ void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr);
 
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
+void gicv3_init_cpu_reginfo(CPUState *cs);
 
 /**
  * gicv3_cpuif_update:
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 97a48f44b9..b5f8ba17ff 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -325,6 +325,7 @@ struct ARMGICv3CommonClass {
 
     void (*pre_save)(GICv3State *s);
     void (*post_load)(GICv3State *s);
+    void (*init_cpu_reginfo)(CPUState *cs);
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-- 
2.34.1
