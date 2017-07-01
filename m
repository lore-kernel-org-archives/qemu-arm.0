Received: by 10.25.227.6 with SMTP id a6csp73194lfh;
        Sat, 1 Jul 2017 09:47:43 -0700 (PDT)
X-Received: by 10.200.44.186 with SMTP id 55mr15195112qtw.173.1498927663434;
        Sat, 01 Jul 2017 09:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498927663; cv=none;
        d=google.com; s=arc-20160816;
        b=0uBw1vt4O3XCaRTWOpmy4vmoZgG2nB1GyIgr5qfBngM+v/R9K+c+UoytQYNUrg4Umt
         654BZ3srhyZPY79D+8mknIPqFBHOxxglKDO12IM8XHtvjOiwVmhCpOVNWG62hJWH8spX
         JAVqW38Rix0EjL+ISsIVsMDrVTt58mEgrC2UWtFfKrGK5APAKYCpLa9cfH5N3vWtv476
         NWfsgP7JEFievFX7TtI0qJ8QlDNN9pPFXq/8+D2FwsLSywQs1CyLhst/f4Y3KI9Jz91a
         ZidhmqAiJaLFWHG3cc8qvjLyKXlhlqEFUK+9en9UKxAIG5sEq5oMKbqfFMUWgM4zeLhA
         eX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=MOuKLHD+5RH5rfNMrOZpIn3u7ItOF25erjFbxbLIRMY=;
        b=ttlQEiBwW8S1cs4Gu1Nsf1pQGP9Aup83n0y06B9P9Av3XWUPpWkef24l2N7vdBq29Z
         eRlwkc+hL/ui9JWaNIjqDjA+KWn88SLrfOfn8fEscKr+sP6SYYjElWIy/WKl/LQ25FVz
         x8fpZWUhirwPgLzcgG6ZvGnxHfrVhMjkohgrMWGF/woIy5Z02hfiIuP9iYfZXxG+DQbS
         R2wr4VrqC0kfpj6q1GFWEwbbefKCr4dBI3X618uZR43RqYKngFldzO9EmEV/Oswpdh09
         5FqnLLwkpeT6Otr6ICgazicz786XA/aLOn2ECoOnIcOo70eTh8/T53yNhax5BCkuR0lG
         0TtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si2178645qkc.238.2017.07.01.09.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jul 2017 09:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRLYa-0008FM-M5
	for alex.bennee@linaro.org; Sat, 01 Jul 2017 12:47:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYL-00083x-8H
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYI-0000Q7-Su
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dRLYI-0000PC-Mj; Sat, 01 Jul 2017 12:47:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85D9A80462;
	Sat,  1 Jul 2017 16:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 85D9A80462
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 85D9A80462
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5195863C3;
	Sat,  1 Jul 2017 16:47:20 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sat,  1 Jul 2017 12:47:17 -0400
Message-Id: <1498927637-14496-4-git-send-email-drjones@redhat.com>
In-Reply-To: <1498927637-14496-1-git-send-email-drjones@redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 01 Jul 2017 16:47:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 3/3] hw/arm/virt: allow pmu instantiation with
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
Cc: peter.maydell@linaro.org, agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W2O5utb50MQl

Move the in-kernel-irqchip test to only guard the creation,
not the init'ing of the PMU.  Also add the PMU to the KVM
device irq line synchronization to enable its use.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c      | 2 +-
 target/arm/kvm.c   | 6 +++++-
 target/arm/kvm64.c | 3 +--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0cb8b479232d..53592fd0f30c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -495,7 +495,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
         if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             return;
         }
-        if (kvm_enabled() &&
+        if (kvm_irqchip_in_kernel() &&
             !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
             return;
         }
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
index d94e0a04f015..54e58e407812 100644
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

