Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5232633wrd;
        Mon, 27 Aug 2018 06:04:47 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYUnBuQKR0L2D8QF1ceRmMMpQkuNHerjzPHZHDESy4uZEj2/R66ITdsSYwYGxWd+hxRb2NU
X-Received: by 2002:a37:6c07:: with SMTP id h7-v6mr13087051qkc.185.1535375087198;
        Mon, 27 Aug 2018 06:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535375087; cv=none;
        d=google.com; s=arc-20160816;
        b=vspHT63+eY5TAmYsqTih3e+ZCf8+Z8Z6e75WG2YSM58XF3yyO/KZCaCaaTsc6gv+H0
         QNxp2S01EWJZRAz2N/V7kxpswYWs2slvM+Vs3ISz0zlU05oumGAfYQCL1uIWRMVMWPas
         cno7XE0FumpjUNCCu42AqweS3iFZfDUn75Do97pQs2v4WR5gwPXGtlXuiCvDSYC35SXi
         C2qrPu91ZCu/pydzKQpCAtjtI4ClfvW0gg/I+FYPibZn7Ez77cQtWCe/DdT9yVJfWuer
         0c3ThIb4XIWYYV9/x3uQNuS2r0b/8n7HFAKNBzUJLDNtBOxMErUl9F2PdcLkYdIHWPDJ
         pfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=FJp3PsNaElU1Submd8Ka6GY/d+fsfK/N8r1Vw2B+S9s=;
        b=smDhg7bMGHGh5URftc4/OirRNco7dO2LlYj1mbIkAoi1n76bMEvqJS8fd4bqdRxTjE
         pvntoeJceqkCDP3eKs7TjJUrPvoAXrYreEkk8ERv5D4QgO8sqneZIzlD3o/yqmTDht5G
         ryczMdFyy1SDRkCx6UQclPDsKLTNnCtO9Vklchxpxff/OG/Lf8cIfmgpnTv9XH7edFbb
         TKZvfbVX1OftiVq/nVtrRi+lyCskxR4y8y6CvH6IN0ovRp3IBicQfqNZGnPzAcj+xY4C
         vOCUdWhK3KH42hj4flZ6EriDoBwedOXEyODRC5rDonZ1IFoaHsLJtSce4xnVM+0feHYg
         9a6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4-v6si711346qkt.92.2018.08.27.06.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Aug 2018 06:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fuHCI-0000Zo-G1
	for alex.bennee@linaro.org; Mon, 27 Aug 2018 09:04:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fuH6q-0003iG-GX
	for qemu-arm@nongnu.org; Mon, 27 Aug 2018 08:59:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fuGqA-0002i3-Fv
	for qemu-arm@nongnu.org; Mon, 27 Aug 2018 08:41:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2643 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fuGqA-0002d7-06; Mon, 27 Aug 2018 08:41:54 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 312C35FC405E4;
	Mon, 27 Aug 2018 20:41:44 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.399.0; Mon, 27 Aug 2018 20:41:37 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 27 Aug 2018 16:46:17 -0400
Message-ID: <1535402777-46620-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535402777-46620-1-git-send-email-gengdongjiu@huawei.com>
References: <1535402777-46620-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v7 2/2] target: arm: Add support for VCPU event
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
X-TUID: n7HBQLAy4f59

This patch extends the qemu-kvm state sync logic with support for
KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
And also it can support the exception state migration.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
change since v6:
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
 target/arm/kvm64.c   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c | 22 +++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 62c36b4..7030680 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -530,6 +530,13 @@ typedef struct CPUARMState {
          */
     } exception;
 
+    /* Information associated with an SError */
+    struct {
+        uint32_t pending;
+        uint32_t has_esr;
+        uint64_t esr;
+    } serror;
+
     /* Thumb-2 EE state.  */
     uint32_t teecr;
     uint32_t teehbr;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b8246..6e0252c 100644
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
index ff4ec22..d6dadf1 100644
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

