Received: by 10.25.205.13 with SMTP id d13csp1289799lfg;
        Mon, 16 Jan 2017 01:29:41 -0800 (PST)
X-Received: by 10.200.43.149 with SMTP id m21mr28056817qtm.213.1484558981078;
        Mon, 16 Jan 2017 01:29:41 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id k49si13857339qtf.246.2017.01.16.01.29.40;
        Mon, 16 Jan 2017 01:29:41 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id AEE6A40670;
	Mon, 16 Jan 2017 04:27:49 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6boTGJfGGCF; Mon, 16 Jan 2017 04:27:46 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BBA734019C;
	Mon, 16 Jan 2017 04:27:46 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 62977400E9
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:27:45 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCQGEInm8JvI for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:27:40 -0500 (EST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id E545840664
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:27:21 -0500 (EST)
Received: from 172.24.1.136 (EHLO szxeml426-hub.china.huawei.com)
 ([172.24.1.136])
 by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DXW50574; Mon, 16 Jan 2017 17:28:10 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:28:00 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH RFC 3/6] arm: kvm64: Check if kvm supports cross type vCPU
Date: Mon, 16 Jan 2017 17:26:58 +0800
Message-ID: <1484558821-15512-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020202.587C9234.0286, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 71191e536b4cceb22c86fc0ed779a1e8
Cc: qemu-devel@nongnu.org, wu.wubin@huawei.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Jv3aBtImmOkE

From: Shannon Zhao <shannon.zhao@linaro.org>

If user requests a specific type vCPU which is not same with the
physical ones and if kvm supports cross type vCPU, we set the
KVM_ARM_VCPU_CROSS bit and set the CPU ID registers.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 target/arm/kvm64.c | 182 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 6111109..70442ea 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -481,7 +481,151 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
     return true;
 }
 
