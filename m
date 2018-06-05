Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp896753wrq;
        Tue, 5 Jun 2018 05:48:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIFjcaF2gY6OVTqERc+mKRyZuzstKFeWsyak2Y+lkENf5dM03y6A8awaUo5JWmuf5yCWTI+
X-Received: by 2002:a37:1193:: with SMTP id 19-v6mr23370972qkr.379.1528202903567;
        Tue, 05 Jun 2018 05:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528202903; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2cVlniKxF7jUTXK71mK4/H6Jyk02gB1mlIpak5DXXIcGfP/y0bKrO5PckX8VosfMh
         lkvAt3RMuSTQOUg3Ibva5HDjTMTkSna2jqEvZtIoZzdGGjHxZ/fb+aW+Q2TE/0nMXKQI
         XZFX3uwo9LjNk2S3cSOgLLsFUzMRAP8Vni6kAdZzyO8aRAEN5M39irWHl+XUhCi7+xcz
         S7OKguMZ0FFHbKBlOxRPkjlswDWU7qsNjEBDTflqBdYYUSh6nSBWZb7WPLOeZPbq2GoA
         hriG5w1Q37LCQJhxiKln3MLtbBjdlIr4ObiMx1ifv/OuZW1htHqgxl4Fie2XqBV5e4Ua
         hcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=/K/2BkrOI0kHsVT4rq8DePFCguNL7ggrJ+GTf/NtiOg=;
        b=fX1cHxm+hHbFhuidhJU0I2OG7HfrWAy1BTpd1iq+eklplQ6rIaFTMOBTgFpHHvWni0
         edvByjb26OUX4usFZ7qQcSjhauCQAJ1zXSukQ5dwm6tLXJxl6AT+gmkXd/CkAotb6qGU
         EPDhMFlUmk5fomA41LUmgnjWdDsAl8j+g6eYMrZx5DIdIazoPf380OGWmZ4ynQC328FF
         wGyWXBXaStNjBWg2zy7YoUtqz8lJxlBALAraaaGYpMHbSiMYBrsRbwbtZLramrDnpfvK
         eIR40gihv6DzYF3sKU1Ld9SuuVL0+qmmWmoPX8KtwWQ9qRIRdvvIL/0uXRt/d+pEWJEr
         Tn0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d43-v6si1563404qtc.394.2018.06.05.05.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 05:48:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQBNv-0007aY-1T
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 08:48:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQBNP-0007Mw-A2
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 08:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQBNM-0003Bz-8L
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 08:47:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2109 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fQBNL-00038s-Oh; Tue, 05 Jun 2018 08:47:48 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9EC4982E8AA31;
	Tue,  5 Jun 2018 20:47:29 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.382.0; Tue, 5 Jun 2018 20:47:24 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Date: Wed, 6 Jun 2018 04:52:49 +0800
Message-ID: <1528231969-19584-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528231969-19584-1-git-send-email-gengdongjiu@huawei.com>
References: <1528231969-19584-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v2 2/2] target: arm: Add support for VCPU event
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
X-TUID: aH1AFbG1p1Bq

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

