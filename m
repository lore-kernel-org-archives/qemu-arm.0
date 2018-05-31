Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5457013wre;
        Wed, 30 May 2018 20:38:55 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIk6Ar9RJ+PEJJo8CB+Cy6sJwyBvgj47uoD7WhX3p6WlEdPS+8Re7t+s9mG4/Jb6QOzZkz2
X-Received: by 2002:ac8:4141:: with SMTP id e1-v6mr5080909qtm.324.1527737935117;
        Wed, 30 May 2018 20:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527737935; cv=none;
        d=google.com; s=arc-20160816;
        b=lfG8d94mO6H8leZsuxOIGE++NWB40TXM2J9RBo095QUcQ64U8PGkUejveNiVkyqLeU
         1XbSVHawHl2mNAjzow7zLod05slaPdeOP0Z0JVeQV2c4UX3CPPyA91uKMt/POMvuO9WK
         crbM2VaCMNxFrQohazOTZJBNdJpwi1QNI0kl3+gLuh6TaNnNdWPP0IBqmi2IbSA3FtVh
         4n257PdKFJ+tNCTQvJgSrqvXgX06Au4GbnNP/gMQkYY0LoVu012/irD3GsUzoGLFwEVm
         Ug7ETBAUlYM/mXfzKmKuYRVkwK+y7UvgVFBfHgrVTseIn5PvBlQaiPGvexFvD8YR914p
         fCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=/K/2BkrOI0kHsVT4rq8DePFCguNL7ggrJ+GTf/NtiOg=;
        b=XNYw2IbwGU1j/W6G5sjwuV3S3C4MRpgv+/vLPUnA+xsX3+Nnm9FSojFCaxE9FXhuWI
         6lQIppaM+pXnyi90oV580VdLiv6olw6lsAWbj08AADm/4rgFKu1p/qtBEYEzdx1v42Yi
         1+uY443/zM63aZKNsBrGG4fZGOU68a2wn6bPTD5etsduXpiuH7xLPJyZ5Pqo3p2YSb4V
         HsVBbaaimjvoypnnuocng7rEoO0zxhg06WsWstKnLY4967RjvVP2DQHftC8XPYYeuSPG
         BB7Cn82rNccut0kZDH/YGs/5riBQRv9RT7RrIPRhKLTQMXSD+niefvnEi1ZvatV90IuQ
         ReQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g127-v6si14112752qkc.358.2018.05.30.20.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOEQQ-00032Z-IK
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:38:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEQF-00031o-E3
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEQE-0007Ed-Es
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:38:43 -0400
Received: from [45.249.212.32] (port=33525 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fOEQE-0007Cc-2m; Wed, 30 May 2018 23:38:42 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id BB41B2A7F5F79;
	Thu, 31 May 2018 11:38:37 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:38:29 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Date: Thu, 31 May 2018 19:43:57 +0800
Message-ID: <1527767037-6105-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527767037-6105-1-git-send-email-gengdongjiu@huawei.com>
References: <1527767037-6105-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v1 3/3] target: arm: Add support for VCPU event
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
X-TUID: rIbTCOrjXCzd

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
2.7.4

