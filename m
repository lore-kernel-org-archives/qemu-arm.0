Received: by 10.25.44.15 with SMTP id s15csp852612lfs;
        Wed, 19 Jul 2017 06:47:34 -0700 (PDT)
X-Received: by 10.237.34.245 with SMTP id q50mr147095qtc.307.1500472054414;
        Wed, 19 Jul 2017 06:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500472054; cv=none;
        d=google.com; s=arc-20160816;
        b=kQyjl/bDAQ9wKA3B4twKuNdqutIDyYWr84l11rKrUaeSGAXXy0MS8BwG8zoIjWjCnZ
         uze5igJzpFa41SYJfIS6J/DsR1FXV5b3gwAa8cmvMIVczQIVcuegWB7SJ0b2nYfF+yak
         s7FUoqASNICVfn2p2nXjPed/HbTuM7cjrUBCRN36FFQJi6Md004hwGd6828xePAdbKOP
         24ECi4KWb28Xq82Epe1yKpu689Y7a0R/hckpgK6dQaJfTqpgqMEeZTI2wrCrzOq5rsg1
         0Q24Zpx/BtsYoSgHQzauR6c70PxiBQd0jDTJLi9h2sZcwC3kEvT27R0Zk3HjA5nlUjke
         2avw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=6EklqSYASEDYkkVeJc7oG/DiYpRSy6pQnGupDITI+88=;
        b=toKGKrmNWpaeq8MMEAjlsbYX9XdVEi4KsT7wG3SJXHcjf/kyl0EOxIuKG/KydasVSh
         GJ1s4BRV0dX9qG64xCwxXssiEsGOUZwC8Rm6hhJYJUL/C6WWY4SdJ7BiEEzRKeSO6VFw
         EXlBn9DxuJr/FGf5RG7rwWNwYbreX3tA2SJ747T6ZMRIskdVjlE4CZc5UDCgEY+et7Cj
         SNSMO6BNAzcCGMINrc8+AzdWpQei4VG86xnsTw8/HcxWRC+iskniYNPFZRn4ndk6a9v/
         ZSEt/52plzfVNwZqHS7SWFLyBT8PXZ/HEksKdPEOpZr582NsYP5IHWSsLGVf790dxuq5
         62KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n60si46655qte.464.2017.07.19.06.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Jul 2017 06:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXpK7-0001Hv-Qo
	for alex.bennee@linaro.org; Wed, 19 Jul 2017 09:47:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpK4-0001Hp-Lr
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpK0-00080Y-M4
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:47:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dXpK0-000804-Cx; Wed, 19 Jul 2017 09:47:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72419C04B938;
	Wed, 19 Jul 2017 13:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 72419C04B938
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 72419C04B938
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF58553CE3;
	Wed, 19 Jul 2017 13:39:59 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 19 Jul 2017 09:39:55 -0400
Message-Id: <1500471597-2517-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1500471597-2517-1-git-send-email-drjones@redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 19 Jul 2017 13:40:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/4] target/arm/kvm: pmu: split init and
 set-irq stages
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
Cc: peter.maydell@linaro.org, agraf@suse.de, cdall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /WVlZI+wy/S5

When adding a PMU with a userspace irqchip we skip the set-irq
stage of device creation. Split the 'create' function into two
functions 'init' and 'set-irq' so they may be called separately.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c        | 11 +++++++++--
 target/arm/kvm32.c   |  8 +++++++-
 target/arm/kvm64.c   | 52 +++++++++++++++++++++++++---------------------------
 target/arm/kvm_arm.h | 10 ++++++++--
 4 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea26f0c473c2..7157a028adce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -492,10 +492,17 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
 
     CPU_FOREACH(cpu) {
         armcpu = ARM_CPU(cpu);
-        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU) ||
-            (kvm_enabled() && !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ)))) {
+        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             return;
         }
+        if (kvm_enabled()) {
+            if (!kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
+                return;
+            }
+            if (!kvm_arm_pmu_init(cpu)) {
+                return;
+            }
+        }
     }
 
     if (vms->gic_version == 2) {
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 069da0c5fd10..e3aab89a1a94 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -522,7 +522,13 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
     return false;
 }
 
-int kvm_arm_pmu_create(CPUState *cs, int irq)
+int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
+    return 0;
+}
+
+int kvm_arm_pmu_init(CPUState *cs)
 {
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
     return 0;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index a16abc8d129e..e26638a6fac1 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -381,46 +381,44 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
     return NULL;
 }
 
-static bool kvm_arm_pmu_support_ctrl(CPUState *cs, struct kvm_device_attr *attr)
-{
-    return kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr) == 0;
-}
-
-int kvm_arm_pmu_create(CPUState *cs, int irq)
+static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
 {
     int err;
 
-    struct kvm_device_attr attr = {
-        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
-        .addr = (intptr_t)&irq,
-        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
-        .flags = 0,
-    };
-
-    if (!kvm_arm_pmu_support_ctrl(cs, &attr)) {
-        return 0;
+    err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
+    if (err != 0) {
+        return false;
     }
 
-    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
+    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
     if (err < 0) {
         fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
                 strerror(-err));
         abort();
     }
 
-    attr.group = KVM_ARM_VCPU_PMU_V3_CTRL;
-    attr.attr = KVM_ARM_VCPU_PMU_V3_INIT;
-    attr.addr = 0;
-    attr.flags = 0;
+    return true;
+}
 
-    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
-    if (err < 0) {
-        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
-                strerror(-err));
-        abort();
-    }
+int kvm_arm_pmu_init(CPUState *cs)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .attr = KVM_ARM_VCPU_PMU_V3_INIT,
+    };
+
+    return kvm_arm_pmu_set_attr(cs, &attr);
+}
+
+int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .addr = (intptr_t)&irq,
+        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
+    };
 
-    return 1;
+    return kvm_arm_pmu_set_attr(cs, &attr);
 }
 
 static inline void set_feature(uint64_t *features, int feature)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 633d08828a5d..cab5ea9be55c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -195,7 +195,8 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
 
 int kvm_arm_vgic_probe(void);
 
-int kvm_arm_pmu_create(CPUState *cs, int irq);
+int kvm_arm_pmu_set_irq(CPUState *cs, int irq);
+int kvm_arm_pmu_init(CPUState *cs);
 
 #else
 
@@ -204,7 +205,12 @@ static inline int kvm_arm_vgic_probe(void)
     return 0;
 }
 
-static inline int kvm_arm_pmu_create(CPUState *cs, int irq)
+static inline int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+{
+    return 0;
+}
+
+static inline int kvm_arm_pmu_init(CPUState *cs)
 {
     return 0;
 }
-- 
1.8.3.1

