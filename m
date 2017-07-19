Received: by 10.25.44.15 with SMTP id s15csp853401lfs;
        Wed, 19 Jul 2017 06:48:22 -0700 (PDT)
X-Received: by 10.55.41.153 with SMTP id p25mr144787qkp.211.1500472102781;
        Wed, 19 Jul 2017 06:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500472102; cv=none;
        d=google.com; s=arc-20160816;
        b=dpsr2IHbGbTzEt+FkiUMxSal+Bjnq+mPS8PMLyZtPgTnrwtFXLo/K6EuTVpmWtTgWF
         cJRwzGm3cavzpMxvvR69DCWB/b5QFUQkr948zXHNTNgqMnmKVOG31fGThwKqViep+9Mr
         m5NkKEJgvj9tR+DiCIUZpc+U3ejpPgRiZkbWLB7lHTbTp2e/3NBW1EVwRR37/DBnMPN7
         gEEh8taYYLPGnLX4nrJYaSKaHieeCgdgsYdDJIWIH6W8HaMok8jNil1qkhh63idRMixn
         n9eCEtlwJ7wodsPswDQiJs2deio4uAaDGwjqphLz2hoM+lUBAXDm2DFLJiCYHJFbpwVE
         xHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=P/YdYJKf5UMeO3rkV8PUi4gMdbsy53aj2GOfNm8GVsQ=;
        b=xw/QlbDyjO8DBaJvfnADcRP7bFoQfRswE/2RinArxprFdBHICRYNoYIgNftmJASOkt
         sUdvbNlHEMbzbCovUJoIJnVTc9FR+/NsCo1A6sG/C2YgVrqbsD6yJRsOqZ6m6eBrLgAI
         sAasNR2WhEh7nYCjqPnCAZheHwzCawx+nHW+OsBRfRbgwYuK8z1mmBcqAjwvttiToPPT
         SBPHHsrYx7BaLSmbDUSF+o5fn/O+PAWD0wxQg86JiRckKvPIKPzumdDenQFb//jQgMyR
         z/LVmS+IMQzbb2nNVuYVtAFpz6UgjAJVCnX3+xz8sEHzPAMaQJN/w7VSlbVzqqu4r6eL
         JLtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r126si79521qkd.48.2017.07.19.06.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Jul 2017 06:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXpKt-0001if-Va
	for alex.bennee@linaro.org; Wed, 19 Jul 2017 09:48:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpKl-0001ge-4W
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpKg-00088D-5n
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:48:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dXpKg-00087u-0B; Wed, 19 Jul 2017 09:48:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 914812FFC2A;
	Wed, 19 Jul 2017 13:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 914812FFC2A
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 914812FFC2A
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 944DA17DE8;
	Wed, 19 Jul 2017 13:40:00 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 19 Jul 2017 09:39:56 -0400
Message-Id: <1500471597-2517-4-git-send-email-drjones@redhat.com>
In-Reply-To: <1500471597-2517-1-git-send-email-drjones@redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 19 Jul 2017 13:40:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/4] hw/arm/virt: allow pmu instantiation with
 userspace irqchip
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
X-TUID: FyksoSCL4g5E

Move the in-kernel-irqchip test to only guard the set-irq
stage, not the init stage of the PMU.  Also add the PMU to
the KVM device irq line synchronization to enable its use.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c      | 3 ++-
 target/arm/kvm.c   | 6 +++++-
 target/arm/kvm64.c | 3 +--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7157a028adce..a215330444da 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -496,7 +496,8 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
             return;
         }
         if (kvm_enabled()) {
-            if (!kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
+            if (kvm_irqchip_in_kernel() &&
+                !kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
                 return;
             }
             if (!kvm_arm_pmu_init(cpu)) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7c17f0d629d7..211a7bf7befd 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -567,7 +567,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
             switched_level &= ~KVM_ARM_DEV_EL1_PTIMER;
         }
 
-        /* XXX PMU IRQ is missing */
+        if (switched_level & KVM_ARM_DEV_PMU) {
+            qemu_set_irq(cpu->pmu_interrupt,
+                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_PMU));
+            switched_level &= ~KVM_ARM_DEV_PMU;
+        }
 
         if (switched_level) {
             qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e26638a6fac1..ec7d85314acc 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -506,8 +506,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
-    if (!kvm_irqchip_in_kernel() ||
-        !kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
+    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
             cpu->has_pmu = false;
     }
     if (cpu->has_pmu) {
-- 
1.8.3.1

