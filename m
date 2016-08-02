Received: by 10.25.21.156 with SMTP id 28csp337736lfv;
        Tue, 2 Aug 2016 11:11:39 -0700 (PDT)
X-Received: by 10.129.112.148 with SMTP id l142mr48043193ywc.222.1470161499120;
        Tue, 02 Aug 2016 11:11:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k62si477458ywf.342.2016.08.02.11.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 11:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUeAE-0007Bf-F7
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 14:11:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6Y-0003a7-LC
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6V-00010R-54
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:07:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bUe6U-00010A-WF; Tue, 02 Aug 2016 14:07:47 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9159980085;
	Tue,  2 Aug 2016 18:07:46 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-58.ams2.redhat.com
	[10.36.7.58])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u72I7UL7024790; Tue, 2 Aug 2016 14:07:43 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Tue,  2 Aug 2016 20:07:24 +0200
Message-Id: <1470161247-10251-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 02 Aug 2016 18:07:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 4/7] target-arm/kvm: Pass requester ID to MSI
 routing functions
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +tySbbjuRkuY

From: Pavel Fedin <p.fedin@samsung.com>

Introduce global kvm_arm_msi_use_devid flag and pass device IDs in
kvm_arch_fixup_msi_route(). Device IDs are required by the ITS.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- OR route->flags with KVM_MSI_VALID_DEVID
---
 target-arm/kvm.c     | 6 ++++++
 target-arm/kvm_arm.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index dbe393c..4675aa3 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
@@ -31,6 +32,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 };
 
 static bool cap_has_mp_state;
+bool kvm_arm_msi_use_devid;
 
 int kvm_arm_vcpu_init(CPUState *cs)
 {
@@ -619,6 +621,10 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    if (kvm_arm_msi_use_devid) {
+        route->flags |= KVM_MSI_VALID_DEVID;
+        route->u.msi.devid = pci_requester_id(dev);
+    }
     return 0;
 }
 
diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
index 633d088..befcfd1 100644
--- a/target-arm/kvm_arm.h
+++ b/target-arm/kvm_arm.h
@@ -121,6 +121,9 @@ bool write_kvmstate_to_list(ARMCPU *cpu);
 void kvm_arm_reset_vcpu(ARMCPU *cpu);
 
 #ifdef CONFIG_KVM
+
+extern bool kvm_arm_msi_use_devid;
+
 /**
  * kvm_arm_create_scratch_host_vcpu:
  * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
-- 
2.5.5

