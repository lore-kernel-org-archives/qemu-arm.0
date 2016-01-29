Received: by 10.25.159.19 with SMTP id i19csp1053597lfe;
        Fri, 29 Jan 2016 08:54:18 -0800 (PST)
X-Received: by 10.55.80.131 with SMTP id e125mr11905547qkb.62.1454086458711;
        Fri, 29 Jan 2016 08:54:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o33si18504080qge.42.2016.01.29.08.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:54:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCJO-00023N-0X
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:54:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJL-0001zO-M0
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJK-00040U-Ha
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:15 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:34798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJJ-00040D-PY
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:14 -0500
Received: by mail-wm0-x22e.google.com with SMTP id 128so60848043wmz.1
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cUaClOHOsI/mnYVCntu90jCxKDVL9nn7DHGtYXXK/KY=;
	b=gKsSVT0YIlfkXaJGzrZvCkUVRtNkZxCiOWP02iSRqtC3WlVJSWUQXuyylhCPXEGxSy
	YGanPRoYGivFFGNpHMZ4joiZl17whp6SMhr2zV4TrlA/GUZi8gpt/PGvbwpiBHLlWJRG
	TIGIwB5N8l4Fz3e5RkSfxH0IXRU0eYLhnmhto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cUaClOHOsI/mnYVCntu90jCxKDVL9nn7DHGtYXXK/KY=;
	b=czCVJ0rzFEUIbl72OfRT9pkTdTTqwXZ8omMRPYcCqMd8XeTV+FfQVSakVFvozOi22p
	RSDYI3BT/gHN/5avkj5X/GKK1xrDLrVDJYG6giKJlzR+cexOT1w99E0T/tWjtdfK757M
	DVUbzYW6LmiaZA3CgUfJtBrtV8Wf2aWkcTjde7oOlSeIonFiuLjMVZi1ReDMyw0jYRUz
	D7wmiCXOjgjAQeCh+o1wFPUecyHaR41+EaxHPrUQZySSaaaOkGL7nvh8bQV5L7uGgzO8
	gwQolsHS+Qxjie6FVqz0QP+NaGhhprNa2s4IPi91GLwYjMPN6QZL7vBLKpn+W4J9MaTK
	WbPg==
X-Gm-Message-State: AG10YORlCuWdyO3+7lEK1Uz07ZmKVfqoeAa8LPpPcleESsAFweLqitPKG1hAiNPg9bCq8pn2
X-Received: by 10.194.21.135 with SMTP id v7mr9823113wje.131.1454086453091;
	Fri, 29 Jan 2016 08:54:13 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:54:11 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:47 +0000
Message-Id: <1454086429-4373-7-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC v2 6/8] hw: platform-bus: enable to map any memory
	region onto the platform-bus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sfxUWJ2adxXF

The platform bus currently is used to map dynamically instantiable
platform device MMIO regions. The platform bus also can be seen as a
pool of free guest physical addresses. We would like to use that pool
to allocate a contiguous reserved IOVA region usable for MSI message
address IOMMU mapping.

This patch introduces platform_bus_map_region which enables to map any
memory region onto the platform bus.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 hw/core/platform-bus.c    | 26 ++++++++++++++++----------
 include/hw/platform-bus.h |  7 +++++++
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index aa55d01..7d0f5e0 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -128,16 +128,14 @@ static void platform_bus_map_irq(PlatformBusDevice *pbus, SysBusDevice *sbdev,
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
@@ -154,13 +152,21 @@ static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
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
index bd42b83..ee19674 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -54,4 +54,11 @@ int platform_bus_get_irqn(PlatformBusDevice *platform_bus, SysBusDevice *sbdev,
 hwaddr platform_bus_get_mmio_addr(PlatformBusDevice *pbus, SysBusDevice *sbdev,
                                   int n);
 
+/**
+ * platform_bus_map_region: map a region into the platform bus
+ * @pbus: platform bus handle
+ * @mr: memory region handle
+ */
+void platform_bus_map_region(PlatformBusDevice *pbus, MemoryRegion *mr);
+
 #endif /* !HW_PLATFORM_BUS_H */
-- 
1.9.1

