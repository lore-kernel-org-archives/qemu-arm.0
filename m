Received: by 10.80.163.71 with SMTP id 65csp3169120edn;
        Thu, 6 Oct 2016 04:53:38 -0700 (PDT)
X-Received: by 10.55.110.130 with SMTP id j124mr2196475qkc.111.1475754817922;
        Thu, 06 Oct 2016 04:53:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l133si484232qke.126.2016.10.06.04.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 04:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs7F3-000418-B5
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 07:53:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs73i-0002EG-Bu
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 07:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs73g-0001se-Bo
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 07:41:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs73g-0001sZ-24; Thu, 06 Oct 2016 07:41:52 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EDCCC054901;
	Thu,  6 Oct 2016 11:41:51 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u96BfVNZ005464; Thu, 6 Oct 2016 07:41:48 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 11:41:28 +0000
Message-Id: <1475754090-22681-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1475754090-22681-1-git-send-email-eric.auger@redhat.com>
References: <1475754090-22681-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 06 Oct 2016 11:41:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 6/8] hw: platform-bus: Enable to map any memory
 region onto the platform-bus
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AnbSjYdlUt8a

The platform bus is currently used to map dynamically instantiable
platform device MMIO regions. The platform bus also can be seen as a
pool of free guest physical addresses. We would like to use that pool
to allocate a contiguous reserved IOVA region usable for MSI message
address IOMMU mapping.

This patch introduces platform_bus_map_region which enables to map any
memory region onto the platform bus.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v2 -> v3:
include qapi/error.h
---
 hw/core/platform-bus.c    | 27 +++++++++++++++++----------
 include/hw/platform-bus.h |  7 +++++++
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 329ac67..3fb6f6f 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -24,6 +24,7 @@
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
+#include "qapi/error.h"
 
 
 /*
@@ -127,16 +128,14 @@ static void platform_bus_map_irq(PlatformBusDevice *pbus, SysBusDevice *sbdev,
     sysbus_connect_irq(sbdev, n, pbus->irqs[irqn]);
 }
 
-static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
-                                  int n)
+void platform_bus_map_region(PlatformBusDevice *pbus, MemoryRegion *mr)
 {
-    MemoryRegion *sbdev_mr = sysbus_mmio_get_region(sbdev, n);
-    uint64_t size = memory_region_size(sbdev_mr);
+    uint64_t size = memory_region_size(mr);
     uint64_t alignment = (1ULL << (63 - clz64(size + size - 1)));
     uint64_t off;
     bool found_region = false;
 
-    if (memory_region_is_mapped(sbdev_mr)) {
+    if (memory_region_is_mapped(mr)) {
         /* Region is already mapped, nothing to do */
         return;
     }
@@ -153,13 +152,21 @@ static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
     }
 
     if (!found_region) {
-        error_report("Platform Bus: Can not fit MMIO region of size %"PRIx64,
-                     size);
-        exit(1);
+        error_setg(&error_fatal,
+                   "Platform Bus: Can not fit region %s of size %"PRIx64,
+                   mr->name, size);
     }
 
-    /* Map the device's region into our Platform Bus MMIO space */
-    memory_region_add_subregion(&pbus->mmio, off, sbdev_mr);
+    /* Map the region into our Platform Bus MMIO space */
+    memory_region_add_subregion(&pbus->mmio, off, mr);
+}
+
+static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
+                                  int n)
+{
+    MemoryRegion *sbdev_mr = sysbus_mmio_get_region(sbdev, n);
+
+    platform_bus_map_region(pbus, sbdev_mr);
 }
 
 /*
diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
index a00775c..6d3a664 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -54,4 +54,11 @@ int platform_bus_get_irqn(PlatformBusDevice *platform_bus, SysBusDevice *sbdev,
 hwaddr platform_bus_get_mmio_addr(PlatformBusDevice *pbus, SysBusDevice *sbdev,
                                   int n);
 
+/**
+ * platform_bus_map_region: map a MemoryRegion into the platform bus
+ * @pbus: platform bus handle
+ * @mr: memory region handle
+ */
+void platform_bus_map_region(PlatformBusDevice *pbus, MemoryRegion *mr);
+
 #endif /* HW_PLATFORM_BUS_H */
-- 
1.9.1

