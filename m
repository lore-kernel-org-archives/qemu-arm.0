Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7191639wrq;
        Thu, 28 Jun 2018 02:18:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfhFI+u3x6fcayEtFX+vEYnKtTB90J8DY2iVWDMd/veMbHDdL7mn0TnOAe9WzGlzZ7NQF2n
X-Received: by 2002:a37:d709:: with SMTP id m9-v6mr7860911qki.292.1530177501513;
        Thu, 28 Jun 2018 02:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530177501; cv=none;
        d=google.com; s=arc-20160816;
        b=QVhSxaRi8pNGEvfAZqduUy0Et2ML3sqi3r39zhBETgBguxZJq1uvCE2w2Ht3yofLvR
         mIvz1agZrZR8+j4J/Ao1ROZa71Rvo9/ubzuWZjHurtafKhQOsvjr12wrMiM25Bvc9+qx
         uLF+soPV0Dh6030avL44OK3sUFGmqZvi7HW0yI1uAv+gNQEOccBZ/44lNalSTMoyjMFd
         q084czoPU16G0bP1Dz6ThohNooAUPLyPCpg91zHf+465Q18WSXfAprcKvnoKWLeOcQDR
         rgivMFvUvAcbPzEWiKgrAgCQIN2AVyiYGE2VC1uf4GvkPokD/jv1779+6iWF8FAUBlRe
         JhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=ytY2aXQtyg8taBzJawFSqdW40od/OJSBpfuR4OslSIc=;
        b=tcMdFyJ2aGxrEMp0769bHljLUYkNDi58AUx6GmptEbbzxcjJTLtORguTcK2znwQkE7
         7CnlBfyyH5/nneB6dmrv0vmSYG9MqRVbtcZy2zubZ6zYS4woI5nrJX0cF9AU31rQEMmw
         bozbZBPeorVdY00qB8RhsEvrM4UFg0IaUnhr/v9kj541jen4fnijzmB17oMnJV1y/0Tl
         zacSp9s7wDs8cVuHHWjTo08S7Ps7tZJGNKhzu/bd6OOeOVTdmJJ2Ptl4tuXckQtTYquo
         nQ+yROEIXrNjlS8vAbxbcZR5nwxGMaTF/9f14Z9UEX6bsWrRd6Xyf+VJctGYBj5ScSQE
         KjGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2-v6si5521502qvj.39.2018.06.28.02.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 02:18:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYT4H-00063F-00
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 05:18:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fYT3s-0005vV-Pl
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fYT3p-00068O-M2
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:17:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2629 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fYT3p-00062Z-80; Thu, 28 Jun 2018 05:17:53 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 6C5095C7C38EF;
	Thu, 28 Jun 2018 17:17:33 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 28 Jun 2018 17:17:25 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <zhengxiang9@huawei.com>, <gengdongjiu@huawei.com>,
	<linuxarm@huawei.com>
Date: Fri, 29 Jun 2018 01:22:41 +0800
Message-ID: <1530206561-22348-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1530206561-22348-1-git-send-email-gengdongjiu@huawei.com>
References: <1530206561-22348-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v4 RFC 2/2] target: arm: Add support for VCPU
 event states
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MUuu4Q0FP4DQ

This patch extends the qemu-kvm state sync logic with support for
KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
And also it can support the exception state migration.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
change since v3:
1. Add a new new subsection with a suitable 'ras_needed' function
controlling whether it is present
2. Add a ARM_FEATURE_RAS feature bit for CPUARMState

The corresponding kernel patch is here:
https://lkml.org/lkml/2018/6/25/374
---
 target/arm/cpu.h     |  6 ++++++
 target/arm/kvm64.c   | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c | 22 ++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8488273..575c46c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -645,6 +645,11 @@ typedef struct CPUARMState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+    struct {
+        uint32_t pending;
+        uint32_t has_esr;
+        uint64_t esr;
+    } serror;
 } CPUARMState;
 
 /**
@@ -1482,6 +1487,7 @@ enum arm_features {
     ARM_FEATURE_V8_RDM, /* implements v8.1 simd round multiply */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
     ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
+    ARM_FEATURE_RAS, /* has RAS Extension */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b8246..660b358 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -527,6 +527,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
 
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_INJECT_SERROR_ESR)) {
+        set_feature(&env->features, ARM_FEATURE_RAS);
+    }
+
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
     if (ret) {
@@ -600,6 +604,50 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
+static int kvm_put_vcpu_events(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    struct kvm_vcpu_events events = {};
+
+    if (!kvm_has_vcpu_events()) {
+        return 0;
+    }
+
+    memset(&events, 0, sizeof(events));
+    events.exception.serror_pending = env->serror.pending;
+
+    if (arm_feature(env, ARM_FEATURE_RAS)) {
+        events.exception.serror_has_esr = env->serror.has_esr;
+        events.exception.serror_esr = env->serror.esr;
+    }
+
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
+}
+
+static int kvm_get_vcpu_events(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    struct kvm_vcpu_events events;
+    int ret;
+
+    if (!kvm_has_vcpu_events()) {
+        return 0;
+    }
+
+    memset(&events, 0, sizeof(events));
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_VCPU_EVENTS, &events);
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    env->serror.pending = events.exception.serror_pending;
+    env->serror.has_esr = events.exception.serror_has_esr;
+    env->serror.esr = events.exception.serror_esr;
+
+    return 0;
+}
+
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
     struct kvm_one_reg reg;
@@ -727,6 +775,12 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    ret = kvm_put_vcpu_events(cpu);
+    if (ret) {
+        printf("return error kvm_put_vcpu_events: %d\n", ret);
+        return ret;
+    }
+
     if (!write_list_to_kvmstate(cpu, level)) {
         return EINVAL;
     }
@@ -863,6 +917,11 @@ int kvm_arch_get_registers(CPUState *cs)
     }
     vfp_set_fpcr(env, fpr);
 
+    ret = kvm_get_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
     if (!write_kvmstate_to_list(cpu)) {
         return EINVAL;
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 2e28d08..22f2d89 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -172,6 +172,27 @@ static const VMStateDescription vmstate_sve = {
 };
 #endif /* AARCH64 */
 
+static bool ras_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, ARM_FEATURE_RAS);
+}
+
+static const VMStateDescription vmstate_ras = {
+    .name = "cpu/ras",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ras_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.serror.pending, ARMCPU),
+        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
+        VMSTATE_UINT64(env.serror.esr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool m_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -723,6 +744,7 @@ const VMStateDescription vmstate_arm_cpu = {
 #ifdef TARGET_AARCH64
         &vmstate_sve,
 #endif
+        &vmstate_ras,
         NULL
     }
 };
-- 
1.8.3.1

