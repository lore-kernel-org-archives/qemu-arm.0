Received: by 10.80.163.71 with SMTP id 65csp213065edn;
        Fri, 9 Sep 2016 10:35:57 -0700 (PDT)
X-Received: by 10.200.40.36 with SMTP id 33mr5294033qtq.53.1473442557691;
        Fri, 09 Sep 2016 10:35:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e93si2725041qtd.127.2016.09.09.10.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 10:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biPiX-0005Zb-1X
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 13:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdp-0001U2-NK
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdo-0005Pz-7X
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:31:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1biPdn-0005Ps-Vg; Fri, 09 Sep 2016 13:31:04 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EDF4DA6;
	Fri,  9 Sep 2016 17:31:03 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-170.ams2.redhat.com
	[10.36.7.170])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u89HUlQs024546; Fri, 9 Sep 2016 13:31:00 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri,  9 Sep 2016 19:30:33 +0200
Message-Id: <1473442237-3746-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 09 Sep 2016 17:31:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 4/8] kvm-all: Pass requester ID to MSI routing
 functions
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
X-TUID: Xei0Dz0/ueot

From: Pavel Fedin <p.fedin@samsung.com>

Introduce global kvm_msi_use_devid flag and pass the device ID,
if needed, while building the MSI route entry. Device IDs are
required by the ARM GICv3 ITS (IRQ remapping function is based on
this information).

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v6:
- move the flag in include/sysemu/kvm.h and populate the devid
  information in kvm-all.c

v3 -> v4:
- OR route->flags with KVM_MSI_VALID_DEVID
---
 include/sysemu/kvm.h | 1 +
 kvm-all.c            | 9 +++++++++
 kvm-stub.c           | 1 +
 3 files changed, 11 insertions(+)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index c9c2436..c31c810 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -53,6 +53,7 @@ extern bool kvm_gsi_direct_mapping;
 extern bool kvm_readonly_mem_allowed;
 extern bool kvm_direct_msi_allowed;
 extern bool kvm_ioeventfd_any_length_allowed;
+extern bool kvm_msi_use_devid;
 
 #if defined CONFIG_KVM || !defined NEED_CPU_H
 #define kvm_enabled()           (kvm_allowed)
diff --git a/kvm-all.c b/kvm-all.c
index ebf35b0..df3bcde 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -119,6 +119,7 @@ bool kvm_readonly_mem_allowed;
 bool kvm_vm_attributes_allowed;
 bool kvm_direct_msi_allowed;
 bool kvm_ioeventfd_any_length_allowed;
+bool kvm_msi_use_devid;
 
 static const KVMCapabilityInfo kvm_required_capabilites[] = {
     KVM_CAP_INFO(USER_MEMORY),
@@ -1275,6 +1276,10 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
     kroute.u.msi.address_lo = (uint32_t)msg.address;
     kroute.u.msi.address_hi = msg.address >> 32;
     kroute.u.msi.data = le32_to_cpu(msg.data);
+    if (kvm_msi_use_devid) {
+        kroute.flags = KVM_MSI_VALID_DEVID;
+        kroute.u.msi.devid = pci_requester_id(dev);
+    }
     if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
         kvm_irqchip_release_virq(s, virq);
         return -EINVAL;
@@ -1308,6 +1313,10 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
     kroute.u.msi.address_lo = (uint32_t)msg.address;
     kroute.u.msi.address_hi = msg.address >> 32;
     kroute.u.msi.data = le32_to_cpu(msg.data);
+    if (kvm_msi_use_devid) {
+        kroute.flags = KVM_MSI_VALID_DEVID;
+        kroute.u.msi.devid = pci_requester_id(dev);
+    }
     if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
         return -EINVAL;
     }
diff --git a/kvm-stub.c b/kvm-stub.c
index 64e23f6..6f896e9 100644
--- a/kvm-stub.c
+++ b/kvm-stub.c
@@ -31,6 +31,7 @@ bool kvm_gsi_direct_mapping;
 bool kvm_allowed;
 bool kvm_readonly_mem_allowed;
 bool kvm_ioeventfd_any_length_allowed;
+bool kvm_msi_use_devid;
 
 int kvm_destroy_vcpu(CPUState *cpu)
 {
-- 
2.5.5

