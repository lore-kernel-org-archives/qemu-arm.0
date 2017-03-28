Received: by 10.25.15.230 with SMTP id 99csp1721182lfp;
        Tue, 28 Mar 2017 10:20:57 -0700 (PDT)
X-Received: by 10.237.36.84 with SMTP id s20mr26933807qtc.271.1490721656918;
        Tue, 28 Mar 2017 10:20:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k23si3972667qke.86.2017.03.28.10.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 10:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csung-0006vA-E6
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 13:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1csunc-0006un-By
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 13:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1csunZ-0002Cs-7R
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 13:20:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1csunZ-0002Cj-21; Tue, 28 Mar 2017 13:20:49 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E42E624DF;
	Tue, 28 Mar 2017 17:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0E42E624DF
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0E42E624DF
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CC7C7DD5A;
	Tue, 28 Mar 2017 17:20:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 28 Mar 2017 19:20:40 +0200
Message-Id: <1490721640-13052-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 28 Mar 2017 17:20:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] hw/intc/arm_gicv3_kvm: Check
 KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS in reset
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, bprakash@caviumnetworks.com,
	bjsprakash.linux@gmail.com, Vijaya.Kumar@cavium.com,
	sgoutham@cavium.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cIk+5MXBUeh3

KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS needs to be checked before
attempting to read ICC_CTLR_EL1; otherwise kernel versions not
exposing this kvm device group will be incompatible with qemu 2.9.

Fixes: 07a5628  ("hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Prakash B <bjsprakash.linux@gmail.com>

---
v1 -> v2:
- use migration_blocker instead of kvm_device_check_attr

I understand the ICC_CTLR_EL1 state only is used in the put() function
which is used for migration
---
 hw/intc/arm_gicv3_kvm.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 81f0403..19aab56 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -614,12 +614,6 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     s = c->gic;
     cpu = ARM_CPU(c->cpu);
 
-    /* Initialize to actual HW supported configuration */
-    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
-                      KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
-                      &c->icc_ctlr_el1[GICV3_NS], false);
-
-    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
     c->icc_pmr_el1 = 0;
     c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
     c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
@@ -628,6 +622,17 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     c->icc_sre_el1 = 0x7;
     memset(c->icc_apr, 0, sizeof(c->icc_apr));
     memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
+
+    if (s->migration_blocker) {
+        return;
+    }
+
+    /* Initialize to actual HW supported configuration */
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+                      KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
+                      &c->icc_ctlr_el1[GICV3_NS], false);
+
+    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
 }
 
 static void kvm_arm_gicv3_reset(DeviceState *dev)
-- 
2.5.5

