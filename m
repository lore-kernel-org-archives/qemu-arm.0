Received: by 10.80.163.71 with SMTP id 65csp314724edn;
        Fri, 23 Sep 2016 01:38:51 -0700 (PDT)
X-Received: by 10.55.19.228 with SMTP id 97mr6111479qkt.34.1474619930980;
        Fri, 23 Sep 2016 01:38:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t61si4399297qtd.143.2016.09.23.01.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 01:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnM0Q-0003jL-ET
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 04:38:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9V-0008NE-5k
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 03:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9U-0000VS-0X
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 03:44:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bnL9T-0000Uf-Fh; Fri, 23 Sep 2016 03:44:07 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAD4CC0567A0;
	Fri, 23 Sep 2016 07:44:06 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-207.ams2.redhat.com
	[10.36.6.207])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8N7hlee032551; Fri, 23 Sep 2016 03:44:03 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri, 23 Sep 2016 09:43:33 +0200
Message-Id: <1474616617-366-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 23 Sep 2016 07:44:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 4/8] kvm-all: Pass requester ID to MSI routing
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
X-TUID: VaAJYEyKnFbE

From: Pavel Fedin <p.fedin@samsung.com>

Introduce global kvm_msi_use_devid flag plus associated
kvm_msi_devid_required() macro. Passes the device ID,
if needed, while building the MSI route entry. Device IDs are
required by the ARM GICv3 ITS (IRQ remapping function is based on
this information).

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v6 -> v7:
- add/use kvm_msi_devid_required() macro

v5 -> v6:
- move the flag in include/sysemu/kvm.h and populate the devid
  information in kvm-all.c

v3 -> v4:
- OR route->flags with KVM_MSI_VALID_DEVID
---
 include/sysemu/kvm.h | 9 +++++++++
 kvm-all.c            | 9 +++++++++
 kvm-stub.c           | 1 +
 3 files changed, 19 insertions(+)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 3e17ba7..df67cc0 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -53,6 +53,7 @@ extern bool kvm_gsi_direct_mapping;
 extern bool kvm_readonly_mem_allowed;
 extern bool kvm_direct_msi_allowed;
 extern bool kvm_ioeventfd_any_length_allowed;
+extern bool kvm_msi_use_devid;
 
 #if defined CONFIG_KVM || !defined NEED_CPU_H
 #define kvm_enabled()           (kvm_allowed)
@@ -169,6 +170,13 @@ extern bool kvm_ioeventfd_any_length_allowed;
  */
 #define kvm_ioeventfd_any_length_enabled() (kvm_ioeventfd_any_length_allowed)
 
+/**
+ * kvm_msi_devid_required:
+ * Returns: true if KVM requires a device id to be provided while
+ * defining an MSI routing entry.
+ */
+#define kvm_msi_devid_required() (kvm_msi_use_devid)
+
 #else
 #define kvm_enabled()           (0)
 #define kvm_irqchip_in_kernel() (false)
@@ -184,6 +192,7 @@ extern bool kvm_ioeventfd_any_length_allowed;
 #define kvm_readonly_mem_enabled() (false)
 #define kvm_direct_msi_enabled() (false)
 #define kvm_ioeventfd_any_length_enabled() (false)
+#define kvm_msi_devid_required() (false)
 #endif
 
 struct kvm_run;
diff --git a/kvm-all.c b/kvm-all.c
index 8a4382e..25e12c2 100644
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
+    if (kvm_msi_devid_required()) {
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
+    if (kvm_msi_devid_required()) {
+        kroute.flags = KVM_MSI_VALID_DEVID;
+        kroute.u.msi.devid = pci_requester_id(dev);
+    }
     if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
         return -EINVAL;
     }
diff --git a/kvm-stub.c b/kvm-stub.c
index 3227127..b1b6b96 100644
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

