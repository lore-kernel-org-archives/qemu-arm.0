Received: by 10.28.71.27 with SMTP id u27csp2111189wma;
        Sat, 17 Feb 2018 11:23:03 -0800 (PST)
X-Google-Smtp-Source: AH8x227qyuljAt46GcSrK2kQqq4gaVI3vEa8AdWkPWk6j+/IUNDcysUQRXZFYQDeneAq2SUROGxF
X-Received: by 10.37.9.82 with SMTP id u18mr7052573ybm.288.1518895383324;
        Sat, 17 Feb 2018 11:23:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895383; cv=none;
        d=google.com; s=arc-20160816;
        b=T/O4we/i/n93o2OatgJbhgXWOP2XEdc8jv0ra8zcM8iFz3yWqSIA4XNzjPrd4rw0ph
         CkB9LWZ86foiKKoWd5JjT0LtisOCVAcAmJevM9FnMEzg25sENG5Q1fLd+xfIJMEU0KCj
         JZyf5yM6veorefl6+3mgItLRwMEoGb4v0yDfDQpd/m+sSOQMjKAt5Oir+qg0S7yvFoP8
         fZSay04LQ7OfAg3NcnC9c/KBDQdObV24Eww2I7LzeXzQBkuzgOvXS33AWRTXOjU7pqaj
         WjR30F0iI3tT1eJVlFCNy4F+Tbj3m5CZ/9OZvxNAF2eySrWDiPTZ7yKWY3aFzAc1dTpt
         hTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZS3buB+VNAOswsXIGPcpsGeXi0Ox8W/wff6nrsU6cL4=;
        b=lTm8A1Pmk60UNN9jl78Io9toFiPOvtlj9CYWFLpkSUeAFgB+/7JkilK3a3QVaN8AGU
         amlZrJCxsY5eC9nKOJXTnNUlk8gHrpAS2scSYIBmkMR78ol5gR8W7aAj6LfK//B3H5cU
         J3JzVKu8bo4P87Xur7Sl7QzfSaIz1fPKeDvLj8I5PQR+KAJvo32iOwsvwVEJwrYdm6dC
         mGxdLpWO5feX1eFs5xtb/0JX1//vjFJYeMN1libK77p7GzWqIBDgU9vvXNX/G6q6sBSi
         wSNdxoiLzOhGNr29Fmm9YdUawJuWj3cm2NRGsfUIclk0+XkuiL9GKwla2PYdS3G9/D/Z
         9Qzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3si2983069ybe.546.2018.02.17.11.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:23:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en84c-0001XI-LP
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:23:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WO-0003cu-D6
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WM-0002V9-UN
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:40 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42006 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1en7WM-0002QY-Lj; Sat, 17 Feb 2018 13:47:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3BC340FB639;
	Sat, 17 Feb 2018 18:47:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 524FB2024CA2;
	Sat, 17 Feb 2018 18:47:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Sat, 17 Feb 2018 19:46:53 +0100
Message-Id: <1518893216-9983-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sat, 17 Feb 2018 18:47:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sat, 17 Feb 2018 18:47:38 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v9 11/14] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eyAOMA/2lQ9S

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
index 1219d00..9f5976a 100644
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
@@ -666,6 +671,28 @@ int kvm_arm_vgic_probe(void)
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