+#define ARM_CPU_ID_MIDR        3, 0, 0, 0, 0
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
+/* ID group 1 registers */
+#define ARM_CPU_ID_REVIDR      3, 0, 0, 0, 6
+#define ARM_CPU_ID_AIDR        3, 1, 0, 0, 7
+
+/* ID group 2 registers */
+#define ARM_CPU_ID_CCSIDR      3, 1, 0, 0, 0
+#define ARM_CPU_ID_CLIDR       3, 1, 0, 0, 1
+#define ARM_CPU_ID_CSSELR      3, 2, 0, 0, 0
+#define ARM_CPU_ID_CTR         3, 3, 0, 0, 1
+
+/* ID group 3 registers */
+#define ARM_CPU_ID_PFR0        3, 0, 0, 1, 0
+#define ARM_CPU_ID_PFR1        3, 0, 0, 1, 1
+#define ARM_CPU_ID_DFR0        3, 0, 0, 1, 2
+#define ARM_CPU_ID_AFR0        3, 0, 0, 1, 3
+#define ARM_CPU_ID_MMFR0       3, 0, 0, 1, 4
+#define ARM_CPU_ID_MMFR1       3, 0, 0, 1, 5
+#define ARM_CPU_ID_MMFR2       3, 0, 0, 1, 6
+#define ARM_CPU_ID_MMFR3       3, 0, 0, 1, 7
+#define ARM_CPU_ID_ISAR0       3, 0, 0, 2, 0
+#define ARM_CPU_ID_ISAR1       3, 0, 0, 2, 1
+#define ARM_CPU_ID_ISAR2       3, 0, 0, 2, 2
+#define ARM_CPU_ID_ISAR3       3, 0, 0, 2, 3
+#define ARM_CPU_ID_ISAR4       3, 0, 0, 2, 4
+#define ARM_CPU_ID_ISAR5       3, 0, 0, 2, 5
+#define ARM_CPU_ID_MMFR4       3, 0, 0, 2, 6
+#define ARM_CPU_ID_MVFR0       3, 0, 0, 3, 0
+#define ARM_CPU_ID_MVFR1       3, 0, 0, 3, 1
+#define ARM_CPU_ID_MVFR2       3, 0, 0, 3, 2
+#define ARM_CPU_ID_AA64PFR0    3, 0, 0, 4, 0
+#define ARM_CPU_ID_AA64PFR1    3, 0, 0, 4, 1
+#define ARM_CPU_ID_AA64DFR0    3, 0, 0, 5, 0
+#define ARM_CPU_ID_AA64DFR1    3, 0, 0, 5, 1
+#define ARM_CPU_ID_AA64AFR0    3, 0, 0, 5, 4
+#define ARM_CPU_ID_AA64AFR1    3, 0, 0, 5, 5
+#define ARM_CPU_ID_AA64ISAR0   3, 0, 0, 6, 0
+#define ARM_CPU_ID_AA64ISAR1   3, 0, 0, 6, 1
+#define ARM_CPU_ID_AA64MMFR0   3, 0, 0, 7, 0
+#define ARM_CPU_ID_AA64MMFR1   3, 0, 0, 7, 1
+#define ARM_CPU_ID_MAX         36
+
+static int kvm_arm_set_id_registers(CPUState *cs)
+{
+    int ret = 0;
+    uint32_t i;
+    ARMCPU *cpu = ARM_CPU(cs);
+    struct kvm_one_reg id_regitsers[ARM_CPU_ID_MAX];
+
+    memset(id_regitsers, 0, ARM_CPU_ID_MAX * sizeof(struct kvm_one_reg));
+
+    id_regitsers[0].id = ARM64_SYS_REG(ARM_CPU_ID_MIDR);
+    id_regitsers[0].addr = (uintptr_t)&cpu->midr;
+
+    id_regitsers[1].id = ARM64_SYS_REG(ARM_CPU_ID_REVIDR);
+    id_regitsers[1].addr = (uintptr_t)&cpu->revidr;
+
+    id_regitsers[2].id = ARM64_SYS_REG(ARM_CPU_ID_MVFR0);
+    id_regitsers[2].addr = (uintptr_t)&cpu->mvfr0;
+
+    id_regitsers[3].id = ARM64_SYS_REG(ARM_CPU_ID_MVFR1);
+    id_regitsers[3].addr = (uintptr_t)&cpu->mvfr1;
+
+    id_regitsers[4].id = ARM64_SYS_REG(ARM_CPU_ID_MVFR2);
+    id_regitsers[4].addr = (uintptr_t)&cpu->mvfr2;
+
+    id_regitsers[5].id = ARM64_SYS_REG(ARM_CPU_ID_PFR0);
+    id_regitsers[5].addr = (uintptr_t)&cpu->id_pfr0;
+
+    id_regitsers[6].id = ARM64_SYS_REG(ARM_CPU_ID_PFR1);
+    id_regitsers[6].addr = (uintptr_t)&cpu->id_pfr1;
+
+    id_regitsers[7].id = ARM64_SYS_REG(ARM_CPU_ID_DFR0);
+    id_regitsers[7].addr = (uintptr_t)&cpu->id_dfr0;
+
+    id_regitsers[8].id = ARM64_SYS_REG(ARM_CPU_ID_AFR0);
+    id_regitsers[8].addr = (uintptr_t)&cpu->id_afr0;
+
+    id_regitsers[9].id = ARM64_SYS_REG(ARM_CPU_ID_MMFR0);
+    id_regitsers[9].addr = (uintptr_t)&cpu->id_mmfr0;
+
+    id_regitsers[10].id = ARM64_SYS_REG(ARM_CPU_ID_MMFR1);
+    id_regitsers[10].addr = (uintptr_t)&cpu->id_mmfr1;
+
+    id_regitsers[11].id = ARM64_SYS_REG(ARM_CPU_ID_MMFR2);
+    id_regitsers[11].addr = (uintptr_t)&cpu->id_mmfr2;
+
+    id_regitsers[12].id = ARM64_SYS_REG(ARM_CPU_ID_MMFR3);
+    id_regitsers[12].addr = (uintptr_t)&cpu->id_mmfr3;
+
+    id_regitsers[13].id = ARM64_SYS_REG(ARM_CPU_ID_ISAR0);
+    id_regitsers[13].addr = (uintptr_t)&cpu->id_isar0;
+
+    id_regitsers[14].id = ARM64_SYS_REG(ARM_CPU_ID_ISAR1);
+    id_regitsers[14].addr = (uintptr_t)&cpu->id_isar1;
+
+    id_regitsers[15].id = ARM64_SYS_REG(ARM_CPU_ID_ISAR2);
+    id_regitsers[15].addr = (uintptr_t)&cpu->id_isar2;
+
+    id_regitsers[16].id = ARM64_SYS_REG(ARM_CPU_ID_ISAR3);
+    id_regitsers[16].addr = (uintptr_t)&cpu->id_isar3;
+
+    id_regitsers[17].id = ARM64_SYS_REG(ARM_CPU_ID_ISAR4);
+    id_regitsers[17].addr = (uintptr_t)&cpu->id_isar4;
+
+    id_regitsers[18].id = ARM64_SYS_REG(ARM_CPU_ID_ISAR5);
+    id_regitsers[18].addr = (uintptr_t)&cpu->id_isar5;
+
+    id_regitsers[19].id = ARM64_SYS_REG(ARM_CPU_ID_AA64PFR0);
+    id_regitsers[19].addr = (uintptr_t)&cpu->id_aa64pfr0;
+
+    id_regitsers[20].id = ARM64_SYS_REG(ARM_CPU_ID_AA64DFR0);
+    id_regitsers[20].addr = (uintptr_t)&cpu->id_aa64dfr0;
+
+    id_regitsers[21].id = ARM64_SYS_REG(ARM_CPU_ID_AA64ISAR0);
+    id_regitsers[21].addr = (uintptr_t)&cpu->id_aa64isar0;
+
+    id_regitsers[22].id = ARM64_SYS_REG(ARM_CPU_ID_AA64MMFR0);
+    id_regitsers[22].addr = (uintptr_t)&cpu->id_aa64mmfr0;
+
+    id_regitsers[23].id = ARM64_SYS_REG(ARM_CPU_ID_CLIDR);
+    id_regitsers[23].addr = (uintptr_t)&cpu->clidr;
+
+    id_regitsers[24].id = ARM64_SYS_REG(ARM_CPU_ID_CTR);
+    id_regitsers[24].addr = (uintptr_t)&cpu->ctr;
+
+
+    for (i = 0; i < ARM_CPU_ID_MAX; i++) {
+        if(id_regitsers[i].id != 0) {
+            ret = kvm_set_one_reg(cs, id_regitsers[i].id,
+                                  (void *)id_regitsers[i].addr);
+            if (ret) {
+                fprintf(stderr, "set ID register 0x%llx failed\n",
+                        id_regitsers[i].id);
+                return ret;
+            }
+        } else {
+            break;
+        }
+    }
+
+    /* TODO: Set CCSIDR */
+    return ret;
+}
 
 int kvm_arch_init_vcpu(CPUState *cs)
 {
@@ -489,6 +633,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     uint64_t mpidr;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    bool heterogeneous = false, cross = false;
+    struct kvm_vcpu_init init;
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
         !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
@@ -518,12 +664,48 @@ int kvm_arch_init_vcpu(CPUState *cs)
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
 
+    /*
+     * Check if host is a heterogeneous system. It doesn't support -cpu host on
+     * heterogeneous system. If user requests a specific type VCPU, it should
+     * set the KVM_ARM_VCPU_CROSS bit to tell KVM that userspace want a specific
+     * vCPU. If KVM supports cross type vCPU, then set the ID registers.
+     */
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_HETEROGENEOUS)) {
+        heterogeneous = true;
+    }
+
+    if (strcmp(object_get_typename(OBJECT(cpu)), TYPE_ARM_HOST_CPU) == 0) {
+        if (heterogeneous) {
+            fprintf(stderr, "heterogeneous system can't support host guest CPU type\n");
+            return -EINVAL;
+        }
+    } else if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_CROSS_VCPU)) {
+        init.features[0] = 1 << KVM_ARM_VCPU_CROSS;
+        if (kvm_vm_ioctl(cs->kvm_state, KVM_ARM_PREFERRED_TARGET, &init) < 0) {
+            return -EINVAL;
+        }
+
+        if (init.target != (cpu->midr & 0xFF00FFF0) || heterogeneous) {
+            cpu->kvm_target = QEMU_KVM_ARM_TARGET_GENERIC_V8;
+            cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_CROSS;
+            cross = true;
+       }
+    }
+
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
     if (ret) {
         return ret;
     }
 
+    if (cross) {
+        ret = kvm_arm_set_id_registers(cs);
+        if (ret) {
+            fprintf(stderr, "set vcpu ID registers failed\n");
+            return ret;
+        }
+    }
+
     /*
      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
      * Currently KVM has its own idea about MPIDR assignment, so we
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
