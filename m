Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2037229wrq;
        Thu, 7 Jun 2018 05:27:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLtre+KU88lcpLUexutjUzQpQ0Qp9z9nwVXdkv5T0CA6ec+Yb4PaXrtrEDHQNsdFxEe1bSQ
X-Received: by 2002:a0c:d683:: with SMTP id k3-v6mr1404886qvi.154.1528374471513;
        Thu, 07 Jun 2018 05:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528374471; cv=none;
        d=google.com; s=arc-20160816;
        b=zu+1ZzU/awDfIMes2WZiXmEw6BtkI8BJvH//C2eb1zxZkbH07MTC3MZg8QB09l064k
         CaskWZZQtlY8fa1Jg4b8o15DDVHg9kw7zz6smNg0bRRLASDYZ6AWV3/OpxEV6gm7s+qa
         LE84kz6AAIpAN0sT1vU6rX3CXvOKRFazBp8Z7r95MzIUg1xXnjwqfzqR18iPcAh5ZHs8
         N6WspBepcEmreIyve947QUuF76iQaa70KctX/IviKsD1rn38nWp5/+twnq7AiQIcTgSW
         YjoL+CoxRIze2WXETmg4oMMM3mZsGyO92uwwVeCNzdIpmtiblBLTajc6gL4n0rjUvFXz
         uksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=cnz8MbT9gT1APW7xDZDM/RbLoFRGo9drVaNj2nQrEBQ=;
        b=qgNRqrG5Oh3PbKY9twF4GT1OYTpHC+S083/CHY3DRgVAhHK5kJ3UkcjjJKz2cq1q8y
         OwoQZu0a1g3A4obxWJs+X/zcVwPyyfBzIYjMPi7XmYdotZ2X5P1xp4SSmoqQ5xh34jgW
         X8Ff5UOAAEgf9d9tfujne3bOosmQjVnZ2O5ZlD4TdH8fySLBzcAy+jGvpF9FZM8RBCjw
         h80y6iLhGWPkIUSpXC2/8Hwj0eOcmQQeMxRFeddag4UUsY17UG0vcxc38rnY3wSrHWW+
         vMrrVWUR/p07WJNuVJ3Y7HzTMXfbisfiK9xYgd1o0w6VX6Nzf9f/rzHmF8N8h0kaEE5S
         Ia0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r24-v6si17829767qtm.272.2018.06.07.05.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 05:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQu19-0004dj-1p
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 08:27:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQtzE-00039e-Qp
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQtzA-0005mu-0f
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:25:52 -0400
Received: from [45.249.212.35] (port=48000 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fQtz9-0005l5-Jl; Thu, 07 Jun 2018 08:25:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 525EF236FFA24;
	Thu,  7 Jun 2018 20:25:42 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 7 Jun 2018 20:25:37 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Date: Fri, 8 Jun 2018 04:31:00 +0800
Message-ID: <1528403460-30526-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528403460-30526-1-git-send-email-gengdongjiu@huawei.com>
References: <1528403460-30526-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v3 RFC 2/2] target: arm: Add support for VCPU
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
X-TUID: UFdXJA/VXLHr

This patch extends the qemu-kvm state sync logic with support for
KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
And also it can support the exception state migration.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 target/arm/cpu.h     |  5 ++++
 target/arm/kvm64.c   | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c |  3 +++
 3 files changed, 72 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8488273..b3d6682 100644
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
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b8246..45b6911 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -600,6 +600,59 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
+static bool kvm_can_set_vcpu_esr(ARMCPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+
+    int ret = kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_INJECT_SERROR_ESR);
+    return (ret) ? true : false;
+}
+
+
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
+    if (kvm_can_set_vcpu_esr(cpu)) {
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
@@ -727,6 +780,12 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
@@ -863,6 +922,11 @@ int kvm_arch_get_registers(CPUState *cs)
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
index 2e28d08..5a359f4 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -695,6 +695,9 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+        VMSTATE_UINT32(env.serror.pending, ARMCPU),
+        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
+        VMSTATE_UINT64(env.serror.esr, ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
         {
-- 
1.8.3.1

