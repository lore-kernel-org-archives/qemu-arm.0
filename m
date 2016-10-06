Received: by 10.80.163.71 with SMTP id 65csp3117829edn;
        Thu, 6 Oct 2016 02:51:12 -0700 (PDT)
X-Received: by 10.55.74.6 with SMTP id x6mr4281918qka.316.1475747472126;
        Thu, 06 Oct 2016 02:51:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5si7365845qkf.188.2016.10.06.02.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 02:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs5KZ-0006wm-Jx
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 05:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KP-0006qk-7U
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KN-0007BG-BJ
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:51:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs5KN-0007B8-4l; Thu, 06 Oct 2016 05:50:59 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 857E13F755;
	Thu,  6 Oct 2016 09:50:58 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u969okS2016130; Thu, 6 Oct 2016 05:50:56 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 09:50:39 +0000
Message-Id: <1475747444-12552-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
References: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 06 Oct 2016 09:50:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 3/8] hw: vfio: common: Introduce
 vfio_register_msi_iova
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
X-TUID: 9m/toKrJjPBD

vfio_register_msi_iova allows to register the MSI IOVA region.
This IOVA window will be used by the kernel to map MSI doorbells.

The function will become static in subsequent patches. However, since
there is no user yet, the compiler argues; the function is currently
not static and a dummy declaration needs to be added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- rename vfio_register_reserved_iova into vfio_register_msi_iova
- VFIO_DMA_MAP_FLAG_MSI_RESERVED_IOVA renamed into
  VFIO_DMA_MAP_FLAG_RESERVED_MSI_IOVA
---
 hw/vfio/common.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4f4014e..fe8a855 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -212,6 +212,34 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return 0;
 }
 
+/**
+ * vfio_register_msi_iova: registers the MSI iova region
+ *
+ * @container: container handle
+ * @iova: base IOVA of the MSI region
+ * @size: size of the MSI IOVA region
+ */
+int vfio_register_msi_iova(VFIOContainer *container, hwaddr iova,
+                           ram_addr_t size);
+int vfio_register_msi_iova(VFIOContainer *container, hwaddr iova,
+                           ram_addr_t size)
+{
+    int ret;
+    struct vfio_iommu_type1_dma_map map = {
+        .argsz = sizeof(map),
+        .flags = VFIO_DMA_MAP_FLAG_RESERVED_MSI_IOVA,
+        .iova = iova,
+        .size = size,
+    };
+
+    ret = ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map);
+
+    if (ret) {
+        error_report("VFIO_MAP_DMA/RESERVED_MSI_IOVA: %m");
+    }
+    return ret;
+}
+
 static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
-- 
1.9.1

