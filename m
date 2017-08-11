Received: by 10.25.221.202 with SMTP id w71csp970558lfi;
        Fri, 11 Aug 2017 07:38:43 -0700 (PDT)
X-Received: by 10.55.168.140 with SMTP id r134mr20976733qke.204.1502462323567;
        Fri, 11 Aug 2017 07:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502462323; cv=none;
        d=google.com; s=arc-20160816;
        b=nm2EOAZaSnKsCN3Q5MIc9ASaFY19wIJKU0BpdhPraf16fR0zFJGSTFlZU0pymyuXc3
         3R1Y0m4C3wm/AG2S7eFn5RQb+jjyklXv9qzmQdHB/4tZ7DzfD1xc+D/52ZUlGnwstBCZ
         JfBCL+Ckdbn5Ft+SMZuBTESGYg9nCc3hzZKhmaJoHtTCSPo01s61322pRfUIAy5WKTn7
         80r8ZRD+nXxHvN5vb3iFDGuvbXg5Tha0VBSI2G9joSC2VbD5UfoJB5oMETfWfClZHdpY
         /oT+Ic+lV0dmCdCFuLibVs+DqTxHDlOfUu6ngCqzqdUf/7a834Jxd5iJRw3qECQXknh2
         dSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=3udut3GElukQ0MNGBnbDIdK8k5yPBbhECrEqXVaGQuc=;
        b=j0KzrroRQvISZSFScDOCY6nTAHJi0n+L9U2dcN9aDYnC6l2Zzszdn4JG1ybcLp63ql
         mCsZZrfnV2HKb8o+MNGZ0ro7EGspTeApNy0mF1Pwa3/uCHKls9d5O5MOk6jxc1d5RDi6
         op7zkAVESKeLtbbybLm806uK33/m9QYQCO2fwgOIi2l/jZP4RgMfIXX5SRZeHRfpNMPf
         pVqV44laCEye5ZbtOiyZUStCFkaMdPjHkEWCrtkVi6ReudBc+TZdrLgT7yrfyn7b/yEU
         KVcmrdhmVmhir0ERm6BtjeLdbP/lxoTLTAvLS8qXlkdChdPpUqrhQtWjI9PdEtHnFXIi
         a9/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d77si918042qkj.125.2017.08.11.07.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgB5E-0004QI-Qv
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:38:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAsG-0001M1-FY
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAsF-0002k5-75
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:25:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30905)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dgAsC-0002g8-7F; Fri, 11 Aug 2017 10:25:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2D272C96EB;
	Fri, 11 Aug 2017 14:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F2D272C96EB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-162.ams2.redhat.com
	[10.36.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 153EFA01F2;
	Fri, 11 Aug 2017 14:24:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Fri, 11 Aug 2017 16:22:32 +0200
Message-Id: <1502461354-11327-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
References: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 11 Aug 2017 14:25:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v6 7/9] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	edgar.iglesias@gmail.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vwAC4uu6TC6

In case the MSI is translated by an IOMMU we need to fixup the
MSI route with the translated address.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6:
- use IOMMUMemoryRegionClass API

It is still unclear to me if we need to register an IOMMUNotifier
to handle any change in the MSI doorbell which would occur behind
the scene and would not lead to any call to kvm_arch_fixup_msi_route().
---
 target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
 target/arm/trace-events |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7c17f0d..a2fa948 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -20,8 +20,13 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "cpu.h"
+#include "trace.h"
 #include "internals.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/arm/smmu-common.h"
+#include "hw/arm/smmuv3.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
@@ -662,6 +667,28 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    IOMMUMemoryRegionClass *imrc;
+    IOMMUTLBEntry entry;
+    SMMUDevice *sdev;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+    sdev = container_of(as, SMMUDevice, as);
+    imrc = IOMMU_MEMORY_REGION_GET_CLASS(&sdev->iommu);
+
+    entry = imrc->translate(&sdev->iommu, address, IOMMU_WO);
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
+    trace_kvm_arm_fixup_msi_route(address, sdev->devfn,
+                                  sdev->iommu.parent_obj.name,
+                                  entry.translated_addr);
+
     return 0;
 }
 
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 9e37131..8b3c220 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%"
 arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
 arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
+
+# target/arm/kvm.c
+kvm_arm_fixup_msi_route(uint64_t iova, uint32_t devid, const char *name, uint64_t gpa) "MSI addr = 0x%"PRIx64" is translated for devfn=%d through %s into 0x%"PRIx64
-- 
2.5.5

