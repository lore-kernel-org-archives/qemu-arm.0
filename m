Received: by 10.25.227.6 with SMTP id a6csp73135lfh;
        Sat, 1 Jul 2017 09:47:37 -0700 (PDT)
X-Received: by 10.200.5.134 with SMTP id a6mr34880576qth.44.1498927657440;
        Sat, 01 Jul 2017 09:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498927657; cv=none;
        d=google.com; s=arc-20160816;
        b=Lt/jPJyJcuVl/p4O0i6x6uznkEUPgAOc7DvvSAzs10njgyWBh1ea+5Sg59zjaI+ax2
         NFesq+jdQLvDloUvvz6QPik/sNmBSKLv6QcpKyUQPOIkOhqSLDJQFaciCaAtfOxrZheP
         Jkz0aR0hFFrI3d5yxOE9+Gu86NYom00ixifDa9eeGBVE9DlMIuFnqM2h2ynPGnhJJWm/
         U4DG+WyPz7lbCZda1yhL8tSjltL+7M6JfA2LNFaTBp4Wt2I+JcAFCxcVW0rk6Z0hc/XB
         3GECI3QMnXWSiIBMgywyv8U8CunEda7FcY4eKhEMfDYKtxirXwyrpsQgvenHiNImJ2nx
         oUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Kpebt/iCmdL2Thd7eOepeDWGS3kqEsRzvJCp05LFaj0=;
        b=Uk2oK6u3fXkF7GieqsCMLdZAY9Ww1R2q3pfQRK3JHu0zipBxTF+uRmqbjFjGpoBa5F
         zjsH+OOL4YpBjh8whSZgdLbWalIHv5wmIceS9KnwPPExOYaE35/U1KdlRtPoJ32F65YR
         WDefXOsYLaBT8oMyBYvUHwc1MAWHD9SD8BB3QHpYJcRhRxcrKh3R7Am0cIxmXK/lVk49
         BoD4OgYZowbaaxuE+ku/FrXvBoy7JQtQmDrE4t5/cEUy6fEVaGcSGrYxZNwuA+1j6XiI
         gbwBldmJkd0G2v1DgVuMszqaVtswwdKl9YwRcCm5Toniq+v/GCIzQMnPLP/raLDCT5Ps
         Pdaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si10343983qkb.21.2017.07.01.09.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jul 2017 09:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRLYU-00084Y-Mz
	for alex.bennee@linaro.org; Sat, 01 Jul 2017 12:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYL-00083w-86
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYI-0000Px-Mj
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dRLYI-0000Of-Ek; Sat, 01 Jul 2017 12:47:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCA4F315FBD;
	Sat,  1 Jul 2017 16:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CCA4F315FBD
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CCA4F315FBD
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32E8760463;
	Sat,  1 Jul 2017 16:47:20 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sat,  1 Jul 2017 12:47:16 -0400
Message-Id: <1498927637-14496-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1498927637-14496-1-git-send-email-drjones@redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 01 Jul 2017 16:47:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/3] target/arm/kvm: split pmu init from creation
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
Cc: peter.maydell@linaro.org, agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: COMGi9Cvmno7

When adding a PMU with a userspace irqchip we only do the INIT
stage of the device creation.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c        | 10 ++++++++--
 target/arm/kvm32.c   |  6 ++++++
 target/arm/kvm64.c   | 52 +++++++++++++++++++++++++---------------------------
 target/arm/kvm_arm.h |  6 ++++++
 4 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9781e1cc5ed7..0cb8b479232d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -492,8 +492,14 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
 
     CPU_FOREACH(cpu) {
         armcpu = ARM_CPU(cpu);
-        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU) ||
-            (kvm_enabled() && !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ)))) {
+        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
+            return;
+        }
+        if (kvm_enabled() &&
+            !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
+            return;
+        }
+        if (kvm_enabled() && !kvm_arm_pmu_init(cpu)) {
             return;
         }
     }
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 069da0c5fd10..a51695f25911 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -527,3 +527,9 @@ int kvm_arm_pmu_create(CPUState *cs, int irq)
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
     return 0;
 }
+
+int kvm_arm_pmu_init(CPUState *cs)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
+    return 0;
+}
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index a16abc8d129e..d94e0a04f015 100644
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
+int kvm_arm_pmu_create(CPUState *cs, int irq)
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
index 633d08828a5d..3382762aa023 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -196,6 +196,7 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
 int kvm_arm_vgic_probe(void);
 
 int kvm_arm_pmu_create(CPUState *cs, int irq);
+int kvm_arm_pmu_init(CPUState *cs);
 
 #else
 
@@ -209,6 +210,11 @@ static inline int kvm_arm_pmu_create(CPUState *cs, int irq)
     return 0;
 }
 
+static inline int kvm_arm_pmu_init(CPUState *cs)
+{
+    return 0;
+}
+
 #endif
 
 static inline const char *gic_class_name(void)
-- 
1.8.3.1

