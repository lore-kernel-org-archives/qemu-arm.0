Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3660384wru;
        Sat, 21 Jul 2018 02:58:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfbPd1npIdONis0dhUz0aJPAQsgk5q6ZOf6M9QDDxFtSiENp9Lxr93h1oTsqixdqVPdCkQ5
X-Received: by 2002:a0c:e053:: with SMTP id y19-v6mr4673678qvk.230.1532167091612;
        Sat, 21 Jul 2018 02:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532167091; cv=none;
        d=google.com; s=arc-20160816;
        b=0zYjZB3q33e1cLc0hmn7LPdEIfbiR7LiRN1MY5sRnTnp01QyTeUIHWpYjK8JRmIgCk
         G3SXGwWI7n8xPCx1/D6eUOCeruW1iInZCvMvMHN54nLtEIU/hBEl4s4onMYXeZNGceI/
         bR+ijbc4s1xGYW6c7O0PWEVVS2UceyhCOX/wO4uv7Vijb/tXAwTr0kbLR0ieIVA4d0K1
         NFI8U40cgNc8sYKNcGL2/lnBkeaimhUQ8NuKQWxo1VaSZUwCnebvlA4+lFqPhcoS9oke
         85VvxFtUR7oV6BgWzIqdnsyvct5KoudKVu4fiKdwaB8AfaB68qWdofXsgiCM8A6LA7X+
         Jm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=FPsGGGNPGPAdiRoVtktn40VSLqphsaMnob6xuCCxI1s=;
        b=SoZiiHslSSh0QbB3xXrhgDEE337Hb201gFbq7hWGbBCXOC4//sA2jwoVqghBGfUULd
         E5ETCspj/H3qVwDm8GvnpDWKdAQsSSYDGk7zPz6YhaTEMQQ8C/EMJcZl5cNXw7S4iXZx
         M7A/z7fWyNcVsR0prHYGrzS1REsCwrdWq/ij5IWTXbkt5dvV1kzPfENrE5mqVqHElQZD
         8LxTQxxfHc3KFwF1+Y9xgaNVUjaJMhNQt1O+9zg544erT0inxH/X6SkEfmYz4lmcAbvY
         5JuHJDQicT7eJbc/WemFrWNubct0x4nWPtstOZUAifDXAcyxaMyOSdmxJSyVHwyss6Ej
         a9rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m82-v6si4023134qki.213.2018.07.21.02.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 02:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgoeR-0001aN-3A
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 05:58:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgodw-0001NV-Tt
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:57:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgodt-0001Wu-Rb
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:57:41 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60218 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fgodt-0001W2-C2; Sat, 21 Jul 2018 05:57:37 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id E35AFA33E9C8F;
	Sat, 21 Jul 2018 17:57:31 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Sat, 21 Jul 2018 17:57:24 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 21 Jul 2018 14:02:42 -0400
Message-ID: <1532196162-29453-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
References: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v6 3/3] target: arm: Add support for VCPU event
 states
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
Cc: linuxarm@huawei.com, gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i45IN76wFI8N

This patch extends the qemu-kvm state sync logic with support for
KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
And also it can support the exception state migration.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
change since v4:
1. Rebase the code to latest

change since v3:
1. Add a new new subsection with a suitable 'ras_needed' function
   controlling whether it is present
2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
---
 target/arm/cpu.h     |  6 ++++++
 target/arm/kvm64.c   | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c | 22 ++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e310ffc..f00f0b6 100644
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
@@ -1486,6 +1491,7 @@ enum arm_features {
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
     ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
+    ARM_FEATURE_RAS_EXT, /* has RAS Extension */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b8246..ebf7a00 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -527,6 +527,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
 
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_INJECT_SERROR_ESR)) {
+        set_feature(&env->features, ARM_FEATURE_RAS_EXT);
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
+    if (arm_feature(env, ARM_FEATURE_RAS_EXT)) {
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
index 2e28d08..ead8b2a 100644
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
+    return arm_feature(env, ARM_FEATURE_RAS_EXT);
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

