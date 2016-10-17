Received: by 10.80.166.35 with SMTP id d32csp638139edc;
        Mon, 17 Oct 2016 12:47:40 -0700 (PDT)
X-Received: by 10.55.21.223 with SMTP id 92mr29020086qkv.235.1476733653084;
        Mon, 17 Oct 2016 12:47:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b139si18761043qka.131.2016.10.17.12.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwDsi-0000R8-9y
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:47:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDkc-0001ZS-8g
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:39:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDka-00080H-C7
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:39:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1bwDka-0007zo-4M; Mon, 17 Oct 2016 15:39:08 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E99D800B0;
	Mon, 17 Oct 2016 19:39:07 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-5-170.ams2.redhat.com [10.36.5.170])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9HJcVFb009529; Mon, 17 Oct 2016 15:39:03 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Mon, 17 Oct 2016 19:38:30 +0000
Message-Id: <1476733110-14293-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
References: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 17 Oct 2016 19:39:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 8/8] hw: vfio: common: Adapt vfio_listeners for
 reserved_iova region
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
	drjones@redhat.com, christoffer.dall@linaro.org, fkan@apm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zZHeFaUd7RZq

In case of reserved iova region, let's declare this region to the
kernel so that it can use it for IOVA/HPA bindings.

This is achieved through the new vfio_register_msi_iova helper.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- squashed "hw: vfio: common: Introduce vfio_register_msi_iova" into
  this patch since checkpatch complained with extern
---
 hw/vfio/common.c | 68 +++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 1e2282c..96be2e8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -214,6 +214,32 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return 0;
 }
 
+/**
+ * vfio_register_msi_iova: registers the MSI iova region
+ *
+ * @container: container handle
+ * @iova: base IOVA of the MSI region
+ * @size: size of the MSI IOVA region
+ */
+static int vfio_register_msi_iova(VFIOContainer *container, hwaddr iova,
+                                  ram_addr_t size)
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
@@ -285,6 +311,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
 static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
+            !memory_region_is_reserved_iova(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
            /*
             * Sizing an enabled 64-bit BAR can cause spurious mappings to
@@ -368,7 +395,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     hwaddr iova, end;
     Int128 llend, llsize;
     void *vaddr;
-    int ret;
+    int ret = -1;
     VFIOHostDMAWindow *hostwin;
     bool hostwin_found;
 
@@ -464,27 +491,38 @@ static void vfio_listener_region_add(MemoryListener *listener,
         return;
     }
 
-    /* Here we assume that memory_region_is_ram(section->mr)==true */
+    /* Here we assume that the memory region is ram or reserved iova */
 
-    vaddr = memory_region_get_ram_ptr(section->mr) +
-            section->offset_within_region +
-            (iova - section->offset_within_address_space);
+    if (memory_region_is_ram(section->mr)) {
+        vaddr = memory_region_get_ram_ptr(section->mr) +
+                section->offset_within_region +
+                (iova - section->offset_within_address_space);
 
-    trace_vfio_listener_region_add_ram(iova, end, vaddr);
+        trace_vfio_listener_region_add_ram(iova, end, vaddr);
 
-    llsize = int128_sub(llend, int128_make64(iova));
+        llsize = int128_sub(llend, int128_make64(iova));
 
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+        ret = vfio_dma_map(container, iova, int128_get64(llsize),
                        vaddr, section->readonly);
-    if (ret) {
-        error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                     "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                     container, iova, int128_get64(llsize), vaddr, ret);
-        goto fail;
+        if (ret) {
+            error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
+                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         container, iova, int128_get64(llsize), vaddr, ret);
+            goto fail;
+        }
+        return;
+    } else if (memory_region_is_reserved_iova(section->mr)) {
+        llsize = int128_sub(llend, int128_make64(iova));
+        ret = vfio_register_msi_iova(container, iova, int128_get64(llsize));
+        if (ret) {
+            error_report("vfio_register_msi_iova(%p, 0x%"HWADDR_PRIx", "
+                         "0x%"HWADDR_PRIx") = %d (%m)",
+                         container, iova, int128_get64(llsize), ret);
+            goto fail;
+        }
+        return;
     }
 
-    return;
-
 fail:
     /*
      * On the initfn path, store the first error in the container so we
-- 
1.9.1

