Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp6439015wrd;
        Tue, 28 Aug 2018 06:51:05 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYtfjVZO0/+JikM/fDDcTqpl7BdzOJRW+4nnxeyLLAVmK1cm9IRn8mFNh1Xj2ntBsVhQww+
X-Received: by 2002:a62:da0b:: with SMTP id c11-v6mr1740325pfh.68.1535464265386;
        Tue, 28 Aug 2018 06:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535464265; cv=none;
        d=google.com; s=arc-20160816;
        b=POGWp0AIvCoI9WNb00VigymNz3wGvjblQgfXrXLhD1j74OFc2RUU1JXzC/yrKSJEJ2
         AKhES+5GBKyvIAQyyXutfNHaQLIQhncOjaoCM/AIKssZLHfin00TGtrmodfKy5iTFGWx
         hth1K1pfYM+LTJZT28GlBzBHkziENr/KKH9hU0Bv7om4rlaM8K1Mk5UM7QdljaByFZsj
         VEKhKE/QKpvXKolnLzOAg5imavs3kmtcPzUvDpzl6R15PZHQ1fGjBaTVPFXXBNLv7sB2
         Y0zlaSAa6++wZNP2uHT3t3lzxSw67HiEW4hKS6szZ6oq0ibkrVe/97DZ62oLwtIg+mib
         2ftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=vC9daYztuAatiiqRNm3by4M3ztc+rVWRGBHcFsZ3ST4=;
        b=EAWgVo1wcuVnDKNEEmlOa0DJpTjf7y+MfdscROQM+dfI51Z4TvGvMQqjdJs9TfDTkV
         xn6Qx1YGQOFou7/VhnCXDDjSQl2esvtCQeM9zffdgmvqr3u69TaC8NdThed3V8vrSlyk
         eiKo7PYQO/Znut3Wudf/JqHG8dfkJoXH9dXJCy1Iy2wqHgFrlV3zIRupLXPyW2IzK0c4
         qXiE0BrFh7/bVdF2i+LM9dn2kOYdiLDbzgM7CMc4sWxKWoPpLiJsV82s7HLGd/pTIzJQ
         5x7mhiSGNlSy50Kn4SvGSiI3TMMAG75Cv6b8PJrRsgLzu3MltuL+84fQ2iDV7vcORszU
         XV1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g10-v6si1004613plt.468.2018.08.28.06.51.05;
        Tue, 28 Aug 2018 06:51:05 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbeH1Rms (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 28 Aug 2018 13:42:48 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:11611 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727877AbeH1Rms (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 28 Aug 2018 13:42:48 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7310A94CF407A;
        Tue, 28 Aug 2018 21:50:51 +0800 (CST)
Received: from SHA150392835-N.china.huawei.com (10.45.52.187) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.399.0; Tue, 28 Aug 2018 21:50:46 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <gengdongjiu@huawei.com>
Subject: [PATCH v8 2/2] target: arm: Add support for VCPU event states
Date:   Tue, 28 Aug 2018 21:49:15 +0800
Message-ID: <20180828134915.8744-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.11.0.windows.1
In-Reply-To: <20180828134915.8744-1-gengdongjiu@huawei.com>
References: <20180828134915.8744-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.45.52.187]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: +Ji/alzYGvhH

This patch extends the qemu-kvm state sync logic with support for
KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
And also it can support the exception state migration.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
change since v7:
1. Change "pending" and "has_esr" from uint32_t to uint8_t for CPUARMState
2. Add error_report() in kvm_get_vcpu_events()

Change since v6:
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

Change since v3:
1. Add a new new subsection with a suitable 'ras_needed' function
   controlling whether it is present
2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
---
 target/arm/cpu.h     |  7 ++++++
 target/arm/kvm64.c   | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c | 22 +++++++++++++++++
 3 files changed, 98 insertions(+)

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
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b8246..e8705e2 100644
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
 
@@ -600,6 +605,60 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
+static int kvm_put_vcpu_events(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    struct kvm_vcpu_events events = {};
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
+
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
@@ -727,6 +786,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
@@ -863,6 +927,11 @@ int kvm_arch_get_registers(CPUState *cs)
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
1.9.1

