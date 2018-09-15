Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1682717wrd;
        Sat, 15 Sep 2018 02:28:32 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbCHGFmjS/PWbiVc2N+SN7zoz/7UxaTETmIgCbXArK67WSb71p16g2WYPh+asDcUa+t14hQ
X-Received: by 2002:ac8:4304:: with SMTP id z4-v6mr11049494qtm.295.1537003712055;
        Sat, 15 Sep 2018 02:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537003712; cv=none;
        d=google.com; s=arc-20160816;
        b=lhGNJsoJPHlRvrPA8+ef3Ci+F201A3hMNwMDCLrnzl9hfenxSyXbNH4Bh3bNLnSOPD
         eljL9IB4qNNUReSV1ux0pa8SwZbp+usGx1TCFujzid86U17j85pOOSEZBQce5ZAJloLs
         SxsVKCXOCw2sZ7ya/8VvQbmyRTBsNfJgUbE1Z7psIPQnNptjoQt1Jh3otpeH+AIGdpkP
         AijkT35CUeAB7AzSFY73ZJOkfWb9w+xCiWY3w7OF5a6G92bIuX3+npEnjYQ0OxPiWn6X
         OVqQ82z7iixuw+/ZIUsF0xpkHSQobeUsMJNinilelvynpxAk4pRg3M6sbICpCTEaKJ1a
         dQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=jKWOBIamxI1TrndHlw7Ja7PuFpLt1NV6oBfUm7RxA6k=;
        b=K+uqyFP8K93lgMz4jrExpQssk4ud42vWinKquIr8KwZhtY4oHBJrOJ34E9parzRT1P
         1ViRLKLDIWSSal9gHDr92Xm7qYqSU3FvbjqDvrjsBvmaOZzOA5rvHbhpLmK++gHlpye7
         fDbv+RdmSnWxtQmZZQtLpMaGUxrs1E4ekGF5A+8MNcNjwuBgMcv7FH7ScSvbtU8Nevmd
         ez/CVUWe96i6Iq9vP0QejZujhz2xiiwpbaYqTVYNfs3RoqfohiO/RK0Ltd4e8Or2y8je
         QCSMLI6EXzsg0JMofBTzbvV6I5E2ZFNt8g1takI6xyqA6uM78lHQat+JSDQsvBfU8uA8
         EKTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2-v6si1901299qke.8.2018.09.15.02.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 15 Sep 2018 02:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g16sR-0007Hq-CF
	for alex.bennee@linaro.org; Sat, 15 Sep 2018 05:28:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g16sF-0007HV-3G
	for qemu-arm@nongnu.org; Sat, 15 Sep 2018 05:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g16s1-0004Hs-Jh
	for qemu-arm@nongnu.org; Sat, 15 Sep 2018 05:28:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2648 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g16s1-00047G-1X; Sat, 15 Sep 2018 05:28:05 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id B9900C9FCF476;
	Sat, 15 Sep 2018 17:27:53 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.399.0; Sat, 15 Sep 2018 17:27:47 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 15 Sep 2018 13:32:07 -0400
Message-ID: <1537032727-29397-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537032727-29397-1-git-send-email-gengdongjiu@huawei.com>
References: <1537032727-29397-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v9 2/2] target: arm: Add support for VCPU event
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
Cc: gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nNfFfhG0ZX5z

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
Change since v8:
1. Update the commit message

Change since v7:
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
---
 target/arm/cpu.h     |  7 ++++++
 target/arm/kvm64.c   | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c | 22 +++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 62c36b4..034b035 100644
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
1.8.3.1

