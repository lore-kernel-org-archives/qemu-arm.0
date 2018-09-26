Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp627141wrt;
        Wed, 26 Sep 2018 05:44:22 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63DHgwn0c9tIPWCipoW2ilGHk7/3/rtKzqE/KNTMXqnvtpb2LN9E5T6ePTyKxnBpwdqZLpf
X-Received: by 2002:ac8:2672:: with SMTP id v47-v6mr4181935qtv.287.1537965862457;
        Wed, 26 Sep 2018 05:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537965862; cv=none;
        d=google.com; s=arc-20160816;
        b=gcLX62QlA1cqujbN/yP/c8lTHtu0CJEKskz2wfX0vSJievYazUeWTa2KcjieSkXVot
         kgikz0xJIuzRfxkZKva6kyL1WezPebeeX8SxvNDeIPguyowob0jO3uTdv3S/4VYEn4V8
         VDWC37YP/cVNOa6fVTD6RY39SNcR4fTtXoczkG1/2nhJI5vDqhpIQKpVwR1ryg+d9CIY
         kC6vi1HUMxm3nCKokxYBvZPISvCLSi4PySRqA0iOetuplfJJHP2Wx7dWKWpkQAnEBpHJ
         PJMeiRPez0a3/XaCKhAnUPmX4GkV+Gz+QjdDJMHgHFCtsTNdjdCSQ5EAJre+kCahRhnv
         vlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=eqnhXqU2YTLnXAzmJK05F6Eqg40BlCnBElvzHkbEPoI=;
        b=UQSEsZnHbS7dGYNCYrEjzq1HmLlKGkirogR8eokP1uFPaYkLv+0cYbAo/78J4sVsqE
         Oy07K57365TWpMOJ4ZWYcaOOEM/VNZawQSYKAsTiyIS9VPCckYbqbMFhtCkR2a10GPlS
         C+cdz5x4HSof/KM70RvUFrH+x8yuL11kXk8VbKE4FBDTyLlXwPfOdUGmNFMu2F9RkbOV
         miz8h9MSmHQQQMzSdKhfn8xbj8pKz98Of1TPjsWFDFeaTMYT3iq7RXF3pb/CKnsFJwD9
         LFIRJutIBIyQLLPaV5JXdvwllORlGfZmPpdF90PRRQ7mRzKWd7q0vPmP7/iHsWyvRPZI
         8XSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y1-v6si3342946qki.248.2018.09.26.05.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 05:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g59Az-0002dL-VC
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 08:44:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59AN-0002JA-VG
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59AJ-0003WC-AI
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:43:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2650 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g59AI-0003Tc-Et; Wed, 26 Sep 2018 08:43:39 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4DF58BDBB36A2;
	Wed, 26 Sep 2018 20:43:30 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.399.0; Wed, 26 Sep 2018 20:43:24 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <drjones@redhat.com>,
	<shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <gengdongjiu@huawei.com>
Date: Wed, 26 Sep 2018 16:47:31 -0400
Message-ID: <1537994851-36254-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537994851-36254-1-git-send-email-gengdongjiu@huawei.com>
References: <1537994851-36254-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v10 2/2] target/arm: Add support for VCPU event
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dj4vMeb6imPR

This patch extends the qemu-kvm state sync logic with support for
KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
And also it can support the exception state migration.

The SError exception states include SError pending state and ESR value,
the kvm_put/get_vcpu_events() will be called when set or get system
registers. When do migration, if source machine has SError pending,
QEMU will do this migration regardless whether the target machine supports
to specify guest ESR value, because if target machine does not support that,
it can also inject the SError with zero ESR value.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Because I do not have arm32 platform, only have arm64 platform,
so I only test this patch in arm64, if somebody else can test this
patch, I will very appreciate that.

How to test this patch:
1. Apply this patch to enable 32 bit KVM vcpu events support:
   https://patchwork.kernel.org/patch/10612479/
2. Source machine is pending a SError, that is 'events.exception.serror_pending = 1',
   then do migration, to see whether target machine will be also pending this SError.

Change since V9:
address Andrew's comments:
1. Remove the '= {}' in kvm_put_vcpu_events()
2. Remove a blank line in kvm_get_vcpu_events()
3. Add 32 bit KVM supports

Change since v8:
1. Update the commit message

Change since v7:
address shannon's comments:
1. Change "pending" and "has_esr" from uint32_t to uint8_t for CPUARMState
2. Add error_report() in kvm_get_vcpu_events()

Change since v6:
address Peter's comments:
1. Add cover letter
2. Change name "cpu/ras" to "cpu/serror"
3. Add some comments and check the ioctl return value for kvm_put_vcpu_events()

Change since v5:
address Peter's comments:
1. Move the "struct serror" before the "end_reset_fields" in CPUARMState
2. Remove ARM_FEATURE_RAS_EXT and add a variable have_inject_serror_esr
3. Use the variable have_inject_serror_esr to track whether the kernel has state we need to migrate
4. Remove printf() in kvm_arch_put_registers()
5. ras_needed/vmstate_ras to serror_needed/vmstate_serror
6. Check to use "return env.serror.pending != 0" instead of "arm_feature(env, ARM_FEATURE_RAS_EXT)" in the ras_needed()

