Received: by 10.223.188.70 with SMTP id a6csp1288597wrh;
        Fri, 1 Sep 2017 10:25:38 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7hj6xaM60c01CFG+YkwKvnsyKywEijAOL8lUsgJJpS9MZzWZkJEJOQ1Xx08AIr7t98eypJ
X-Received: by 10.55.148.199 with SMTP id w190mr3748627qkd.98.1504286738615;
        Fri, 01 Sep 2017 10:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286738; cv=none;
        d=google.com; s=arc-20160816;
        b=M97a2FFNNS7xNR8XdaNxvpqoyj8V6BoyjGHKE4aUnX9a2RTPC7vvVjXO5OgtVjT3Kn
         Btb6nYNJK13Y+qn7G28kEk5TTIzJeLrgrfjBwaUbF0kQgdOw6ZaJsZZJtODAH+zyvvay
         Btoo8noBKUE0V0IS+yTX58hVHZBXEINkaAF3E0Nmqjaq4QFxGW0GoQMPSqbu7rUbSe5M
         bXjmdHhZjmrK6rzSC1eE4vYtqSVZ0tyPrCEQ9vMRJNDlWOPrxNw5MhpEGbnU/Gjpalsa
         7GH359Wvy+wx1/iVa4NjbYhu9TlWsYaHzLQ9AVutXeWvMf7EcLWuO7Eq8OVpcuHYCxx0
         MpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=3udut3GElukQ0MNGBnbDIdK8k5yPBbhECrEqXVaGQuc=;
        b=lmDil07Q0fgV8A4qZEONsdM8uzNDnNu679iiytZ6M6/2aVvNCl8Cv+woyv9NuMVFO0
         3D3nvLXI8M65u1lTNyRVl/FsrkXTEKzORLZysT6SW8a97xI0eRkBFDRJXzRkvLtAhGCv
         ZfS2/nlHgwIoWkWdxibADfVfJGchoPoFhYZ+ebe6I4QL0gjFh2NQia8PZQUi2OgOm/6a
         fFz3JsT5WOP1+YI79lcz2rvJqlyZ81x2s6hvxdgMm3FgzWthCszHtKLh1FzFclFqG6aY
         b0p4rgGfYFx3wSdUKahdd40ZE+iYdUXTO1m0fHlrDZVgjRRoh0IgB/pjNGEw1SG4SpRj
         5WtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h57si613249qtf.172.2017.09.01.10.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:25:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnphI-0007Py-8C
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:25:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfL-000653-7g
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:23:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfK-0003Xt-3l
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:23:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpfA-0003RO-Su; Fri, 01 Sep 2017 13:23:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA4A961483;
	Fri,  1 Sep 2017 17:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CA4A961483
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3ACD52FA0;
	Fri,  1 Sep 2017 17:23:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:14 +0200
Message-Id: <1504286483-23327-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Sep 2017 17:23:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 11/20] target/arm/kvm: Translate the MSI
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
	christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +UAzerZyNrZt

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

