Received: by 10.25.44.15 with SMTP id s15csp852886lfs;
        Wed, 19 Jul 2017 06:47:51 -0700 (PDT)
X-Received: by 10.55.93.197 with SMTP id r188mr113227qkb.277.1500472071372;
        Wed, 19 Jul 2017 06:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500472071; cv=none;
        d=google.com; s=arc-20160816;
        b=byAl4Od2PPEqIozDdRb1d05OlQQLgTTlU7pn+DAp1CULsb2Cc95P21VUeKKY87gz0T
         41lWT153vleuTaZ6bSkFHROAkCIgNmpbKlsHffWBKztXpK6Ild/CndJea4uScTMPp6UE
         QzmfQvNWxlglIxtgR38t4e1sNwy1/Bt7UnR7Yp780LRITmPf4oj+f2ZhcEvfpKzmNFqO
         shPyi9T5olhMG489lKKbR4Y3TzocUusgWsR5GxTIeabt02DawZ/Z5OlW/fxOvDq8s1rg
         hRu6whCXSDYbP7ek+HhIA41GB3GknxyhTg9owgDdwl+5lCqOP1cx8eP5a5PDg6gPm+v0
         TqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=tHQAI0FK1sR1Z8fAYQCocwmCdzPZPaaiBkcFxybfklM=;
        b=XrJkxgqepvskHEZjMDGpWQGvAp0q2KOMp9QSPza2Jp1wtPgWkHxxS4QDqhSt2SUy7c
         FmyZQji3scRbswwDG4r/2UMr+S7uPZ9NlMBarrEkD13vPfh4PuRBdAcVvQZ2Zr9GPuQN
         w6I3O76yi0sgyd0XKwNv5y7JXOkIsplAbTosWQstBX6mAnGj6eBH4D5g4rF2GfwEehfQ
         AijVXoq5AcKtwGmHADpB5eb4aBb67IpwVGnafU3+xhhbbKuETfeGGuYj1QeaAWddHvWA
         XJG/NpE4L8erxV2A+FXkc+ZLZzcuZ98yRTSSVKHsxsKdJfCLI/L4mVv5p3ys45lX0ZIV
         WZAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e86si48908qkj.368.2017.07.19.06.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Jul 2017 06:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXpKO-0001Qg-Rc
	for alex.bennee@linaro.org; Wed, 19 Jul 2017 09:47:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpKJ-0001PG-9O
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:47:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpKI-00082p-81
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:47:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dXpKH-00082g-VP; Wed, 19 Jul 2017 09:47:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6812883F3D;
	Wed, 19 Jul 2017 13:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6812883F3D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6812883F3D
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C61653CE3;
	Wed, 19 Jul 2017 13:40:01 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 19 Jul 2017 09:39:57 -0400
Message-Id: <1500471597-2517-5-git-send-email-drjones@redhat.com>
In-Reply-To: <1500471597-2517-1-git-send-email-drjones@redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 19 Jul 2017 13:40:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/4] target/arm/kvm: pmu: improve error
 handling
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
X-TUID: Hn1/KM0IhsZs

If a KVM PMU init or set-irq attr call fails we just silently stop
the PMU DT node generation. The only way they could fail, though,
is if the attr's respective KVM has-attr call fails. But that should
never happen if KVM advertises the PMU capability, because both
attrs have been available since the capability was introduced. Let's
just abort if this should-never-happen stuff does happen, because,
if it does, then something is obviously horribly wrong.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c        |  9 +++------
 target/arm/kvm32.c   |  3 +--
 target/arm/kvm64.c   | 28 ++++++++++++++++++++--------
 target/arm/kvm_arm.h | 15 ++++-----------
 4 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a215330444da..4bc50964d52b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -496,13 +496,10 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
             return;
         }
         if (kvm_enabled()) {
-            if (kvm_irqchip_in_kernel() &&
-                !kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
-                return;
-            }
-            if (!kvm_arm_pmu_init(cpu)) {
-                return;
+            if (kvm_irqchip_in_kernel()) {
+                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
             }
+            kvm_arm_pmu_init(cpu);
         }
     }
 
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index e3aab89a1a94..717a2562670b 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -522,10 +522,9 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
     return false;
 }
 
-int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
 {
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
-    return 0;
 }
 
 int kvm_arm_pmu_init(CPUState *cs)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ec7d85314acc..6554c30007a4 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -387,30 +387,36 @@ static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
 
     err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
     if (err != 0) {
+        error_report("PMU: KVM_HAS_DEVICE_ATTR: %s", strerror(-err));
         return false;
     }
 
     err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
-    if (err < 0) {
-        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
-                strerror(-err));
-        abort();
+    if (err != 0) {
+        error_report("PMU: KVM_SET_DEVICE_ATTR: %s", strerror(-err));
+        return false;
     }
 
     return true;
 }
 
-int kvm_arm_pmu_init(CPUState *cs)
+void kvm_arm_pmu_init(CPUState *cs)
 {
     struct kvm_device_attr attr = {
         .group = KVM_ARM_VCPU_PMU_V3_CTRL,
         .attr = KVM_ARM_VCPU_PMU_V3_INIT,
     };
 
-    return kvm_arm_pmu_set_attr(cs, &attr);
+    if (!ARM_CPU(cs)->has_pmu) {
+        return;
+    }
+    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
+        error_report("failed to init PMU");
+        abort();
+    }
 }
 
-int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
 {
     struct kvm_device_attr attr = {
         .group = KVM_ARM_VCPU_PMU_V3_CTRL,
@@ -418,7 +424,13 @@ int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
         .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
     };
 
-    return kvm_arm_pmu_set_attr(cs, &attr);
+    if (!ARM_CPU(cs)->has_pmu) {
+        return;
+    }
+    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
+        error_report("failed to set irq for PMU");
+        abort();
+    }
 }
 
 static inline void set_feature(uint64_t *features, int feature)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cab5ea9be55c..ff53e9fafb7a 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -195,8 +195,8 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
 
 int kvm_arm_vgic_probe(void);
 
-int kvm_arm_pmu_set_irq(CPUState *cs, int irq);
-int kvm_arm_pmu_init(CPUState *cs);
+void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
+void kvm_arm_pmu_init(CPUState *cs);
 
 #else
 
@@ -205,15 +205,8 @@ static inline int kvm_arm_vgic_probe(void)
     return 0;
 }
 
-static inline int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
-{
-    return 0;
-}
-
-static inline int kvm_arm_pmu_init(CPUState *cs)
-{
-    return 0;
-}
+static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
+static inline void kvm_arm_pmu_init(CPUState *cs) {}
 
 #endif
 
-- 
1.8.3.1