Change since v4:
1. Rebase the code to latest
---
 target/arm/cpu.h     |  7 ++++++
 target/arm/kvm32.c   | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c | 22 +++++++++++++++++
 4 files changed, 167 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 65c0fa0..a8454f5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -530,6 +530,13 @@ typedef struct CPUARMState {
          */
     } exception;
 
+    /* Information associated with an SError */
+    struct {
+        uint8_t pending;
+        uint8_t has_esr;
+        uint64_t esr;
+    } serror;
+
     /* Thumb-2 EE state.  */
     uint32_t teecr;
     uint32_t teehbr;
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 4e91c11..0b469d5 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -23,6 +23,8 @@
 #include "hw/arm/arm.h"
 #include "qemu/log.h"
 
+static bool have_inject_serror_esr;
+
 static inline void set_feature(uint64_t *features, int feature)
 {
     *features |= 1ULL << feature;
@@ -217,6 +219,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
 
+    /* Check whether userspace can specify guest syndrome value */
+    have_inject_serror_esr = kvm_check_extension(cs->kvm_state,
+                                                 KVM_CAP_ARM_INJECT_SERROR_ESR);
+
     return kvm_arm_init_cpreg_list(cpu);
 }
 
@@ -297,6 +303,60 @@ static const Reg regs[] = {
     VFPSYSREG(FPINST2),
 };
 
+static int kvm_put_vcpu_events(ARMCPU *cpu)
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
+    events.exception.serror_pending = env->serror.pending;
+
+    /* Inject SError to guest with specified syndrome if host kernel
+     * supports it, otherwise inject SError without syndrome.
+     */
+    if (have_inject_serror_esr) {
+        events.exception.serror_has_esr = env->serror.has_esr;
+        events.exception.serror_esr = env->serror.esr;
+    }
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
+    if (ret) {
+        error_report("failed to put vcpu events");
+    }
+
+    return ret;
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
+    if (ret) {
+        error_report("failed to get vcpu events");
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
+
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -358,6 +418,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    ret = kvm_put_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
     /* Note that we do not call write_cpustate_to_list()
      * here, so we are only writing the tuple list back to
      * KVM. This is safe because nothing can change the
@@ -445,6 +510,11 @@ int kvm_arch_get_registers(CPUState *cs)
     }
     vfp_set_fpscr(env, fpscr);
 
+    ret = kvm_get_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
     if (!write_kvmstate_to_list(cpu)) {
         return EINVAL;
     }
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b8246..e8c9c19 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -29,6 +29,7 @@
 #include "hw/arm/arm.h"
 
 static bool have_guest_debug;
+static bool have_inject_serror_esr;
 
 /*
  * Although the ARM implementation of hardware assisted debugging
@@ -546,6 +547,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     kvm_arm_init_debug(cs);
 
+    /* Check whether userspace can specify guest syndrome value */
+    have_inject_serror_esr = kvm_check_extension(cs->kvm_state,
+                                                 KVM_CAP_ARM_INJECT_SERROR_ESR);
+
     return kvm_arm_init_cpreg_list(cpu);
 }
 
@@ -600,6 +605,59 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
+static int kvm_put_vcpu_events(ARMCPU *cpu)
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
+    events.exception.serror_pending = env->serror.pending;
+
+    /* Inject SError to guest with specified syndrome if host kernel
+     * supports it, otherwise inject SError without syndrome.
+     */
+    if (have_inject_serror_esr) {
+        events.exception.serror_has_esr = env->serror.has_esr;
+        events.exception.serror_esr = env->serror.esr;
+    }
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
+    if (ret) {
+        error_report("failed to put vcpu events");
+    }
+
+    return ret;
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
+    if (ret) {
+        error_report("failed to get vcpu events");
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
@@ -727,6 +785,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    ret = kvm_put_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
     if (!write_list_to_kvmstate(cpu, level)) {
         return EINVAL;
     }
@@ -863,6 +926,11 @@ int kvm_arch_get_registers(CPUState *cs)
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
index ff4ec22..32bcde0 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -172,6 +172,27 @@ static const VMStateDescription vmstate_sve = {
 };
 #endif /* AARCH64 */
 
+static bool serror_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    return env->serror.pending != 0;
+}
+
+static const VMStateDescription vmstate_serror = {
+    .name = "cpu/serror",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = serror_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(env.serror.pending, ARMCPU),
+        VMSTATE_UINT8(env.serror.has_esr, ARMCPU),
+        VMSTATE_UINT64(env.serror.esr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool m_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -726,6 +747,7 @@ const VMStateDescription vmstate_arm_cpu = {
 #ifdef TARGET_AARCH64
         &vmstate_sve,
 #endif
+        &vmstate_serror,
         NULL
     }
 };
-- 
2.7.4

